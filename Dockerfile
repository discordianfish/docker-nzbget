FROM alpine:3.9

ENV VERSION 21.0
ENV BUILD r2302
ENV URL https://github.com/nzbget/nzbget/releases/download/v${VERSION}-${BUILD}/nzbget-${VERSION}-testing-${BUILD}-bin-linux.run

RUN apk add --update curl && \
  echo curl -sLo /tmp/nzbget.run "${URL}" && \
  curl -sLo /tmp/nzbget.run "${URL}" && \
  sh /tmp/nzbget.run && \
  rm /tmp/nzbget.run && \
  echo user:x:1000:100:user:/tmp:/bin/sh >> /etc/passwd

USER user
ENTRYPOINT [ "/nzbget/nzbget" ]
