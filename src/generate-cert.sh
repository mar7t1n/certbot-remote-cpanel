#!/bin/bash

# Main script - usage generate-cert.sh <config-file>

CONFIG=${1:-env.config}

echo "Cert renewal using conig ${CONFIG}"

source ${CONFIG}
export $(cut -d= -f1 ${CONFIG})

DOMAINS="${DOMAIN},www.${DOMAIN}"

if [[ -z "${APIKEY}" ]]; then
        echo "No config provided"
else
        # add --test-cert for testing
        # renewal of *. domains is possible if you have access to the DNS

        sudo --preserve-env certbot certonly \
        --register-unsafely-without-email --manual \
        -d ${DOMAINS} \
        --manual-auth-hook ./auth-hook.sh \
        --manual-cleanup-hook ./cleanup-hook.sh

        ./install-cert.sh
fi
