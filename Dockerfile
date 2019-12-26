FROM debian:10-slim

ENV NETIO_ZIP=http://www.ars.de/netio133.zip
ENV NETIO_SHA512=79a4d8ad5a5d9750a19bf7f8f4cc762e6d1a866a63138bfc1cf8614057eb8ade147817e489f93210990ce9d82be03a5053821663212fbee71c4cd46c2f9c9232

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends wget unzip; \
    rm -rf /var/lib/apt/lists/*; \
    echo "$NETIO_SHA512  netio133.zip" >netio133.zip.sha512; \
    wget "$NETIO_ZIP" -O netio133.zip; \
    sha512sum -c netio133.zip.sha512; \
    unzip -j netio133.zip bin/linux-amd64 -d /bin; \
    rm netio*; \
    mv /bin/linux-amd64 /bin/netio; \
    chmod +x /bin/netio; \
    # Verify it runs. This command doesn't actually do
    # anything, it only prints the output header.
    netio 127.0.0.1

ENTRYPOINT ["/bin/netio"]
