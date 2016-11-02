FROM alpine:3.4

ENV NDPPD_VERSION=master

COPY patch/logger.patch /tmp/

RUN apk --no-cache add --virtual .build-dependencies make g++ linux-headers patch wget ca-certificates \
	&& mkdir -p /usr/src \
	&& wget -qO- https://github.com/DanielAdolfsson/ndppd/archive/${NDPPD_VERSION}.tar.gz | tar -xzC /usr/src \
	&& cd /usr/src/ndppd-${NDPPD_VERSION} \
	&& patch src/logger.cc < /tmp/logger.patch \
	&& make && make install \
	&& cd / && rm -rf /usr/src/ndppd-${NDPPD_VERSION} \
	&& apk del .build-dependencies

RUN apk --no-cache add libc6-compat libgcc libstdc++

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
