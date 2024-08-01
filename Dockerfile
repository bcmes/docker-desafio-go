FROM golang:1.22.5 AS builder
WORKDIR /app
COPY main.go ./
RUN go build main.go
RUN rm main.go

FROM scratch
WORKDIR /
COPY --from=builder /app /app
ENTRYPOINT ["./app/main"] 