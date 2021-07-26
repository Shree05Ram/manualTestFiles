#!/bin/bash

DIR="scale-output-file"

for (( i=1; i<=10; i++ ))
do
        FILE="bt-file-$i.sh"

        cat << EOF > $DIR/$FILE
#!/bin/bash

metric=scale-bt-$i
value=\$RANDOM

echo fieldkey=\$metric
echo unit=C
echo value=\$value
EOF

        if [ -f "$DIR/$FILE" ]; then
                chmod +x $DIR/$FILE
        else
                echo "File doesn't exists"
        fi
done
