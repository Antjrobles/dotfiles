#!/bin/bash

# Variables
SOURCE_DATA="/home/antjrobles/ourdrive/data/"
SOURCE_TEMP="/home/antjrobles/ourdrive/temp/"
REMOTE_USER="antjrobles"
REMOTE_HOST="raspy4" 
DEST_BASE="/mnt/BLUEDRIVE/ourdrive-backup/"
DEST_DATA="${REMOTE_USER}@${REMOTE_HOST}:${DEST_BASE}data/"
DEST_TEMP="${REMOTE_USER}@${REMOTE_HOST}:${DEST_BASE}temp/"

# Sincronizar con rsync, incluyendo eliminación en destino
rsync -av --delete -e ssh "$SOURCE_DATA" "$DEST_DATA"
rsync -av --delete -e ssh "$SOURCE_TEMP" "$DEST_TEMP"
