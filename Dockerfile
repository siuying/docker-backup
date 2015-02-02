FROM ruby:2.2.0-wheezy

# Copy App
COPY . /root/backup
RUN cd /root/backup; bundle install
WORKDIR /root/backup

# setup crontab
RUN apt-get update && \
    apt-get install -y cron rsyslog && \
    rm -rf /var/lib/apt/lists/*
COPY ./crontab /etc/crontab
RUN touch /var/log/cron.log

# Volumes
VOLUME ["/root/backup/logs", "/etc/crontab", "/root/backup/models/default.rb"]

# Run the cronjob
CMD rsyslogd && cron && tail -f /var/log/syslog /var/log/cron.log