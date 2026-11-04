# Super Model website as served by the v40 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v41/native-v50 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v41-text-native-v50-20261104 AS game

FROM local/supermodel-web-staging:web-play-core-v40-20261102
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v49.*' ! -name 'combat-build-v50.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v41-text-native-v50/core-v41-native-v50-web-play-layer.zip \
    && echo "4c6df6fb20d23b7f3bcb454944e2c73b09c7477b9cc1bead322a07dfee49f3af  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-kBiDvPis.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-BzSSxGmv.js' party/index.html && grep -q 'combat-build-v50' assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
