# 1. My repositories's urls

> [My GitLab](https://gitlab.com/zhivushko_artem)
> [My Github](https://github.com/ArtZhiv)
> 
> [zhivushko_artem / auth_test · GitLab](https://gitlab.com/zhivushko_artem/auth_test)
> [ArtZhiv/test_zhivart (github.com)](https://github.com/ArtZhiv/test_zhivart)

```bash
alias gogit='go run scriptToGit.go "/mnt/c/src/testrepo" "Artem_Zhivushko/03.Git.Hosting" "/home/zhivushko_av/.ssh/id_rsa"'
```

# Script code

> You need to install Go.
> As well as some dependencies:
> - go get github.com/go-git/go-git/v5
> - go get github.com/sirupsen/logrus
> - go get github.com/tcnksm/go-gitconfig

[scriptToGit.go](./scriptToGit.go)

```go
package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"time"

	"github.com/go-git/go-git/v5"
	"github.com/go-git/go-git/v5/plumbing/object"
	"github.com/go-git/go-git/v5/plumbing/transport/ssh"
	log "github.com/sirupsen/logrus"
	"github.com/tcnksm/go-gitconfig"
)

func init() {
	log.SetOutput(os.Stdout)
}

func main() {
	var path string = os.Args[1]
	var subFolder string = os.Args[2]
	var privateKeyFile string = os.Args[3]

	var password string
	if len(os.Args) == 5 {
		password = os.Args[4]
	}
	_, err := os.Stat(privateKeyFile)
	if err != nil {
		log.Warningf("read file %s failed %s\n", privateKeyFile, err.Error())
		return
	}

	publicKeys, err := ssh.NewPublicKeysFromFile("git", privateKeyFile, password)
	if err != nil {
		log.Warningf("generate publickeys failed: %s\n", err.Error())
		return
	}

	log.Infoln(publicKeys)

	username, err := gitconfig.Global("user.name")
	if err != nil {
		log.Fatalf("git config --global user.name: %v", err)
	}
	email, err := gitconfig.Global("user.email")
	if err != nil {
		log.Fatalf("git config --global user.email: %v", err)
	}

	log.Infoln(username)
	log.Infoln(email)
	log.Infoln(filepath.Join(path, subFolder))

	//open local repository
	log.Infoln("Opens an already existing repository ", path)
	repo, err := git.PlainOpen(path)
	if err != nil {
		log.Fatalf("opens an already existing repository: %v", err)
	}
	w, err := repo.Worktree()
	if err != nil {
		log.Fatalf("get wortree: %v", err)
	}

	// git checkout
	cmd := exec.Command("git", "checkout", "ZhivArt-work")
	cmd.Dir = path
	cmd.Run()

	// git add
	log.Infoln("Adds the new file to the staging area")
	entries, err := os.ReadDir(filepath.Join(path, subFolder))
	if err != nil {
		log.Fatalf("read directory: %v", err)
	}
	for _, e := range entries {
		log.Infof("file name: %s is dir %v\n", e.Name(), e.IsDir())
		log.Infoln(filepath.Join(path, subFolder, e.Name()))

		_, err = w.Add(filepath.Join(subFolder, e.Name()))
		if err != nil {
			log.Fatalf("git add: %v", err)
		}
	}

	log.Infoln("We can verify the current status of the worktree using the method Status")
	status, err := w.Status()
	if err != nil {
		log.Fatalf("git status: %v", err)
	}
	log.Info(status)

	// git commit
	entries, err = os.ReadDir(filepath.Join(path, subFolder))
	if err != nil {
		log.Fatalf("read directory: %v", err)
	}
	log.Infoln("git commit -m \"example go-git commit\"")
	commit, err := w.Commit(
		fmt.Sprintf("go-git commit by %s: \n%v", username, entries),
		&git.CommitOptions{
			Author: &object.Signature{
				Name:  username,
				Email: email,
				When:  time.Now(),
			},
		})
	if err != nil {
		log.Fatalf("git commit -m: %v", err)
	}

	log.Infoln("Prints the current HEAD to verify that all worked well")
	obj, err := repo.CommitObject(commit)
	if err != nil {
		log.Fatalf("don't get current HEAD: %v", err)
	}
	log.Infoln(obj)

	log.Infoln("push using default options")
	err = repo.Push(&git.PushOptions{
		Auth:     publicKeys,
		Force:    true,
		Progress: os.Stdout,
	})
	if err != nil {
		log.Fatalf("git push: %v", err)
	}
}
```
