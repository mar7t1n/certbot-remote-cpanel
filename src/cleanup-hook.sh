#!/bin/bash
echo "-- CLEANUP --"

echo "You need to delete - additional_domains/${DOMAIN}/public_html/.well-known/acme-challenge/${CERTBOT_TOKEN}"

# My hosting cPanel API does not support deleting files via API - you could of course use FTP or call a PHP cleanup script here.
# For now I just delete them by hand when I'm maintaining the site.
