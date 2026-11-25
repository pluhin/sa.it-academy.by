# Занятие 04 — GitLab CI

Файлы с занятия. В репозитории каждая демка лежала в своей ветке
(`demo-01` … `demo-05`), потому что `.gitlab-ci.yml` работает только из
корня — держать пять штук рядом нельзя.

| Папка | Что показывает | Файлы |
|---|---|---|
| `demo-01` | первый пайплайн: `stages`, `jobs`, `image` | `.gitlab-ci.yml` |
| `demo-02` | `artifacts`, `rules`, `needs` (DAG) | `.gitlab-ci.yml` |
| `demo-03` | сборка образа через kaniko, push в реестр проекта | `.gitlab-ci.yml`, `Dockerfile`, `index.html` |
| `demo-04` | свой runner по `tags`, маскированные переменные, Slack | `.gitlab-ci.yml`, `register-runner.sh` |
| `demo-05` | `environments`, ручной прод, review apps | `.gitlab-ci.yml` |

## Как повторить у себя

```bash
git checkout master
git checkout -b demo-01
cp demo-01/.gitlab-ci.yml .gitlab-ci.yml
git add --all && git commit -m "demo-01" && git push --set-upstream origin demo-01
```

Дальше смотреть **Build → Pipelines** в GitLab. Для остальных демок то же
самое, только с другой веткой и другой папкой.

Что нужно завести в проекте заранее:

- **demo-03** — ничего, kaniko логинится в реестр проекта по
  предопределённым переменным (`$CI_REGISTRY*`), отдельный секрет не нужен.
- **demo-04** — свой runner (`register-runner.sh`, запускать на своей
  машине с `RUNNER_TOKEN=glrt-...`) и переменная `SLACK_WEBHOOK_URL`
  в **Settings → CI/CD → Variables**, галки *Masked* и *Protected*.
- **demo-05** — ничего, деплой только печатает echo; смысл в том, как это
  выглядит во вкладке **Operate → Environments**.

Разбор теории и те же демки с комментариями — в основном репозитории курса,
папка `04.GitLab.CI/`.

## History

```bash
  100  ssh-keygen
  101  cat .ssh/id_ed25519.pub
  102  cd 02.Git/
  103  ls
  104  git remote add origin git@gitlab.com:sa-it-academy-by/md-sa2-37-26.git
  105  git push -u origin --all
  106  git checkout master
  107  git checkout -b demo-01
  108  vim .gitlab-ci.yml
  109  git add --all
  110  git commit -m "demo-01"
  111  git push
  112  git push --set-upstream origin demo-01
  113  vim .gitlab-ci.yml
  114  git checkout master
  115  git checkout -b demo-02
  116  vim .gitlab-ci.yml
  117  git add --all
  118  git commit -m "demo-02"
  119  git push --set-upstream origin demo-02
  120  git checkout master
  121  git checkout -b demo-03
  122  vim .gitlab-ci.yml
  123  vim Dockerfile
  124  vim index.html
  125  ls
  126  ls -al
  127  vim .gitlab-ci.yml
  128  git add --all
  129  git commit -m "demo-02"
  130  git commit --amend -a
  131  git push --set-upstream origin demo-03
  132  git checkout master
  133  git checkout -b demo-04
  134  vim .gitlab-ci.yml
  135  vim register-runner.sh
  136  chmod +x register-runner.sh
  137  export RUNNER_TOKEN=glrt-XXXXXXXX
  138  ./register-runner.sh
  139  git status
  140  git add --all
  141  git commit -m "demo-04"
  142  git push --set-upstream origin demo-04
  143  git checkout master
  144  git checkout -b demo-05
  145  vim .gitlab-ci.yml
  146  git add .gitlab-ci.yml
  147  git commit -m "demo-05"
  148  git push --set-upstream origin demo-05
  149  pwd
  150  history
```