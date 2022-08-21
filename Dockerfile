FROM golang:1.13-alpine as build
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go build -ldflags="-s -w" -o fullcycle .

FROM scratch
COPY --from=build /app/fullcycle /

CMD [ "/fullcycle" ]