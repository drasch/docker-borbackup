# BorgBackup Docker image
[![Docker Stars](https://img.shields.io/docker/stars/rhabbachi/borgbackup.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/rhabbachi/borgbackup.svg)]()
[![Docker Automated build](https://img.shields.io/docker/automated/rhabbachi/borgbackup.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/rhabbachi/borgbackup.svg)]()

### Description

[Borgbackup](https://www.borgbackup.org/) Server as a Docker image to
faciliate the backing up of remote machines.

### Usage

Sample one shot command to run the backup server.

```sh
$ docker run -d --name 'borgserver' -v "$HOME/.ssh:/home/borg/.ssh" -v "<path/to/backups/root/folder/>:/backups" rhabbachi/borgbackup:1.1.3
```

#### Compose service example

```yaml
  borgserver:
    image: rhabbachi/borgbackup:1.1.3
    container_name: 'borgserver'
    environment:
      # Optional.
      - VIRTUAL_HOST=<lan url>
    ports:
      - "5022:22"
    volumes:
      - <Backup root folder>:/backups
      - <SSH public key>:/home/borg/.ssh
    restart: unless-stopped
```

Same but for ARM based devices (built and tested with a Raspberry PI 2 Model B):

```yaml
  borgserver:
    image: rhabbachi/borgbackup:1.1.3-armhf
    container_name: 'borgserver'
    environment:
      # Optional.
      - VIRTUAL_HOST=<lan url>
    ports:
      - "5022:22"
    volumes:
      - <Backup root folder>:/backups
      - <SSH public key>:/home/borg/.ssh
    restart: unless-stopped
```

### Links

* Github Repo: https://github.com/rhabbachi/docker-borgbackup
* Docker Hub: https://hub.docker.com/r/rhabbachi/borgbackup
* Dockerfile: https://hub.docker.com/r/rhabbachi/borgbackup/~/dockerfile/

### Credits

* Forked from [b3vis/borg-server](https://github.com/b3vis/borg-server)
* 128.io's [alpine-abuild image](https://gitlab.128.io/my-projects/docker-images/alpine-abuild).
* Andy Shinn's [docker-alpine-abuild](https://github.com/andyshinn/docker-alpine-abuild)
* Alpine's
  [APKBUILD](https://git.alpinelinux.org/cgit/aports/tree/community/borgbackup/APKBUILD?h=3.7-stable)
  for Borgbackup contributed by Olivier Mauras, maintained by Jakub Jirutka.
