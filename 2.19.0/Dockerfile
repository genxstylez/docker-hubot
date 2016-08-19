FROM            allanlei/node:6.3.1

ENV             VERSION=2.19.0
ENV             PATH=$PATH:/usr/src/app/node_modules/coffee-script/bin:/usr/src/app/node_modules/hubot/bin
# ENV             HUBOT_NAME=hubot
# ENV             HUBOT_ADAPTER=shell
# ENV             HUBOT_ALIAS=false
# ENV             HUBOT_LOG_LEVEL=debug

WORKDIR         /usr/src/app
RUN             apk --no-cache add --virtual .build-deps \
                    build-base \
                    python \
                    git && \
                npm install \
                    hubot@$VERSION \
                    hubot-diagnostics \
                    hubot-help \
                    hubot-redis-brain && \
                apk del .build-deps

COPY            entrypoint.sh /
RUN             chmod +x /entrypoint.sh

EXPOSE          8080/tcp
# VOLUME          /usr/src/app/scripts

ENTRYPOINT      ["/entrypoint.sh", "hubot"]

ONBUILD COPY    package.json .
ONBUILD RUN     apk --no-cache add --virtual .build-deps \
                    build-base \
                    python \
                    git && \
                npm install && \
                apk del .build-deps
ONBUILD COPY    . .
