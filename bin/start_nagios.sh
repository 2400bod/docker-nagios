#!/bin/sh

set -e
echo '/tmp/core.%h.%e.%t' > /proc/sys/kernel/core_pattern

lighttpd -f /etc/lighttpd/lighttpd.conf

[ -f /etc/nagios/nagios.cfg ] || cp -R /etc/nagios.orig/* /etc/nagios
[ -f /var/nagios/nagios.log ] || cp -R /var/nagios.orig/* /var/nagios
chown -R ${NAGIOS_USER}:${NAGIOS_GROUP} /etc/nagios /var/nagios

[ -f /etc/nagios/nagios.users ] || htpasswd -bc /etc/nagios/nagios.users $NAGIOSADMIN $NAGIOSPASSWORD

nagios -d /etc/nagios/nagios.cfg
tail -f /var/nagios/nagios.log
