package main

import (
        "net/http"
)

func handler(w http.ResponseWriter, req *http.Request) {
        w.Header().Set("Content-Type", "text/plain")
        w.WriteHeader(http.StatusOK)
        w.Write([]byte("I hear you \n"))
}

func main() {
        http.HandleFunc("/", handler)
        http.ListenAndServe(":8888", nil)
}
