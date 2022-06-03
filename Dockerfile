FROM golang:1.17-alpine

WORKDIR /webapplication
COPY main.go .
COPY go.sum .
COPY go.mod .

RUN ["go", "mod", "download"]
RUN ["go", "build", "-o", "app-server"]

ARG PORT=80
ENV PORT = $PORT
EXPOSE $PORT


CMD ["./app-server"]