FROM opensuse/leap:15

WORKDIR /Maria

RUN zypper --non-interactive ref && zypper --non-interactive up \ 
&& zypper --non-interactive in mariadb \
nano \
curl \
cron \
wget

COPY . .

RUN mkdir Backup

ENV MARIADB_ROOT_PASSWORD=***
ENV MARIADB_DATABASE=base
ENV MARIADB_USER=canatiba
ENV MARIADB_PASSWORD=***

ENTRYPOINT [ "/Maria/cron.sh" ]

#Adiciona tarefa no cron
#RUN echo "0 18 * * 1-5 root /bin/bash /Maria/backup.sh" >> /etc/crontab
#CMD echo "40-50 * * * 1-5 root /bin/bash /Maria/backup.sh" >> /etc/cron.daily/MariaDB

#RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Starting database restore" && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'iCx,74*Ary' -d root -i glpibkp.sql
#CMD [ "cat glpibkp.sql | /usr/bin/mysql -u root -p'iCx,74*Ary' glpi10" ]
#RUN mysql -u root -p'iCx,74*Ary' < glpibkp.sql
