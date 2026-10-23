# Super Model website as served on supermodel-web-staging (bootstrap 33b06ce, unchanged)
# with the accepted core-v36/native-v48 game under /play/ and a Play link in the header.
FROM local/super-model-preview:core-v36-native-v48-20261023 AS game

FROM local/supermodel-web:bootstrap-33b06ce
USER root
COPY --from=game /usr/share/nginx/html /usr/share/nginx/html/play
# Only the current native build is needed on the site; older client builds stay on the preview.
RUN cd /usr/share/nginx/html/play \
    && find assets/combat/Build -type f -name 'combat-build-v*' ! -name 'combat-build-v48.*' -delete \
    && wget -q -O /tmp/web-play-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v35-stable-native-v47/core-v35-native-v47-web-play-layer.zip \
    && echo "12297db703c5b1767c52c716479f1a4eaeb894d3aa2e1d889e8a6b1930c8b02a  /tmp/web-play-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/web-play-layer.zip -d /usr/share/nginx/html/play \
    && rm /tmp/web-play-layer.zip \
    && grep -q '/play/assets/story-' index.html && grep -q '/play/assets/combat-' combat/index.html
COPY site-play-link.sh /tmp/site-play-link.sh
RUN sh /tmp/site-play-link.sh /usr/share/nginx/html/index.html && rm /tmp/site-play-link.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
