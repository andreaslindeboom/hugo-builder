FROM ubuntu:trusty

ENV HUGO_VERSION 0.14
ENV HUGO_HANDLE hugo_${HUGO_VERSION}_linux_amd64
ENV HUGO_ARCHIVE ${HUGO_HANDLE}.tar.gz

WORKDIR /tmp

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ARCHIVE} ./

RUN tar xzf ${HUGO_ARCHIVE} && \
    mv ${HUGO_HANDLE}/${HUGO_HANDLE} /usr/local/bin/hugo && \
    rm -r ${HUGO_ARCHIVE} ${HUGO_HANDLE}
