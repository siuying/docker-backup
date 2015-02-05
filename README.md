# Docker Backup

Use [Backup](https://github.com/meskyanichi/backup) gem to backup docker volume.

## Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future.

```
docker pull siuying/backup:latest
```

Alternately you can build the image yourself.

```
git clone https://github.com/siuying/docker-backup.git
cd docker-backup
docker build -t="$USER/backup" .
```

## Quick Start

1. Add volume where you want to backup
2. Add your models with backup logic to ``/root/Backup/models/your_model.rb``
3. Override ``/root/Backup/crontab``
4. Have fun!

Check fig.yml for more details.