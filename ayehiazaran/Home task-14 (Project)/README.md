## Project plan

1. CI
Organize the CI platform for development team:
 - Git repository for code application code
    - branches, README.md
 - Git repository for ansible playbooks
    - branches, README.md
 - Docker deployment substructure
    - dockerfile/compouse
    - Docker hub auto-create image

 2. CD 
Develop and delivery CD solution for the application:
    - Continuous deployment by webhook and by schedule
    - Group deployment with parameters (version/features/patrly upgrade)
    - Prepare Jenkins file for deployment
    - Organise deployment application as docker for QA team on demand
    - Provide performance testing for your Pipeline

