package main

import (
	"net/http"
)

func health(w http.ResponseWriter, req *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Ok"))
}

func main() {
	http.HandleFunc("/health", health)
	http.ListenAndServe(":8090", nil)
}
