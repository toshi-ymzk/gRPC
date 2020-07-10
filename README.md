# Create sample.pb.swift, sample.grpc.swift
protoc pb/*.proto --swift_out=./gRPC --swiftgrpc_out=./gRPC

# Create sample.pb.go
protoc --go_out=plugins=grpc:. pb/*.proto

# Run servers
go run server/grpc_server.go
go run server/http_server.go