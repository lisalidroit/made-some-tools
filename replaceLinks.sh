#!/bin/bash
if [[ ! -e affectedFiles.txt ]]; then
    touch affectedFiles.txt
else
    cat /dev/null > affectedFiles.txt
fi

n=1
while IFS=, read -r a b;
do
if [ $n -ne 1 ]
then  

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
