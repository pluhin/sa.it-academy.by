package main

import (
    "log"
    "os/exec"
)

func main() {
    remotes := [3]string{"github", "bitbucket", "gitlab"}

    for _, v := range remotes {
        _, err := exec.Command("git", "push", v, "m-sa2-12-20").Output()
        if err != nil {
            log.Fatalf("error: %s", err.Error())
        }
    }
}
