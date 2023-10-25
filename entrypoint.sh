#!/bin/sh

set -e

if [ -z "$DOMAINS" ]; then
  echo "DOMAINS is not set"
  exit 1
fi

if [ -z "$EMAIL" ]; then
  echo "EMAIL is not set"
  exit 1
fi

if [ -z "$DNS_CLOUDFLARE_API_TOKEN" ]; then
  echo "DNS_CLOUDFLARE_API_TOKEN is not set"
  exit 1
fi

if [ -z "$CRON" ]; then
  echo "CRON is not set"
  exit 1
fi

cleanup() {
  rm -f credentials.ini
}

trap cleanup EXIT

echo "dns_cloudflare_api_token = $DNS_CLOUDFLARE_API_TOKEN" > credentials.ini

chmod 600 credentials.ini


TEST_ONLY_ARGS=

if [ "$TEST_ONLY" = "true" ]; then
  echo "Running in test mode"
  TEST_ONLY_ARGS="--test-cert"
fi

cron-run -r -s "$CRON" -- sh -c "certbot -n $TEST_ONLY_ARGS certonly --dns-cloudflare --dns-cloudflare-credentials credentials.ini \
    -d $DOMAINS --agree-tos --email $EMAIL && cp -rvL /etc/letsencrypt/live/* /certs/"
