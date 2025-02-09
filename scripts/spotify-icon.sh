#!/bin/bash

# access_token=`curl -X POST "https://accounts.spotify.com/api/token" \
#      -H "Content-Type: application/x-www-form-urlencoded" \
#      -d "grant_type=client_credentials&client_id=d3b6a50e31a147e7a4626278514ecefa&client_secret=8bf277b94c1f494f808309b09442ed11" | jq .access_token | tr -d '"'`

access_token=`curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=d3b6a50e31a147e7a4626278514ecefa&client_secret=8bf277b94c1f494f808309b09442ed11" | jq .access_token | jq -d '"'`


echo $access_token

curl --request GET \
  --url https://api.spotify.com/v1/me/player \
  --header "Authorization: Bearer $access_token" | jq 
