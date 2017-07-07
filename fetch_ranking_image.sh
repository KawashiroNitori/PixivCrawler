#! /bin/bash

if [[ $# -lt 1 ]]
then
    page=1
else
    page=$1
fi

for i in $(./get_ranking.sh ${page})
do
    ./get_image.sh $i
done

