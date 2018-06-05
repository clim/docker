FROM alpine:3.7

ENV GLIBC_VERSION=2.23-r3
ENV LANG=C.UTF-8
ENV JAVA_HOME=/opt/java
ENV PATH=$PATH:$JAVA_HOME/bin

RUN apk upgrade --update && \
    apk add --update curl ca-certificates bash gettext libstdc++ && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do curl -sSL https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; done && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    rm -rf /var/cache/apk/* && \
    ( /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true ) && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

RUN buildDeps='curl gnupg' HOME='/root' && \
    set -x && \
    apk add --update $buildDeps && \
    gpg-agent --daemon && \
    apk del --purge $buildDeps && \
    rm -rf /root/.gnupg && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /opt \
    ;

ADD server-jre-8u161-linux-x64.tar.gz /opt

RUN ln -s /opt/jdk1.8.0_161 $JAVA_HOME
