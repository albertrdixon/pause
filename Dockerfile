FROM golang:1.10 AS build

ENV GOOS=linux \
    GOARCH=amd64 \
    CGO_ENABLED=0
WORKDIR /go/src/github.com/albertrdixon/pause
COPY main.go ./
RUN  go build -v -a \
      -ldflags "-s" \
      -installsuffix cgo -o /pause . \
    && chmod -v +x /pause

FROM scratch
ENTRYPOINT ["/pause"]
COPY --from=build /pause /
