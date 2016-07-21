SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in $(find -name \*.ogg -o -name \*.m4a -o -name \*.flac -o -name \*.aac -o -name \*.wma); do
    echo "$f"
done

IFS=$SAVEIFS

