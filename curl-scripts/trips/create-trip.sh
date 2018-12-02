#!/bin/bash

curl "http://localhost:4741/trips" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "trip": {
      "location": "'"${LOCATION}"'",
      "date": "'"${DATE}"'",
      "equipment": "'"${EQUIPMENT}"'"
    }
  }'

echo
