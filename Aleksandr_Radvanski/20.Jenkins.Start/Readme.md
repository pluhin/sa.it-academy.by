https://github.com/aionfiend/20.-Jenkins.-Start


```
   #Task №1
Существуют две главные причины такого избытка:
1. Дерево зависимостей (Dependencies): Jenkins спроектирован по модульному принципу Jenkins: что это, как установить и 
настроить / Skillbox Media. Один сложный плагин (например, Ansible или Pipeline) никогда не работает в одиночку Jenkins 
Configuration as Code: Plugins. Ему требуются десятки вспомогательных библиотек (API-плагины для разбора учетных данных,
работы с Git, вывода таймстампов, отрисовки UI и т.д.). Когда вы запрашиваете установку одного пакета, Jenkins автоматически
выкачивает весь его транзитивный шлейф зависимостей Jenkins Configuration as Code: Plugins.
2. Набор Suggested Plugins: Выбрав пункт "Install suggested plugins" на этапе первичной инициализации, дали согласие 
на развертывание базовой экосистемы автоматизации Jenkins default suggested plugin list. Сюда входят мощные фреймворки 
(целое семейство плагинов для поддержки Pipeline, интеграция с системами контроля версий Git, плагины авторизации и 
форматирования текста) Jenkins install default plugins after skipping during installation. То, что со стороны выглядит 
как «голый» Jenkins, на деле представляет собой конструктор, собранный из 50+ мелких модулей.
3. • Состояние Jenkins: Вся конфигурация, включая плагины, пользователей и настройки безопасности, хранится в виде 
XML-файлов и папок внутри единого каталога JENKINS_HOME. В Jenkins нет внешней БД.
   • Резервное копирование: В бэкап обязательно включаются глобальные .xml настройки, папки secrets/, users/, plugins/, 
а также файлы конфигураций задач jobs/*/config.xml. Логи старых сборок и временные рабочие папки (workspace/) можно 
исключить для экономии места.
   • Область безопасности (Security Realm) vs Стратегия авторизации: Первая отвечает за аутентификацию (проверка пароля/
токена через локальную базу, LDAP или GitHub OAuth — ответ на вопрос "Кто вы?"). Вторая отвечает за авторизацию 
(распределение прав через матрицы или роли — ответ на вопрос "Что вам разрешено делать?").


    #Task №2
В ходе работы была успешно спроектирована и развернута автоматизированная сквозная цепочка:
GitHub Actions → ngrok-туннель → Kubernetes Ingress → Jenkins Pipeline.

Webhook - https://xxxx.ngrok-free.dev/generic-webhook-trigger/invoke?token=my-super-secret-token
   ngrok                                                                                                                                                                                                                   (Ctrl+C to quit)

Jev is on ngrok.ai

Session Status                online                                                                                                                                                                                                    
Account                       aion.fiend@gmail.com (Plan: Free)                                                                                                                                                                         
Version                       3.39.12                                                                                                                                                                                                   
Region                        Europe (eu)                                                                                                                                                                                               
Latency                       41ms                                                                                                                                                                                                      
Web Interface                 http://127.0.0.1:4040                                                                                                                                                                                     
Forwarding                    https://xxxxxxxx.ngrok-free.dev -> http://jenkins.k8s-1.sa:80

Connections                   ttl     opn     rt1     rt5     p50     p90                                                                                                                                                               
12      0       0.00    0.00    65.19   65.99    
 Тест API:
curl -X POST -u "admin:xxxxxxxxxxxxx" "http://jenkins.k8s-1.sa/job/check-system-user/buildWithParameters?USERNAME=root"

[ GitHub Action (Вручную) ] ──┐
│
[ GitHub Репозиторий (Push) ] ┼─> [ POST /generic-webhook-trigger/invoke?token=... ]
│
▼
[ ngrok-туннель ] (Host: jenkins.k8s-1.sa)
│
▼
[ k8s Ingress-Nginx ]
│
▼
[ Jenkins Controller ] (Отключение CSRF, HTTP 200)
│
▼
[ Проверка коммитов ]
/          \
Есть файл 'main'       Нет файла 'main'
/                    \
▼                      ▼
[ Работа Пайплайна ]     [ Статус: ABORTED ]


• Jenkins Pipeline (check-system-user): Параметризованный скрипт. Точная проверка существования учетной записи в системе /etc/passwd выполняется через утилиту getent passwd $USERNAME.
• Сетевой туннель (ngrok): Публичный прокси-сервер на MacBook запущен с флагом сохранения оригинального домена кластера Kubernetes (--host-header=jenkins.k8s-1.sa). Это обеспечивает беспрепятственный проход пакетов через Ingress-Nginx.
• Универсальный шлюз триггеров: На стороне Jenkins активирован плагин Generic Webhook Trigger, защищенный уникальным токеном доступа (?token=my-super-secret-token). Этот эндпоинт по умолчанию полностью освобожден от проверок CSRF-крошек, что решило проблему блокировок со стороны Jetty/Stapler.
• GitHub Actions Workflow & Webhook: Сценарий GitHub Actions генерирует JSON-пакет ({"username": "root"}), который доставляется в кластер. В настройках самого репозитория (Settings → Webhooks) адрес доставки (Payload URL) перенаправлен на шлюз плагина, что гарантирует получение статуса Response 200 OK.
• Фильтрация изменений (Защита от лишних сборок): В код пайплайна внедрена проверка GenericWebhookCause. С помощью анализа коммитов (currentBuild.changeSets) пайплайн автоматически переводит сборку в статус ABORTED (Принудительно отменено), если в составе пуша не обнаружены изменения в файле с именем main.
```
