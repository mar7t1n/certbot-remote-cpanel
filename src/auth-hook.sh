#!/bin/bash

echo "-- AUTH HOOK --"

echo $CERTBOT_VALIDATION > temp.token

echo "UPLOAD TO ${CERTBOT_TOKEN}"
echo "dir=additional_domains/${DOMAIN}/public_html/.well-known/acme-challenge" \
        echo "user = ${USER}"

curl -F "file=@temp.token;filename=${CERTBOT_TOKEN}" \
     -F "dir=additional_domains/${DOMAIN}/public_html/.well-known/acme-challenge" \
     -H "Authorization: cpanel ${APIUSR}:${APIKEY}" \
     https://${HOST}:2083/execute/Fileman/upload_files

rm temp.token

echo "-- UPLOAD DONE --"
