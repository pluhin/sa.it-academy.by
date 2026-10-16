
## 1. Установка компонента kube-prometheus-stack
Развертывание стека мониторинга было выполнено в пространство имен `monitoring` с использованием Helm-чарта `prometheus-community/kube-prometheus-stack`. 
Для конфигурации использовался собственный файл значений `values.yaml`.

Поскольку в кластере отсутствует StorageClass по умолчанию, а существующий `nfs-client` настроен в режиме статического распределения 
(`WaitForFirstConsumer` / `no-provisioner`), были предварительно созданы объекты `PersistentVolume` (`pv-monitoring-grafana` и `pv-monitoring-prometheus`), 
привязанные к локальным путям узла `node1`. В файле `values.yaml` была настроена жесткая привязка PVC через директиву `volumeName`.

После корректировки прав доступа на физические директории (`chmod 777`) и скачивания образов, все поды перешли в статус 
**Running**, а Persistent Volume Claims (PVC) успешно перешли в статус **Bound**.

## 2. Анализ целей (Targets) в Prometheus
После настройки перенаправления портов (`kubectl port-forward svc/kube-prometheus-stack-prometheus -n monitoring 9090:9090`) был произведен 
анализ раздела **Status → Targets**:
* **Общее количество целей (Endpoints):** 19
* **Количество доступных целей (UP):** 17
* **Количество недоступных целей (DOWN):** 2

### Причина недоступности kube-proxy:
Недоступной задачей является `serviceMonitor/monitoring/kube-prometheus-stack-kube-proxy/0` (обе цели для узлов `node1` и `node2` возвращают ошибку 
`connect: connection refused`).

Данная ситуация **не является неисправностью кластера**. Причина кроется в конфигурации компонента `kube-proxy`, которая находится в его `ConfigMap`
(`kube-proxy` в пространстве имен `kube-system`). Внутри секции `KubeProxyConfiguration` задан следующий параметр безопасности:
```yaml
metricsBindAddress: "127.0.0.1:10249"
```
По умолчанию `kube-proxy` слушает и отдает метрики только на локальном петлевом интерфейсе (`localhost` / `127.0.0.1`) самого узла. 
Prometheus пытается собрать метрики, обращаясь к внешним IP-адресам нод (`192.168.208.1` и `192.168.208.2`), в результате чего сетевой стек узла отклоняет запросы. 
Для исправления требуется изменить адрес на `0.0.0.0:10249` и перезапустить поды `kube-proxy`.

## 3. Интеграция с Grafana и создание дашборда
Интерфейс Grafana был успешно открыт через проброс портов на `localhost:3000`. Пароль администратора был извлечен из секретов Kubernetes. 
Prometheus успешно подключен в качестве источника данных (`Data Source`) по умолчанию.

В систему был импортирован кастомный дашборд (JSON-модель), содержащий следующие элементы:
1. **Переменная узла (`$node`):** Динамический выпадающий список, формируемый на основе Prometheus-запроса `label_values(kube_pod_info, node)`.
2. **Панель CPU Usage per Pod:** График утилизации процессора по подам в пространстве имен `monitoring`, использующий функцию 
`sum(rate(container_cpu_usage_seconds_total{namespace="monitoring"}[5m])) by (pod)`.
3. **Панель Memory Working Set per Pod:** График оперативной памяти, использующий метрику `sum(container_memory_working_set_bytes{namespace="monitoring"})by (pod)`.
4. **Панель Pods Count per Node:** Столбчатая диаграмма (Bar Chart), отображающая количество подов на узлах в зависимости от выбранного
значения переменной: `sum(kube_pod_info{node=~"$node"}) by (node)`.
