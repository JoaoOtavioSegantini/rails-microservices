FROM ruby:3.1.2-alpine
RUN apk add --no-cache openssl bash postgresql-client libpq-dev nodejs yarn alpine-sdk autoconf librdkafka-dev vim nginx openrc
RUN mkdir -p /run/nginx && \
    echo "pid /run/nginx.pid;" >> /etc/nginx/nginx.conf

WORKDIR /var/www

COPY .docker/nginx/nginx.conf /etc/nginx/conf.d
COPY . .
RUN chmod -R 777 /var/www/storage/
RUN chmod -R 777 /var/www/tmp/
RUN mkdir -p /var/www/.docker/dbdata
RUN chmod 777 -R /var/www/.docker/dbdata

EXPOSE 80
ENTRYPOINT [ "/var/www/entrypoint.sh" ]
