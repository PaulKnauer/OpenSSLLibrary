FROM ubuntu AS builder

LABEL autodelete="true"
LABEL project="openssl"

ENV OPENSSL_VERSION=openssl-1.1.1i

RUN apt -y update && apt -y install build-essential checkinstall zlib1g-dev wget

WORKDIR /usr/local/src/

RUN wget https://www.openssl.org/source/${OPENSSL_VERSION}.tar.gz

RUN tar -xf ${OPENSSL_VERSION}.tar.gz

WORKDIR /usr/local/src/${OPENSSL_VERSION}

RUN ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
 
RUN make && make test && make install

FROM ubuntu

COPY --from=builder /usr/local/ssl /usr/local/ssl