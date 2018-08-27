FROM alpine:3.7

ARG MESOS_VERSION=1.6.1
ARG MESOS_PKG_URL=http://www.apache.org/dist/mesos/${MESOS_VERSION}/mesos-${MESOS_VERSION}.tar.gz

RUN apk add --no-cache \
      apr-dev \
      curl-dev \
      cyrus-sasl-crammd5 \
      cyrus-sasl-dev \
      fts-dev \
      g++ \
      linux-headers \
      make \
      patch \
      subversion-dev \
      zlib-dev

RUN wget $MESOS_PKG_URL -O- | tar xz \
    && cd mesos-$MESOS_VERSION \
    && ./configure --disable-java --disable-python --enable-silent-rules \
    && make -j $(nproc) \
    && make install
