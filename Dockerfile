# Super Model website as served by the v42 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v43/native-v57 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v43-run-native-v57-20261114 AS game

FROM local/supermodel-web-staging:web-play-core-v42-20261107
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v56.*' ! -name 'combat-build-v57.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v43-run-native-v57/core-v43-native-v57-web-play-layer.zip \
    && echo "54d4291050bb7afddaaab2a839fa0c534ff401d1c842ba65a5fa886fa7786282  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-kBiDvPis.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-RLebPmJV.js' party/index.html && grep -q 'combat-build-v57' assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
