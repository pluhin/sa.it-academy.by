## Homework Assignment 1: Jenkins API

Script to check if user exists in /etc/passwd

```shell
if [[ -z `cat /etc/passwd | grep $user_name` ]]
then
 RESULT="User doesn't exist"
else
 RESULT="User exist"
fi
echo $RESULT
```

[Github-action with parameter user_name](https://github.com/Julie717/github-actions/blob/master/.github/workflows/username_for_jenkins.yaml)

![run github action](../20.Jenkins.Routine/pictures/1.jpg)
![run github action](../20.Jenkins.Routine/pictures/2.jpg)

Github action trigger jenkins job

Jenkins job settings

![run github action](../20.Jenkins.Routine/pictures/3.jpg)
![run github action](../20.Jenkins.Routine/pictures/4.jpg)
![run github action](../20.Jenkins.Routine/pictures/5.jpg)
![run github action](../20.Jenkins.Routine/pictures/6.jpg)

Result of running job

![run github action](../20.Jenkins.Routine/pictures/7.jpg)
![run github action](../20.Jenkins.Routine/pictures/8.jpg)

## Homework Assignment 2: Webhook

Go to [smee](https://smee.io/) to receive webhook url. Add [webhook](../20.Jenkins.Routine/smee.yaml) to the cluster

```shell
kubectl apply -f smee.yaml
```
Add webhook to github

![run github action](../20.Jenkins.Routine/pictures/9.jpg)

Create Jenkins job to check that this job will start on push to the github

![run github action](../20.Jenkins.Routine/pictures/10.jpg)
![run github action](../20.Jenkins.Routine/pictures/11.jpg)

Push something to the [github-actions](https://github.com/Julie717/github-actions)
and check that Jenkins job started to run

![run github action](../20.Jenkins.Routine/pictures/12.jpg)