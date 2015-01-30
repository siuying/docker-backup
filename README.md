# Docker Backup

Based on Backup gems in Ruby, customize backup solution to docker.

## How to Use

1. Create a new Dockerfile based on backup
2. Add volume where you want to backup
3. Add your models with backup logic to /root/backup/models/
4. Override /root/backup/crontab
5. Have fun!

## Volume

"/root/backup/logs"