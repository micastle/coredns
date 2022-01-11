echo === go generate
go generate

echo === go build
go build

echo === build docker image
docker build -t coredns-linux-amd64:1.8.6 -f Dockerfile .

docker tag coredns-linux-amd64:1.8.6 docker.io/micastle/coredns-kubelet:1.8.6

docker push docker.io/micastle/coredns-kubelet:1.8.6