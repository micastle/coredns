FROM debian:stable-slim

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM ubuntu:18.04

COPY --from=0 /etc/ssl/certs /etc/ssl/certs
COPY coredns /coredns

RUN chmod 777 /coredns

EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]
