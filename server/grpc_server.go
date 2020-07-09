package main

import (
    "context"
    "google.golang.org/grpc"
    pb "../pb"
    "net"
)

type Service struct {
}

func (s Service) GetSample(ctx context.Context, message *pb.SampleRequest) (*pb.SampleResponse, error) {
    return &pb.SampleResponse{
        Name: "gRPC",
    }, nil
}

func main() {
    listenPort, err := net.Listen("tcp", ":2021")
    if err != nil {
        return
    }
    server := grpc.NewServer()
    service := Service{}
    pb.RegisterSampleServiceServer(server, service)
    server.Serve(listenPort)
}
