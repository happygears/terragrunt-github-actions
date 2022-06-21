FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh vault libcap; setcap cap_ipc_lock= /usr/sbin/vault"]

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
