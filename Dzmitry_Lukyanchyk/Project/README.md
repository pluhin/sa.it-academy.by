H1 README.md
H2 Project 
H3 Lukyanchyk Dzmitry


H2 Project plan
H3 Common

    Create your project scheme
    Choice your application for deployment (as example can be any from this list od CMS)
    Demo shouldn't be not longer than 10 mins

H2 CI
H3 Organize the CI platform for development team:

    Git repository for code application code
        branches, README.md
    Git repository for ansible playbooks
        branches, README.md
    Docker deployment substructure
        dockerfile/compouse
    Docker hub auto-create image

H2 CD
H3 Develop and delivery CD solution for your application:

    Continuous deployment by webhook and(or) by schedule
    Group deployment with parameters (version/features/patrly upgrade)
    Prepare Jenkinsfile/Pipeline for deployment
    Organise deployment application as docker for QA team on demand
    Provide performance testing for your Pipeline
