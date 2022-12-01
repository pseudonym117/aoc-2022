FROM ruby:alpine

RUN apk add git
WORKDIR /
RUN git clone https://github.com/darrenks/golfscript.git && \
    chmod +x /golfscript/golfscript.rb

ENTRYPOINT [ "/golfscript/golfscript.rb" ]
