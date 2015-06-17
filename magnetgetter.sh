
curl "https://getstrike.net/api/v2/torrents/search/?phrase=debian" | tr '}' "\n" | awk -F "\"seeds\":" '{print $1$2}' | awk -F "," '{if($7 > 1000) print $0}' | head | awk -F "magnet_uri\":\"" '{print $2}'

