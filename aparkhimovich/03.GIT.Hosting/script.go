package main

import "os/exec"

func main() {
	var gitDir string = "/root/work4/sa.it-academy.by/aparkhimovich/02.Git.Local" // set directory git
	elementsRepo := map[string]string{
		"origin_github":    "git@github.com:aparkhimovich/git_3.git", // set github repo data
		"origin_gitbucket": "git@bitbucket.org:pal_nces/git_3.git",   // set gitbucket repo data
		"origin_gitlab":    "git@gitlab.com:pal_nces/git_3.git",      // set gitlab repo data
	}
	for repoName, repoData := range elementsRepo {
		var runCommand string
		runCommand = "cd " + gitDir + " && git remote add " + repoName + " " + repoData
		exec.Command("bash", "-c", runCommand).Run()
		runCommand = "cd " + gitDir + " && git push " + repoName + " --all -f"
		exec.Command("bash", "-c", runCommand).Run()
	}
}
