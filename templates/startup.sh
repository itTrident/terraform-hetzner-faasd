#!/bin/bash

mkdir -p /var/lib/faasd/secrets/
echo ${basic_auth_user} > /var/lib/faasd/secrets/basic-auth-user
echo ${basic_auth_password} > /var/lib/faasd/secrets/basic-auth-password

export LETSENCRYPT_EMAIL="${email}"
export FAASD_DOMAIN="${domain}"

bash <(curl -sfL https://raw.githubusercontent.com/openfaas/faasd/master/hack/install.sh)