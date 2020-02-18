FROM golang:1.9
RUN mkdir /echo
COPY main.go /echo
CMD ["go", "run", "/echo/main.go"]
MAINTAINER Ryota BANNAI ryotabannai0528@gmail.com
