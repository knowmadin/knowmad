# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Anand Mani Sankar

# Copy custom configuration file from the current directory
COPY nginx.conf  /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl

COPY bundle.cer /etc/nginx/ssl/bundle.cer
COPY bundle.cer /etc/nginx/ssl/key.pem
