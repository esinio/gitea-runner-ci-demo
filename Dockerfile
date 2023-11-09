FROM golang:alpine as build

WORKDIR /go/src

ADD . .

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk --no-cache add ca-certificates \
    && go env -w GOPROXY='https://goproxy.cn,direct' \
    && go mod tidy \
    && go build -o /go/bin/app .

FROM scratch
# copy the ca-certificate.crt from the build stage
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /go/bin/app /app

EXPOSE 80

ENTRYPOINT ["/app"]