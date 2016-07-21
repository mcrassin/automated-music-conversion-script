SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in $(find -name \*.ogg.info -o -name \*.m4a.info -o -name \*.flac.info -o -name \*.aac.info -o -name \*.wma.info); do
    replace=""
	convertedFile=${f//.info/$replace}
	echo "removing $convertedFile"
	echo "removing $f"
done

IFS=$SAVEIFS

