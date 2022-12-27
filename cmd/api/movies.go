package main

import (
	"fmt"
	"net/http"
)

func (app *application) showMovieHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Show")
}

func (app *application) createMovieHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Create")
}
