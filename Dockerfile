# Super Model website as served by the v41 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v42/native-v56 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v42-arcana-native-v56-20261105 AS game

FROM local/supermodel-web-staging:web-play-core-v41-20261104
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v50.*' ! -name 'combat-build-v56.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v42-arcana-native-v56/core-v42-native-v56-web-play-layer.zip \
    && echo "534fc2015b3224fcf6620d19183f059ff8fdcfaae5e0eba198182a24eb37465b  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-kBiDvPis.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-C-dkyW2V.js' party/index.html && grep -q 'combat-build-v56' assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
