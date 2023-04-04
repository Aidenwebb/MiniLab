FROM alpine:3.14

RUN apk add --no-cache dnsmasq

ENTRYPOINT ["/usr/sbin/dnsmasq", "-k"]