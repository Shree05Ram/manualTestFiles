#!/bin/bash

FILE1=~/.trove
if [ ! -d "$FILE1" ]; then
    mkdir "$FILE1"
fi

FILE2=$FILE1/mender-artifact
if [ ! -f "$FILE2" ]; then
    echo
    echo "Downloading mender-artifact binary"

    wget https://d1b0l86ne08fsf.cloudfront.net/mender-artifact/3.0.0/mender-artifact -P "$FILE1" -o "$FILE2.debug"
    sudo chmod +x "$FILE2"
fi

FILE3=./artifacts
if [ ! -d "$FILE3" ]; then
    mkdir "$FILE3"
fi

FILE4=$FILE1/myhelloscript.sh

cat << EOF > "$FILE4"
sleep 20
echo "Hello world for mender testing" > /data/hello.output
EOF

FILE5=$FILE1/mybyescript.sh

cat << EOF > "$FILE5"
sleep 20
echo "good bye world for mender testing" > /data/bye.output
EOF

echo
echo "Generating mender artifacts"

begin=$1
end=$(($begin + 9))

for i in $(seq $begin $end)
do
    $FILE2 write module-image --device-type armv7l --output-path $FILE3/script-file-$i.mender --type script --artifact-name artifact-script-file-$i --file "$FILE4" --file "$FILE5"
done

echo "Done"

