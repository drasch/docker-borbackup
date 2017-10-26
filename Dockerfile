FROM alpine:edge

LABEL maintainer="Riadh Habbachi <habbachi.riadh@gmail.com>" \
      version="1.0.11-r1" \
      description="Borgbackup alpine based docker image. Deduplicating archiver with compression and authenticated encryption."

ENV BORGBACKUP_VERSION="1.0.11-r1"

# Install Borg & SSH.
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        openssh \
        sshfs \
        borgbackup="$BORGBACKUP_VERSION" \
        supervisor

RUN adduser -D -u 1000 -s /bin/sh borg && \
    ssh-keygen -A && \
    mkdir /backups && \
    chown borg:borg /backups && \
    sed -i \
        -e 's/^#PasswordAuthentication yes$/PasswordAuthentication no/g' \
        -e 's/^PermitRootLogin without-password$/PermitRootLogin no/g' \
        /etc/ssh/sshd_config

RUN passwd -u borg

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 22

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
