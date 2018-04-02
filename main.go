package main

import (
	"fmt"
	"net/http"
)

const ServerPort = "8080"

func main() {
	fs := http.FileServer(http.Dir("./dist"))
	http.Handle("/", fs)

	fmt.Println("Listening on port :", ServerPort)
	if err := http.ListenAndServe(":"+ServerPort, nil); err != nil {
		panic(err)
	}
}
