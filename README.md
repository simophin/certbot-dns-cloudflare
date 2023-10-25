# A docker image that automatically renews letsencrypt certificate using cloudflare dns challenge

## Usage

```bash
$ docker run -it \
    -v "CERT_DIR:/certs" \
    -e DOMAINS=example.com \
    -e TZ=Australia/Melbourne \
    -e EMAIL=webmaster@example.com \
    -e "CRON=0 0 1 * *" \
    -e TEST_ONLY=false \
    -e "DNS_CLOUDFLARE_API_TOKEN=abcde"
    simophin/certbot-dns-cloudflare:latest
```

## Cert data

Certs will be generated and copied to `/certs` directory. 


## The environment variables

The table below list available environment variables

| Name | Description | Example |
| ---- | ----------- | ------- |
| DOMAINS | **Required**. Domain name(s) to obtain the certificate for. Separated by comma | example.com,mydomain.net |
| TZ | **Required**. Timezone of the cron expression | Australia/Melbourne |
| EMAIL | **Required**. Email address to register with letsencrypt | webmaster@example.com |
| CRON | **Required**. Cron expression to run the renewal | weekly:  0 0 1 * *. Refer to [Wiki](https://en.wikipedia.org/wiki/Cron) |
| TEST_ONLY | **Required**. If set to true, obtain a test (staging) certificate only. Default to true. You need to explicitly set to false to obtain a real certificate | false |
| DNS_CLOUDFLARE_API_TOKEN | **Required**. Cloudflare API token. Refer to [Cloudflare API Tokens](https://developers.cloudflare.com/api/tokens/) for more information | abc123 |
