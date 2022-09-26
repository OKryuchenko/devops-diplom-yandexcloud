#!/usr/bin/env bash
cd /var/www/wordpress
/usr/local/bin/wp post create --post_title='from GitLab ' \
--post_content='GitLab Runner опубликовал запись!' --post_status=publish
