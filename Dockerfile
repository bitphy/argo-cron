# Image from where to copy argocli
FROM argoproj/argocli:v2.3.0 as argocli


FROM alpine

LABEL maintainer="erik@bitphy.com"

# Install git
RUN apk --no-cache add git openssh-client

# Copy argocli
COPY --from=argocli /bin/argo /usr/local/bin/

WORKDIR /app

# Add entrypoint
ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]