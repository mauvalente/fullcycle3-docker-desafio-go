FROM golang:latest as build

WORKDIR /app

COPY fullcycle-rocks.go .

RUN go env -w GO111MODULE=auto && go build -o fullcycle-rocks .


FROM scratch

WORKDIR /app

COPY --from=build /app/fullcycle-rocks /app

CMD ["/app/fullcycle-rocks"]





