#03.GIT.Hosting

### https://bitbucket.org/CHESTER-ART/git_3/
### https://github.com/CHESTER-ART/git_3
### https://gitlab.com/CHESTER-ART/git_3

### automate scrit for pusjing all changws to all my remote repo
```
#!/bin/bash
echo "Pushing GitHub..."
git push -u origin_github master -f && echo "Pushed GitHub"
sleep 1
echo "Pushing GitLab"
git push -u origin_gitlab master -f && echo "Pushed GitLab"
sleep 1
echo "Pushing Bitbucket"
git push -u origin_bitbucket master -f && echo "Pushed Bitbucket"
echo "Done"
```

### Create slack notification

![1](https://thumb.cloud.mail.ru/weblink/thumb/xw1/mb37/EDue9ADPV?x-email=maildrop%40mail.ru)

### script result

![1](https://thumb.cloud.mail.ru/weblink/thumb/xw1/zaL3/nC7pxfAk2?x-email=maildrop%40mail.ru)
