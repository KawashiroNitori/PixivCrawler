#! /bin/bash

ranking_json=$(curl --cookie .cjar --cookie-jar .cjar 'https://www.pixiv.net/ranking.php?mode=daily&content=illust&format=json' 2> /dev/null)
id_regex='"illust_id":([0-9]+),'

extract() {
    while [[ $1 ]]
    do
        [[ $1 =~ $id_regex ]] && echo "${BASH_REMATCH[1]}"
        shift
    done
}

extract $ranking_json

