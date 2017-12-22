# Borg Backup Server Container
![alt text](https://borgbackup.readthedocs.io/en/stable/_static/logo.png "Borgbackup")

### Description

My take on a Borgbackup Server as a Docker container to faciliate the backing up of remote machines using [Borgbackup](https://github.com/borgbackup)

### Usage

I personally like to split my ssh keys out of the main container to make updates and management easier. To achieve this I create a persistent storage container;

`docker run -d -v /home/borg/.ssh --name borg-keys-storage busybox:latest`

* Container Creation:
```
docker create \
  --name=borg-server \
  --restart=always \
  --volumes-from borg-keys-storage \
  -v path/to/backups:/backups \
  -p 2022:22 \
  b3vis/borg-server
```

### Note
After creating the container you will need to start the container add your own public keys

### Credits
* Forked from [b3vis/borg-server](https://github.com/b3vis/borg-server)
* 128.io's [alpine-abuild image](https://gitlab.128.io/my-projects/docker-images/alpine-abuild).
* Andy Shinn's [docker-alpine-abuild](https://github.com/andyshinn/docker-alpine-abuild)
* Alpine's
  [APKBUILD](https://git.alpinelinux.org/cgit/aports/tree/community/borgbackup/APKBUILD?h=3.7-stable)
  for Borgbackup contributed by Olivier Mauras, maintained by Jakub Jirutka.
