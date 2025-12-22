package main

import "fmt"

// autopilotkvd is a long-running daemon that serves a replicated kv db and
// executes atomic operations (Get/Put/Delete/CAS)
func main() {
	fmt.Println("autopilotkv: starting server")
}
