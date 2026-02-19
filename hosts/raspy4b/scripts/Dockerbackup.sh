
#!/bin/bash
backupDate=$(date  +'%F')

echo $backupDate

echo "Backup started at $backupDate" | toilet -f smmono9 --gay

cowsay "Stopping all the containers"

# stop the containers
cd /home/antjrobles/appdata/alertmanager/
docker-compose stop

cd ../blackbox
docker-compose down

cd ../dashy
docker-compose stop

cd ../filebrowser
docker-compose stop

cd ../matomo
docker-compose stop

#cd ../n8n
#docker-compose stop

cd ../navidrome
docker-compose stop

cd ../nextcloud
docker-compose stop

cd ../ntfy
docker-compose stop

cd ../plex
docker-compose stop

#cd ../podgrab
#docker-compose stop

cd ../prometheus
docker-compose stop

cd ../system_monitor
docker-compose stop

cd ../uptimekuma
docker-compose stop

cd ../wireguard
docker-compose stop


cd /home/antjrobles/
sudo tar -czvf docker-backup-$backupDate.tar.gz --exclude='podgrab'  /home/antjrobles/appdata/


cd appdata/alertmanager
docker-compose start


cd ../dashy
docker-compose start

cd ../filebrowser
docker-compose start

cd ../matomo
docker-compose start

#cd ../n8n
#docker-compose start

cd ../navidrome
docker-compose start

cd ../nextcloud
docker-compose start

cd ../ntfy
docker-compose start

cd ../plex
docker-compose start

cd ../prometheus
docker-compose start

cd ../system_monitor
docker-compose start

cd ../uptimekuma
docker-compose start

cd ../wireguard
docker-compose start

# now go back to home, and copy my backup file to my NAS
cd /home/antjrobles

echo ""
echo "Backup copy is running..." | toilet -f smmono9 --gay


sudo cp docker-backup-$backupDate.tar.gz  /home/antjrobles/gdrive/Backups/raspy4b/

# remove the tar file from the main home folder after it's copied
sudo rm docker-backup-$backupDate.tar.gz

echo "Backup at $backupDate is complete"
toilet --filter gay Backup Done.
