if [[ $# -lt 1 ]]
then
    echo "Usage: $0 illust_id"
    exit 1
fi

ILLUST_ID=$1

echo "Fetching image ${1}..."
illust_page="https://www.pixiv.net/member_illust.php?mode=medium&illust_id=${ILLUST_ID}"
image_page=$(curl --cookie .cjar --cookie-jar .cjar "${illust_page}" 2> /dev/null)
image_regex='_illust_modal.*data-src="(.*)" class="original-image"'

if [[ $image_page =~ $image_regex ]]
then
    image_url="${BASH_REMATCH[1]}"
else
    echo "No image url matched, skipped."
    exit 1
fi

wget -nc --cookies=on --load-cookies .cjar --referer="${illust_page}" "${image_url}"

