FROM golang:latest as builder

RUN go get github.com/canthefason/go-watcher
RUN go install github.com/canthefason/go-watcher/cmd/watcher
RUN go get -u github.com/gorilla/mux

WORKDIR '/go/restful2-go'

COPY . .

RUN go build
EXPOSE 7000
# CMD ["./restful.go"]
CMD ["watcher"]