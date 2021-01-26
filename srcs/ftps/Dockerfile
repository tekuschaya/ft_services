# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:34:17 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:39:54 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN apk --no-cache add vsftpd openssl

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir /ftp && echo "odhazzar" > /ftp/testfile

RUN adduser \
    --disabled-password \
    --home "/ftp" \
    --no-create-home \
    uftp

RUN chown uftp /ftp
RUN chgrp uftp /ftp

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=ftp"

EXPOSE 21 20021

COPY srcs/start.sh ./start.sh

CMD ./start.sh