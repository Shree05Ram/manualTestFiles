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

echo $cookieArg
##################	Event	##############
DeviceID=$1		#Pass device Id while executing as an argument ./eventFromCloud.sh 060ff308-c2d0-41e1-be05-527d98ba992a
curlArgs="https://$PartnerURL/es/api/es/v1/device/$DeviceID/busev"
resp=`curl -s -k --cookie $cookieArg -H "Content-Type: application/json" -X POST -d @eventData.json $curlArgs`
echo $resp
