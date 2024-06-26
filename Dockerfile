FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go mod init app

RUN go build -ldflags "-s -w" -o app .

FROM scratch

COPY --from=builder /app/app /

CMD [ "/app" ]
