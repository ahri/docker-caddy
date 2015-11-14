FROM alpine:3.2

# core + git
ENV CADDY_BUILD 151411135825937

RUN apk add --update git=2.4.1-r0 && \
    rm -rf /var/cache/apk/* && \
    \
    (cd /tmp && \
    wget -O - https://caddyserver.com/download/builds/$CADDY_BUILD/caddy_linux_amd64_custom.tar.gz | tar xz && \
    mv caddy /usr/local/bin) && \
    rm -rf /tmp/*

ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-version"]
