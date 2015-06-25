# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Anand Mani Sankar

# Copy custom configuration file from the current directory
COPY nginx.conf  /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -nodes -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 356 -subj '/CN=www.knowmad.in'
