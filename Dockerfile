FROM golang as builder

WORKDIR /go/src/app
ADD hello.go .
RUN go mod init
#RUN go run .
RUN go build -v

FROM scratch
COPY --from=builder /go/src/app/app .
ENTRYPOINT [ "/app"]