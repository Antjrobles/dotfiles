#!/bin/bash
backupDate=$(date  +'%F')

echo $backupDate

echo "Backup started at $backupDate" | toilet -f smmono9 --gay

cowsay "Stopping all the containers"

# stop the containers
cd /home/antjrobles/appdata/beszel-agent/
docker compose stop

cd ../cloudbeaver
docker compose stop

cd ../grafana
docker compose stop

#cd ../invidious
#docker compose stop

cd ../joplin
docker compose stop

cd ../libreddit
docker compose stop

cd ../linkwarden
docker compose stop

cd ../mealie
docker compose stop

cd ../prometheus
docker compose stop

cd ../spotify
docker compose stop

cd ../stirling
docker compose stop


cd /home/antjrobles/
sudo tar -czvf docker-backup-$backupDate.tar.gz /home/antjrobles/appdata/


cd appdata/beszel-agent
docker compose start


cd ../cloudbeaver
docker compose start

cd ../grafana
docker compose start

#cd ../invidious
#docker compose start

cd ../joplin
docker compose start

cd ../libreddit
docker compose start

cd ../linkwarden
docker compose start

cd ../mealie
docker compose start

cd ../prometheus
docker compose start

cd ../spotify
docker compose start

cd ../stirling
docker compose start

# now go back to home, and copy my backup file to my NAS
cd /home/antjrobles

echo ""
echo "Backup copy is running..." | toilet -f smmono9 --gay


sudo cp docker-backup-$backupDate.tar.gz  /home/antjrobles/gdrive/Backups/raspy4d/

# remove the tar file from the main home folder after it's copied
sudo rm docker-backup-$backupDate.tar.gz

echo "Backup at $backupDate is complete"
toilet --filter gay Backup Done.
