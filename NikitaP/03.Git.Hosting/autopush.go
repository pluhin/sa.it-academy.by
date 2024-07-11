package main

import (
	"bytes"
	"flag"
	"fmt"
	"log"
	"os/exec"
)

func main() {
	// Get the branch name from the command line arguments
	branch := flag.String("branch", "main", "The name of the branch to update and push changes to")
	flag.Parse()

	// Update local branch from remote repository
	updateLocalBranch(*branch)

	// Check for uncommitted changes
	if hasUncommittedChanges() {
		// If there are uncommitted changes, commit and push them
		commitAndPushChanges(*branch)
	} else {
		fmt.Println("No uncommitted changes")
	}
}

// Update local branch from remote repository
func updateLocalBranch(branch string) {
	cmd := exec.Command("git", "pull", "origin", branch)
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	err := cmd.Run()
	if err != nil {
		log.Fatalf("Error updating local branch: %v, Output: %s", err, out.String())
	}
	fmt.Printf("Local branch '%s' updated successfully\n", branch)
}

// Check for uncommitted changes
func hasUncommittedChanges() bool {
	cmd := exec.Command("git", "status", "--porcelain")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatalf("Command execution error: %v", err)
	}
	// If the output is not empty, then there are uncommitted changes
	return out.Len() > 0
}

// Commit and push changes
func commitAndPushChanges(branch string) {
	// Command to add all changes
	cmdAdd := exec.Command("git", "add", ".")
	var addOut bytes.Buffer
	cmdAdd.Stdout = &addOut
	cmdAdd.Stderr = &addOut
	err := cmdAdd.Run()
	if err != nil {
		log.Printf("Error adding changes: %v, Output: %s", err, addOut.String())
		// If there is an error adding changes, push immediately
		pushChanges(branch)
		return
	}

	// Command to commit changes
	commitMessage := "Automatic commit of uncommitted changes"
	cmdCommit := exec.Command("git", "commit", "-m", commitMessage)
	var commitOut bytes.Buffer
	cmdCommit.Stdout = &commitOut
	cmdCommit.Stderr = &commitOut
	err = cmdCommit.Run()
	if err != nil {
		log.Printf("Error committing changes: %v, Output: %s", err, commitOut.String())
		// If there is an error committing changes, push immediately
		pushChanges(branch)
		return
	}

	// Push changes
	pushChanges(branch)
}

// Push changes
func pushChanges(branch string) {
	cmdPush := exec.Command("git", "push", "origin", branch)
	var pushOut bytes.Buffer
	cmdPush.Stdout = &pushOut
	cmdPush.Stderr = &pushOut
	err := cmdPush.Run()
	if err != nil {
		log.Fatalf("Error pushing changes: %v, Output: %s", err, pushOut.String())
	}

	fmt.Printf("Changes successfully pushed to branch '%s'\n", branch)
}
