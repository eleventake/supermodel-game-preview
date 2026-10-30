# Super Model website as served on supermodel-web-staging (bootstrap 33b06ce, unchanged)
# with the accepted core-v37/native-v48 game under /play/ and a Play link in the header.
FROM local/super-model-preview:core-v37-story-native-v48-20261030 AS game

FROM local/supermodel-web:bootstrap-33b06ce
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v47.*' ! -name 'combat-build-v48.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v37-stable-native-v48/core-v37-native-v48-web-play-layer.zip \
    && echo "8e1a1180288630f8bbf2bf3a7012789b717abec5d9af0072afb2b2c85f3568f8  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-' index.html && grep -q '/play/assets/combat-' combat/index.html
COPY site-play-link.sh /tmp/site-play-link.sh
RUN sh /tmp/site-play-link.sh /usr/share/nginx/html/index.html && rm /tmp/site-play-link.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
