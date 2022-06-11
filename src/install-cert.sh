#!/bin/bash

echo "-- INSTALL CERT --"

CERT=$(sudo cat /etc/letsencrypt/live/${DOMAIN}/cert.pem)
KEY=$(sudo cat /etc/letsencrypt/live/${DOMAIN}/privkey.pem)

curl -F "domain=${DOMAIN}" \
     -F "cert=${CERT}" \
     -F "key=${KEY}" \
     -H "Authorization: cpanel ${APIUSR}:${APIKEY}" \
     https://${HOST}:2083/execute/SSL/install_ssl

echo "-- INSTALL DONE --"
