#!/bin/bash

#Realiza o backup da base de dados
mysqldump --databases glpi10 -u root -p'senha' > /Maria/Backup/bkpglpi.sql

#Inicia o serviço cron
service cron restart

#RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Starting database restore" && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'iCx,74*Ary' -d root -i glpibkp.sql
#CMD [ "cat glpibkp.sql | /usr/bin/mysql -u root -p'iCx,74*Ary' glpi10" ]
