FROM            allanlei/node:6.3.1

ENV             VERSION=2.19.0

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
                    # hubot-diagnostics \
                    # hubot-help \
                    hubot-redis-brain && \
                apk del .build-deps

ENV             PATH=$PATH:/usr/src/app/node_modules/coffee-script/bin:/usr/src/app/node_modules/hubot/bin

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
                    cd $(npm root -g)/npm && \
                    npm install fs-extra && \
                    sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js && \
                    cd /usr/src/app && \
                    npm install && \

                apk del .build-deps
ONBUILD COPY    . .
