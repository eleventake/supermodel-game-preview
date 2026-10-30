# Super Model website as served by the v36 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v37/native-v48 game laid over /play/. The bootstrap base image is no
# longer on the host, so the served v36 image is the base; its /play/ files stay for open clients.
FROM local/super-model-preview:core-v37-story-native-v48-20261030 AS game

FROM local/supermodel-web:web-play-core-v36
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v47.*' ! -name 'combat-build-v48.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v37-stable-native-v48/core-v37-native-v48-web-play-layer.zip \
    && echo "8e1a1180288630f8bbf2bf3a7012789b717abec5d9af0072afb2b2c85f3568f8  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-fjj51_Wd.js' index.html && grep -q '/play/assets/combat-' combat/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
