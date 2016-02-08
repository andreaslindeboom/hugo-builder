FROM alpine:3.3

ENV HUGO_VERSION 0.15
ENV HUGO_HANDLE hugo_${HUGO_VERSION}_linux_amd64
ENV HUGO_ARCHIVE ${HUGO_HANDLE}.tar.gz
ENV HUGO_URL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ARCHIVE}

WORKDIR /hugo

ADD ${HUGO_URL} ./
ADD build.sh ./

RUN tar xzf ${HUGO_ARCHIVE} && \
    mv ${HUGO_HANDLE}/${HUGO_HANDLE} /usr/local/bin/hugo && \
    rm -r ${HUGO_ARCHIVE} ${HUGO_HANDLE} && \
    mkdir -p src dest tmp

VOLUME /hugo/src
VOLUME /hugo/dest

ENTRYPOINT ["sh"]

CMD ["build.sh"]
