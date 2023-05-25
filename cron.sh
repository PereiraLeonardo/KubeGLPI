#!/bin/bash

chmod 775 -R /etc/sysconfig/cron
chmod 775 -R /Backup

#Inicia o serviço cron
service cron start

chmod +x backup.sh
chmod +x cron.sh

echo "*/2 * * * 1-5 root /bin/bash /Maria/backup.sh" >> /etc/cron.daily/MariaDB