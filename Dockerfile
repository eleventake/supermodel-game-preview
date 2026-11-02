# Super Model website as served by the v37 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v38/native-v48 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v38-party-native-v48-20261102 AS game

FROM local/supermodel-web:web-play-core-v37
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v47.*' ! -name 'combat-build-v48.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v38-party-native-v48/core-v38-native-v48-web-play-layer.zip \
    && echo "71014c4dd261907e881b72eb2a0b00ff5ff8c7440c1e80650219052a02007a65  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-DTtgMm6f.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-' party/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
