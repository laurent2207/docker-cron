FROM ubuntu:21.04

RUN apt-get update && apt-get -y install cron

COPY crontab /etc/cron.d/crontab
RUN chmod 644 /etc/cron.d/crontab

ADD script.sh /script.sh
RUN chmod +x /script.sh

RUN touch /var/log/cron.log

CMD ["cron", "-f"]
