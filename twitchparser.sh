curl -H 'Accept: application/vnd.twitchtv.v3+json' -X GET "https://api.twitch.tv/kraken/games/top?limit=100" | awk -F "top\":" '{ print $2 }' | cut -b 2- | sed s'/..$//' | sed 's/},{/\n{/g'
