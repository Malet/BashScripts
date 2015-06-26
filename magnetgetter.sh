#/bin/bash

echo "Enter a Torrent to search for"

read Torrent

curl "https://getstrike.net/api/v2/torrents/search/?phrase="$Torrent | tr '}' "\n" | awk -F "\"seeds\":" '{print $1$2}' | awk -F "," '{if($7 > 1000) print $0}' | head | awk -F "magnet_uri\":\"" '{print $2}'
