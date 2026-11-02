# Super Model website as served by the v39 release (bootstrap 33b06ce site with the Play link,
# unchanged) with the core-v40/native-v50 game laid over /play/. Earlier /play/ files stay for open clients.
FROM local/super-model-preview:core-v40-ally-strikes-native-v50-20261102 AS game

FROM local/supermodel-web-staging:web-play-core-v39-20261102
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# The current native build and the previous one (clients opened before the switch) stay on the site.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v49.*' ! -name 'combat-build-v50.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v39-party-stage-native-v49/core-v39-native-v49-web-play-layer.zip \
    && echo "262c7c7687ca14282b2f5c6ec32977b4bc36d17a57499b3c61fba98f5e28e3f1  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-DTtgMm6f.js' index.html && grep -q '/play/assets/combat-' combat/index.html && grep -q '/play/assets/party-D_iSzlqb.js' party/index.html && grep -q 'combat-build-v50' assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
