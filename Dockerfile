FROM alpine:3.8
LABEL maintainer="Loy B. <lonord.b@gmail.com>"
ENV VERSION 1.0
RUN ARCH= && case "$(arch)" in \
	x86_64) ARCH='amd64';; \
	armv7l) ARCH='arm';; \
	*) echo "unsupported architecture"; exit 1 ;; \
	esac \
	&& apk add --no-cache --virtual .build-deps wget \
	&& wget --no-check-certificate "https://github.com/lonord/system-status-service/releases/download/v${VERSION}/system-status-service_linux_${ARCH}" -O /sbin/system-status-service \
	&& chmod +x /sbin/system-status-service \
	&& apk del .build-deps
CMD [ "system-status-service" ]