WORKDIR /var/www

RUN rm -rf /var/www/html

RUN rm /etc/nginx/conf.d/default.conf
COPY .docker/nginx/nginx.conf /etc/nginx/conf.d
COPY . .
RUN chmod -R 777 /var/www/storage/
RUN chmod -R 777 /var/www/tmp/

EXPOSE 80
ENTRYPOINT [ "/var/www/entrypoint.sh" ]