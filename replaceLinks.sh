#!/bin/bash
if [[ ! -e /Scripts/file.txt ]]; then
    mkdir -p /Scripts
    touch /Scripts/affectedFiles.txt
else
    cat /dev/null > /Scripts/affectedFiles.txt
fi

n=1
while IFS=, read -r a b;
do
if [ $n -ne 1 ] && [ $n -lt 4 ]
then  
        #echo "$a $b"
        files=$(grep -rl "$a" $2)
        for item in $files
        do
            echo "$item" >> /Scripts/affectedFiles.txt
            sed -i '' "s#${a}#${b}#g" $item
        done
fi
n=$((n+1))
done < "$1"
echo "done"
