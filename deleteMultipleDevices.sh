#!/bin/sh

######## Prerequisite #########
# jq should be installed
###############################

######## Executing this Script #########
# ./deleteMultipleDevices.sh <Device_Profile_ID>
########################################

###############################################################################
#################   Start of configurations    ################################
###############################################################################
PartnerURL="test.aikaan.io"
PartnerLogin="admin@aikaan.io"
PartnerPassword="admin@123456"
###############################################################################
#################   End of configurations    ##################################
###############################################################################
#prepare the josn file to login
cat << EOF > data.json
{
	"name":"$PartnerLogin",
	"email":"$PartnerLogin",
	"password":"$PartnerPassword"
}
EOF
##Login to partner and get the JWT, note name is don't care for now
curlArgs="https://$PartnerURL/api/_external/auth/v1/signin -d  @data.json"
resp=`curl -s -k $curlArgs `
userID=`echo $resp | cut -d : -f 5 | cut -d \" -f 2`
jWT=`echo $resp | cut -d : -f 7 | cut -d \" -f 2`
cookieArg=$( printf 'aicon-jwt=%s' "$jWT" )
######################GET DEVICE IDs FROM DGP#############################
ProfileID=$1
#prepare the json payload to get the device IDs
cat << EOF > pdata.json
{
	"search_key": "",
	"sort": {
        "column_name": "createdAt",
        "order": "desc"
    	},
    	"tags": [],
    	"profileid": ["$ProfileID"],
    	"devicelist": []
}
EOF
DGPdevicesCurlArgs=" https://$PartnerURL/dm/api/dm/v1/device/search?limit=10&offset=0&profileType=0"
resp=`curl -s -k --cookie $cookieArg -d @pdata.json $DGPdevicesCurlArgs`
#echo $resp
echo $resp | jq '.devices | .[] | .id' | cut -d \" -f 2 > DeviceIds.txt
###################Delete Devices From DGP####################################
FILE="DeviceIds.txt"				#Enter the correct path of the DeviceIds.txt file 
for id in `cat $FILE`;
do
	DeleteCurlArgs="https://$PartnerURL/dm/api/dm/v1/device/$id"
	echo $DeleteCurlArgs
	echo device with $id will be deleted
	resp=`curl -s -k --cookie $cookieArg -X "DELETE" $DeleteCurlArgs`
	echo $resp
done
exit
