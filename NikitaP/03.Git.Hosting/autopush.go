package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
)

func main() {
	// Check for uncommitted changes
	if hasUncommittedChanges() {
		// If there are uncommitted changes, commit and push them
		commitAndPushChanges()
	} else {
		fmt.Println("No uncommitted changes")
	}
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
func commitAndPushChanges() {
	// Command to add all changes
	cmdAdd := exec.Command("git", "add", ".")
	err := cmdAdd.Run()
	if err != nil {
		log.Printf("Error adding changes: %v", err)
		// If there is an error adding changes, push immediately
		pushChanges()
		return
	}

	// Command to commit changes
	commitMessage := "Automatic commit of uncommitted changes"
	cmdCommit := exec.Command("git", "commit", "-m", commitMessage)
	err = cmdCommit.Run()
	if err != nil {
		log.Printf("Error committing changes: %v", err)
		// If there is an error committing changes, push immediately
		pushChanges()
		return
	}

	// Push changes
	pushChanges()
}

// Push changes
func pushChanges() {
	cmdPush := exec.Command("git", "push")
	err := cmdPush.Run()
	if err != nil {
		log.Fatalf("Error pushing changes: %v", err)
	}

	fmt.Println("Changes successfully pushed")
}
