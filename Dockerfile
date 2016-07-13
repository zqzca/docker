FROM alpine:3.1
MAINTAINER Dylan Johnston <dylan@zqz.ca>

#RUN apk add --update && rm -rf /var/cache/apk/*
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /var/www
ADD buildtmp/assets assets
ADD buildtmp/zqz zqz

ENTRYPOINT ["/var/www/zqz", "-secure"]

