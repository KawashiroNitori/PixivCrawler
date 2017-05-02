 USERNAME=$1
 PASSWORD=$2

 echo "Logging in with ${1}..."
 login_page=$(curl --cookie-jar .cjar https://accounts.pixiv.net/login 2> /dev/null)
 post_key_regex='name="post_key" value="([a-z0-9]+)"'

 if [[ $login_page =~ $post_key_regex ]]
 then
     post_key="${BASH_REMATCH[1]}"
     post_data="pixiv_id=${USERNAME}&password=${PASSWORD}&post_key=${post_key}"
 fi

 curl --cookie .cjar --cookie-jar .cjar https://accounts.pixiv.net/login -d $post_data 2> /dev/null
 echo "Done."
