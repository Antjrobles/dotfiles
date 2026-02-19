
#!/bin/bash
backupDate=$(date  +'%F')

echo $backupDate

echo "Backup started at $backupDate" | toilet -f smmono9 --gay

# stop the containers
cd /home/antjrobles/appdata/beszel/
docker-compose stop

cd ../beszel-agent
docker-compose stop

cd ../bitwarden
docker-compose stop

cd ../cove
docker-compose stop

cd ../docker-controller-bot
docker-compose stop

cd ../filestash
docker-compose stop

cd ../it-tools
docker-compose stop

cd ../Perplexica
docker-compose stop

cd ../prometheus
docker-compose stop

#cd ../searxng
#docker-compose stop

cd ../smokeping
docker-compose stop

cd ../syncthing
docker-compose stop

cd ../watchyourlan
docker-compose stop

cd ../watchyourports
docker-compose stop

cd ../wetty
docker-compose stop


cd /home/antjrobles/
sudo tar -czvf docker-backup-$backupDate.tar.gz  /home/antjrobles/appdata/


cd /home/antjrobles/appdata/beszel/
docker-compose start

cd ../beszel-agent
docker-compose start

cd ../bitwarden
docker-compose start

cd ../docker-controller-bot
docker-compose start

#cd ../cove
#docker-compose start

cd ../filestash
docker-compose start

cd ../it-tools
docker-compose start

cd ../Perplexica
docker-compose start

cd ../prometheus
docker-compose start

#cd ../searxng
#docker-compose start

cd ../smokeping
docker-compose start

cd ../syncthing
docker-compose start

cd ../watchyourlan
docker-compose start

cd ../watchyourports
docker-compose start

cd ../wetty
docker-compose start
# now go back to home, and copy my backup file to my NAS
cd /home/antjrobles

echo ""
echo "Backup copy is running..." | toilet -f smmono9 --gay


sudo cp docker-backup-$backupDate.tar.gz  /home/antjrobles/gdrive/Backups/raspy4c/

# remove the tar file from the main home folder after it's copied
sudo rm docker-backup-$backupDate.tar.gz

echo "Backup at $backupDate is complete"
toilet --filter gay Backup Done.

















