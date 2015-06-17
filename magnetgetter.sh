
curl "https://getstrike.net/api/v2/torrents/search/?phrase=game%20of%20thrones%20S05E09" | tr '}' "\n" | awk -F "\"seeds\":" '{print $1$2}' | awk -F "," '{if($7 > 1000) print $0}' | grep 1080p | head | awk -F "magnet_uri\":\"" '{print $2}'

