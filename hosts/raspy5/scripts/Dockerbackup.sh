#!/bin/bash
backupDate=$(date  +'%F')

echo $backupDate

echo "Backup started at $backupDate" | toilet -f smmono9 --gay

cowsay "Backup started at $backupdate"

sleep 3

cowsay "Stopping all the containers"
# stop the containers
cd /home/antjrobles/appdata/coder/
docker-compose stop

cd ../filestash
docker-compose stop

cd ../mariadb
docker-compose stop

cd ../obsidian
docker-compose stop

cd ../papppra
docker-compose stop

docker-compose stop
cd ../openvscode
docker-compose stop

cd ../prometheus
docker-compose stop

cd ../vscodium
docker-compose stop

cd ../windows
docker-compose stop


cd /home/antjrobles/
sudo tar -czvf docker-backup-$backupDate.tar.gz --exclude='windows/win' /home/antjrobles/appdata/


cd appdata/filestash
docker-compose start

cd ../mariadb
docker-compose start

cd ../obsidian
docker-compose start

cd ../papppra
docker-compose start 

cd ../openvscode
docker-compose start

cd ../prometheus
docker-compose start

#cd ../vscodium
#docker-compose start

# Leave windows container stopped

# now go back to home, and copy my backup file to my NAS
cd /home/antjrobles

echo ""
echo "Backup copy is running..." | toilet -f smmono9 --gay


sudo cp docker-backup-$backupDate.tar.gz  /home/antjrobles/gdrive/Backups/raspy5/

# remove the tar file from the main home folder after it's copied
sudo rm docker-backup-$backupDate.tar.gz

echo "Backup at $backupDate is complete"
toilet --filter gay Backup Done.
