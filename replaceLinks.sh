#!/bin/bash
# A Simple Shell Script That Updates Old Annotation Links With the New Ones

# if affectedFiles.txt does not exist then create one, otherwise clear it to be an empty txt file
if [[ ! -e affectedFiles.txt ]]; then
    touch affectedFiles.txt
else
    cat /dev/null > affectedFiles.txt
fi


n=1

# Reads each line in the mapping file, separated by ,
while IFS=, read -r a b;
do
# skips first line
if [ $n -ne 1 ]
then  
        # find all files with old annotation links
        files=$(grep -rl "$a" $2)
        # for each file, write the file name to the affectedFiles.txt and replace the old link then removes carriage return
        for item in $files
        do
            echo "Affected files with old link: $a , new link: $b" >> affectedFiles.txt
            echo "$item" >> affectedFiles.txt
            sed -i '' "s#${a}#${b}#g" $item
            sed -i.bak $'s/\r//' $item
        done
fi

# increment n
n=$((n+1))
done < "$1"

# prints done upon finish
echo "done"


