## Project's reporter: Valery, Skop

### Group number: m-sa2-17-21
---

## Description of application for deployment

- [WordPress](https://wordpress.com/)
- Back: PHP and SQL. Front: HTML, CSS, JavaScript, jQuery and AJAX
- MySQL


## Pipeline. High Level Design

[Scheme here](https://raw.githubusercontent.com/kart-valery/project_sa/main/0002.jpg)

## Technologies which were used in project

Orchestration: Jenkins

Automation tools: Ansible

CI description: manually, prepared for cron

Tests: yamllint and standard tools Ansible and Jenkins

*and GitHub, Docker, Groovy ...

## Deployment flows short description:

Developer push code to GitHub repo (or merge other branch to main), Jenkins copy config file and transmits to ansible, launch ansible playbook, where spend tests, update and rollback config in host for deploys containers (db,app). Also Jenkins and Ansible send notification to Slack.

## Rollback flow description and implementation:

Rollback implemented in playbook. Where check avalible URL, if not avalible, that delete new config, rollback to old and run containers.
## Links
[github_repo](https://github.com/kart-valery/project_sa)
