# A docker image that automatically renews letsencrypt certificate

## Usage

```bash
$ docker run -it \
    -v "CERT_DIR:/etc/letsencrypt/live" \
    -e DOMAIN=example.com \
    -e TZ=Australia/Melbourne \
    -e EMAIL=webmaster@example.com \
    -e "CRON=0 0 1 * *" \
    -e TEST_ONLY=false \
    simophin/certbot-dns-cloudflare:latest
```

## The environment variables

The table below list available environment variables

| Name | Description | Example |
| DOMAIN | **Required**. Domain name(s) to obtain the certificate for. Separated by comma | example.com,mydomain.net |
| TZ | **Required**. Timezone of the cron expression | Australia/Melbourne |
| EMAIL | **Required**. Email address to register with letsencrypt | webmaster@example.com |
| CRON | **Required**. Cron expression to run the renewal | weekly:  0 0 1 * *. Syntax refers to [Wiki](https://en.wikipedia.org/wiki/Cron) |
| TEST_ONLY | **Required**. If set to true, obtain a test (staging) certificate only. Default to true. You need to explicitly set to false to obtain a real certificate | false |