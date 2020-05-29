curl --header "Content-Type: application/json" \
  --request POST \
  --data '{
  "severity": 2,
  "message":"Event Trigger test Warning",
  "data": {
        "tag1": 123,
        "tag2": "Test tag"
  },
  "notify": true
}' \
  http://127.0.0.1:1118/api/aiagent/v1/event
