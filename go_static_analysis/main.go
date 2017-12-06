// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// godoc: Go Documentation Server

// Web server tree:
//
//	http://godoc/		main landing page
//	http://godoc/doc/	serve from $GOROOT/doc - spec, mem, etc.
//	http://godoc/src/	serve files from $GOROOT/src; .go gets pretty-printed
//	http://godoc/cmd/	serve documentation about commands
//	http://godoc/pkg/	serve documentation about packages
//				(idea is if you say import "compress/zlib", you go to
//				http://godoc/pkg/compress/zlib)
//
// Command-line interface:
//
//	godoc packagepath [name ...]
//
//	godoc compress/zlib
//		- prints doc for package compress/zlib
//	godoc crypto/block Cipher NewCMAC
//		- prints doc for Cipher and NewCMAC in package crypto/block

// +build !appengine

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


