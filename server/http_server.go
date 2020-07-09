package main

import (
	"net/http"
	"../pb"
	"github.com/golang/protobuf/proto"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/protobuf")
	p := &pb.SampleResponse{
		Name: "HTTP",
	}
	var body []byte
	body, _ = proto.Marshal(p)
	w.Write(body)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":2020", nil)
}
