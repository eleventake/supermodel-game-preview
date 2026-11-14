# Super Model website as served by the v43 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v44/native-v57 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v44-plates-native-v57-20261114 AS game

FROM local/supermodel-web-staging:web-play-core-v43-20261114
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v56.*' ! -name 'combat-build-v57.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v44-plates-native-v57/core-v44-native-v57-web-play-layer.zip \
    && echo "7f5d94dd0a980e90f4b6ccba3931edd02a04005a71ac97e9fa4c9f5c47fc1ef0  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-kBiDvPis.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-DXChSPIf.js' party/index.html && grep -q 'combat-build-v57' assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
