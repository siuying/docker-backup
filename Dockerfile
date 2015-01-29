FROM ruby:2.2.0-wheezy

# Copy App
COPY . /root/backup
RUN cd /root/backup; bundle install
WORKDIR /root/backup

# Volumes
VOLUME ["/data", "/root/backup/log", "/root/backup/models"]

CMD ["backup", "perform", "--trigger", "default"]