FROM golang:latest as build

WORKDIR /app

COPY fullcycle-rocks.go .

RUN go env -w GO111MODULE=auto && go build -o fullcycle-rocks .


FROM scratch

COPY --from=build /app/fullcycle-rocks /bin

CMD fullcycle-rocks





