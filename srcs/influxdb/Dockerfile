# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:33:52 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:43:31 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN apk add influxdb

COPY srcs/influxdb.conf /etc/influxdb.conf

EXPOSE 8086

VOLUME /var/lib/influxdb

ENTRYPOINT influxd -config /etc/influxdb.conf
