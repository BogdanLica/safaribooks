#!/bin/bash

# In each direcotry, find the epub file
# rename it as the parent folder, one level up
# and delete the parent folder



parent_folder=$1

for i in $parent_folder/*
do
folder_name=$(echo $i | sed -e 's/[^a-zA-Z]*//g')
mv "$i" "$folder_name"
done




for j in ./*
do


if [[ -d $j ]]; then

    for k in $j/*
    do

    if file --mime-type "$k" | grep  "application/zip"; then
    newFileName=$(echo $j.epub | cut -d "/" -f2 | awk '{ gsub("Books",""); print $1 }')
    mv "$k" "$newFileName"
fi

    done
    rm -r $j
elif [[ -f $j ]]; then
    echo ""
else
    echo "$j is not valid"
    exit 1
fi

done


