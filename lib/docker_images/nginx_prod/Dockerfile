# Set nginx base image
FROM nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl

COPY bundle.cer /etc/nginx/ssl/bundle.cer
COPY bundle.cer /etc/nginx/ssl/key.pem
