package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Привет! Docker-контейнер. Текущее время: %s\n", time.Now().Format(time.RFC1123))
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Сервер запущен на порту :8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
