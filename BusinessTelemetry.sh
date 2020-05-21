#!/bin/bash
echo fieldkey=test1
x=$(shuf -i 0-30 -n 1)
echo $x $(TZ=IST-5:30 date) >> /opt/aikaan/scripts/telemetry/val1.txt
echo value=$x   ## echo value=$RANDOM
echo unit=t
