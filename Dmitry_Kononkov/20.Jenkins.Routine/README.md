# 20. Jenkins. Routine
## Add to your Jenkins job-dsl plugin
![job-dsl](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-28%20%D0%B2%2020.53.31.png?raw=true)
## Create repository with jobs from the Jenkins (simple add there folder jobs from Jenkins server)
[git-repo-seed](https://github.com/ussnorma/seed)
## Seed job:
```groovy
job('HW-20-1') {
  steps {
        shell('git clone https://github.com/ussnorma/seed.git && ls -la ./seed && rm -rf ./seed')
  }
}
```
![config-seed](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-28%20%D0%B2%2022.31.12.png?raw=true)
### Output
![output-lob-dsl](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-28%20%D0%B2%2022.14.07.png?raw=true)
## Finish
![finish](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-28%20%D0%B2%2022.30.22.png?raw=true)