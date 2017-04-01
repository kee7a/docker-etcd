FROM        alpine:3.2
MAINTAINER Jeff Siqueira <root@kee7a.com>

ENV CORE-VERSION etcd-v3.1.5-linux-amd64

RUN         apk add --update ca-certificates openssl tar && \
            wget https://github.com/coreos/etcd/releases/download/v3.1.5/${CORE-VERSION}.tar.gz && \
            tar xzvf ${CORE-VERSION}.tar.gz && \
            mv ${CORE-VERSION}/etcd* /bin/ && \
            apk del --purge tar openssl && \
            rm -Rf ${CORE-VERSION}* /var/cache/apk/*
VOLUME      /data
EXPOSE      2379 2380
ADD         run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]
