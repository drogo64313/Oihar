# FROM golang:1.27.3:alpine AS dev
FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o api ./cmd/api 

# 実行ステージであるため、golangのイメージをベースにする必要はない
FROM debian:bookworm-slim

# 作業ディレクトリを設定
WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/api .

EXPOSE 3000

CMD ["./api"]
