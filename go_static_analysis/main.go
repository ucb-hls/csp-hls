package main

import (
  "os"
  "fmt"
  "golang.org/x/tools/godoc/analysis"
)

func main() {
  // Note: this is the string representing the path to the Go file without ".go"
  // e.g /path/to/example/example1/example1
  // to work around the error "named files must all be in one directory;"
  arg := os.Args[1]
	var pointerAnalysis bool
  pointerAnalysis = true
  // This is awkward
  file := arg + ".go"
  analysis.Run(pointerAnalysis, file)
  fmt.Println("Done")
}
