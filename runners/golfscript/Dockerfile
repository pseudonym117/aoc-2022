FROM ruby:alpine

RUN apk add git
WORKDIR /
RUN git clone https://github.com/darrenks/golfscript.git && \
    chmod +x /golfscript/golfscript.rb

ADD shim.sh /shim.sh

ENTRYPOINT [ "/shim.sh" ]
