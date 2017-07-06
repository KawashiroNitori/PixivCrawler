#! /bin/bash

for i in $(./get_ranking.sh)
do
    ./get_image.sh $i
done

