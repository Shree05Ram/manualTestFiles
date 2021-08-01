# "Stress" Should be installed on the device 
#!/bin/bash
while [ 1 ];
do
	echo "monitoring process" `date` >> process monitoring.txt
	sleep 2s
	stress --cpu 64 --io 40 --vm 200 --vm-bytes 12800M
done;
