# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:33:42 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:53:36 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN apk add nginx supervisor openssl openssh

RUN ssh-keygen -A

RUN	adduser -D odhazzar && echo "odhazzar:odhazzar" | chpasswd

RUN adduser -D -g 'www' www

RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir /run/nginx

COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/index.html /www/index.html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096\
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=nginx"

EXPOSE 22 80 443

ENTRYPOINT	supervisord -c /etc/supervisord.conf

