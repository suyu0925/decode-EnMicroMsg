FROM alpine

RUN apk add git build-base tcl openssl-dev;

RUN cd ~/; \
  git clone https://github.com/sqlcipher/sqlcipher.git; \
  mkdir build; \
  cd build; \    
  ../sqlcipher/configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="-lcrypto"; \
  make; make install; 

RUN apk del git build-base tcl openssl-dev; \
  rm -rf ~/build ~/sqlcipher

WORKDIR /app

COPY decode.sql ./
COPY decode.sh ./

RUN sed -i 's/\r$//' decode.sql; \
  sed -i 's/\r$//' decode.sh; \
  chmod +x ./decode.sh

CMD ["./decode.sh"]
