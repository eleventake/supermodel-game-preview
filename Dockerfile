# Accepted v42 image. Exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v42-arcana-native-v56-20261105
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v43-run-native-v57/core-v43-native-v57-layer.zip \
    && echo "3fca7930d5166d5af80e4ffb7579b42330429f16f02733a32c0cd7ae0109a3ee  /tmp/native-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/native-layer.zip \
    && grep -q 'combat-build-v57.loader.js' /usr/share/nginx/html/assets/combat/runtime.json
RUN wget -q -O /tmp/ui-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v43-run-native-v57/core-v43-native-v57-ui-layer.zip \
    && echo "8165888569598a60f9e99f03a6f1f070b837dcae140638a8cfafb9705db51e02  /tmp/ui-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/ui-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/ui-layer.zip \
    && grep -q '/assets/party-D0KiLbd4.js' /usr/share/nginx/html/party/index.html \
    && test -s /usr/share/nginx/html/assets/combat/copy-portrait.webp
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
