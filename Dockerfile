FROM alpine:3 

ENV VERSION 1.17.2

ADD https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip /tmp/

RUN unzip /tmp/vault_${VERSION}_linux_amd64.zip vault -d /usr/sbin/ && rm -f /tmp/vault_*

RUN apk add --update --no-cache bash ca-certificates curl git jq openssh libcap

RUN setcap cap_ipc_lock= /usr/sbin/vault

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
