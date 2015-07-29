FROM ruby:2.2.2

# setup crontab
RUN apt-get update && \
    apt-get install -y cron rsyslog rsync && \
    rm -rf /var/lib/apt/lists/*
COPY ./crontab /etc/crontab
RUN touch /var/log/cron.log

# Copy App
COPY . /root/Backup
RUN cd /root/Backup; bundle install
WORKDIR /root/Backup

# Volumes
VOLUME ["/root/Backup/logs"]

# Run the cronjob
CMD rsyslogd && cron && tail -f /var/log/syslog /var/log/cron.log