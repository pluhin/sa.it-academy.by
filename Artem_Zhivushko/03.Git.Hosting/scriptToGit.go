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
	// log.SetFormatter(&log.JSONFormatter{})
	log.SetOutput(os.Stdout)
}

func main() {
	// git add .
	// git commit
	// git push
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
	// gitconfig.Username()
	if err != nil {
		log.Fatalf("git config --global user.name: %v", err)
	}
	email, err := gitconfig.Global("user.email")
	// gitconfig.Email()
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

	// create branch
	cmd := exec.Command("git", "checkout", "ZhivArt-work")
	cmd.Dir = path
	cmd.Run()
	// log.Infoln("Create a new branch to the current HEAD")
	// headRef, err := repo.Head()
	// if err != nil {
	// 	log.Fatalf("git branch: %v", err)
	// }

	// ref := plumbing.NewHashReference(plumbing.ReferenceName(
	// 	fmt.Sprintf("efs/heads/zhiv-art-%v", time.Now())),
	// 	headRef.Hash())

	// log.Infoln("The created reference is saved in the storage")
	// err = repo.Storer.SetReference(ref)
	// if err != nil {
	// 	log.Fatalf("created reference is saved in the storage: %v", err)
	// }

	// git add
	log.Infoln("Adds the new file to the staging area")
	entries, err := os.ReadDir(filepath.Join(path, subFolder))
	if err != nil {
		log.Fatalf("read directory: %v", err)
	}
	for _, e := range entries {
		log.Infof("file name: %s is dir %v\n", e.Name(), e.IsDir())
		log.Infoln(filepath.Join(path, subFolder, e.Name()))

		_, err = w.Add(filepath.Join( /*path, */ subFolder, e.Name()))
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
