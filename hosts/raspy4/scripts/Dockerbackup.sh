#!/bin/bash
backupDate=$(date +"%Y-%m-%d %H:%M:%S")



echo "Backup started at $backupDate" |  toilet  -f mono9  -F metal -F border -t


# stop the containers

cd /mnt/MIHDD/Appdata/authelia
docker-compose stop

cd ../beets
docker-compose stop

cd ../cadvisor
docker-compose stop

cd ../bonob
docker-compose stop

cd ../calibre
docker-compose stop

cd ../calibreweb
docker-compose stop

cd ../cops
docker-compose stop

cd ../filebrowser
docker-compose stop

cd ../jellyfin
docker-compose stop

cd ../navidrome
docker-compose stop

cd ../photoprism
docker-compose stop

# cd ../plex-tutorials
# docker-compose stop

cd ../prometheus
docker-compose stop

cd ../sabnzbd
docker-compose stop

cd ../snippet-box
docker-compose stop

cd ../syncthing
docker-compose stop

cd ../transmission
docker-compose stop

cd
sudo tar -czvf docker-backup-$backupDate.tar.gz --exclude=/mnt/MIHDD/Appdata/calibre/config  --exclude=/mnt/MIHDD/Appdata/jellyfin/config/cache  --exclude=/mnt/MIHDD/Appdata/jellyfin/config/data/metadata/library --exclude=/mnt/MIHDD/Appdata/syncthing/config/Cámara  /mnt/MIHDD/Appdata/


cd /mnt/MIHDD/Appdata/authelia
docker-compose start

cd ../beets
docker-compose start

cd ../cadvisor
docker-compose start

cd ../bonob
docker-compose start

cd ../calibre
docker-compose start

cd ../calibreweb
docker-compose start

cd ../cops
docker-compose start

cd ../filebrowser
docker-compose start

cd ../jellyfin
docker-compose start

cd ../navidrome
docker-compose start

cd ../photoprism
docker-compose start

# cd ../plex-tutorials
# docker-compose start

cd ../prometheus
docker-compose start

cd ../sabnzbd
docker-compose start

cd ../snippet-box
docker-compose start

cd ../syncthing
docker-compose start

cd ../transmission
docker-compose start

# now go back to home, and copy my backup file to my NAS
cd


echo ""
echo "Backup copy is running..." | toilet -f smmono9 --gay


sudo cp docker-backup-$backupDate.tar.gz /home/antjrobles/gdrive/Backups/raspy4

# remove the tar file from the main home folder after it's copied
sudo rm docker-backup-$backupDate.tar.gz

echo "Backup at $backupDate is complete."
toilet --filter gay Backup Done.
