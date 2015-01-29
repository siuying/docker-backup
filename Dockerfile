FROM ruby:2.2.0-wheezy

# Copy App
COPY . /root/backup
RUN cd /root/backup; bundle install
WORKDIR /root/backup

# Volumes
VOLUME ["/root/backup/.data", "/root/backup/log", "/root/backup/models"]

CMD ["bash"]