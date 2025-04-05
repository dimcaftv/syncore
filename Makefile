proto:
	protoc \
	--go_out pkg --go_opt module=main/pkg \
	--go-grpc_out pkg --go-grpc_opt module=main/pkg \
	pkg/proto/*.proto

