#!/bin/sh

wp core install --url=http://192.168.99.201:5050/ \
--title='special  for  ft_services' --admin_user=odhazzar --admin_password=odhazzar \
--admin_email=odhazzar@student.21-school.ru --skip-email \
--path=/www --allow-root
wp user create qwerty qwerty@qwerty.ru \
--role=author --user_pass=qwerty \
--path=/www --allow-root
wp user create 123 456@789.ru \
--role=subscriber --user_pass=123 \
--path=/www --allow-root

supervisord -c /etc/supervisord.conf