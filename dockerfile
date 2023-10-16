FROM nginx
USER root
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/server.c /home/server.c
COPY ./server/script.sh /home/script.sh
RUN apt-get update && apt-get install -y \ 
    gcc \
    spawn-fcgi \ 
    libfcgi-dev \ 
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /home/script.sh \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /home \
    && chown -R nginx:nginx /var/run
USER nginx
WORKDIR /home/
CMD [ "/home/script.sh" ]
HEALTHCHECK CMD curl --fail http://localhost:80/status || exit 1
