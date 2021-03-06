#!/bin/sh

set -e

[ -f /usr/bin/php-cgi ] || ln -s /usr/bin/php-cgi5 /usr/bin/php-cgi
lighttpd -f /etc/lighttpd/lighttpd.conf

[ -f /etc/nagios/nagios.cfg ] || cp -R /etc/nagios.orig/* /etc/nagios
[ -f /var/nagios/nagios.log ] || cp -R /var/nagios.orig/* /var/nagios
chown -R ${NAGIOS_USER}:${NAGIOS_GROUP} /etc/nagios /var/nagios

[ -f /etc/nagios/nagios.users ] || htpasswd -bc /etc/nagios/nagios.users $NAGIOSADMIN $NAGIOSPASSWORD

nagios -d /etc/nagios/nagios.cfg
tail -f /var/nagios/nagios.log
