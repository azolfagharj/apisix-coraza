## IMAGE_VERSION=a3.12.0-c0.5.0
## TESTED=true
# apisix and coraza wasm plugin version
ARG APISIX_VERSION=3.12.0-debian
ENV CORAZA_VERSION 0.5.0
# coraza filename
ENV CORAZA_FILENAME coraza-proxy-wasm-${CORAZA_VERSION}.zip

FROM apache/apisix:${APISIX_VERSION}



ADD https://github.com/corazawaf/coraza-proxy-wasm/releases/download/$CORAZA_VERSION/$CORAZA_FILENAME .

USER root

RUN <<EOF

  apt-get install zip -y
  unzip $CORAZA_FILENAME -d /usr/local/apisix/proxywasm
  rm $CORAZA_FILENAME
  apt-get remove zip -y
  chown -R apisix:apisix /usr/local/apisix/proxywasm

EOF

USER apisix
