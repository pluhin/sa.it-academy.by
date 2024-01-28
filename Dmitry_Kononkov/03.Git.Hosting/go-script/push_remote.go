package main

import (
	"fmt"
	"os"

	git "github.com/go-git/go-git/v5"
	http "github.com/go-git/go-git/v5/plumbing/transport/http"
)

func main() {

	auth := &http.BasicAuth{
		Username: "username",
		Password: "personal_access_token",
	}

	path := ".../repo"

	r, err := git.PlainOpen(path)
	if err != nil {
		fmt.Printf("%v", err)
		return
	}

	list, err := r.Remotes()
	if err != nil {
		fmt.Printf("%v", err)
		return
	}

	for _, rep := range list {
		fmt.Println(rep)

		/*
			w, err := r.Worktree()
			if err != nil {
				fmt.Printf("%v", err)
				return
			}

			w.AddWithOptions(&git.AddOptions{
				All: true,
			})

			fmt.Println(w.Status())

			w.Commit("Added my new file", &git.CommitOptions{})
		*/

		err = r.Push(&git.PushOptions{
			Auth:     auth,
			Progress: os.Stdout,
		})
		if err != nil {
			fmt.Printf("%v", err)
			return
		}
	}

}
