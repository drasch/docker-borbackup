/backups 	/share/backup/borg 	
Read/Write
/home/borg/.ssh 	/share/CE_CACHEDEV1_DATA/Container/container-station-data/lib/docker/volumes/home-borg/_data 	
Read/Write 

2022 - 22 - TCP

docker run  -v home-borg:/home/borg/.ssh/ -v /share/backup/borg:/backups/backup2 -v /share/Backup2:/backups/backup2 -p 2022:22 -d alpine-borg-1.1.6
