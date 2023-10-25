FROM certbot/dns-cloudflare

RUN wget https://github.com/simophin/cron-run/releases/download/0.4.0/cron-run.linux.`uname -m` -O /usr/local/bin/cron-run && \
    chmod +x /usr/local/bin/cron-run

COPY entrypoint.sh /

ENV DNS_CLOUDFLARE_API_TOKEN=
ENV CRON=
ENV TZ=
ENV DOMAINS=
ENV EMAIL=
ENV TEST_ONLY=true

CMD ["/entrypoint.sh"]
ENTRYPOINT ["/bin/sh"]

VOLUME /certs