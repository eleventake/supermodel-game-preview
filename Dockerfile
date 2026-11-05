# Accepted v41 image. Exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v41-text-native-v50-20261104
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v42-arcana-native-v56/core-v42-native-v56-layer.zip \
    && echo "c156b8fdd71e3e665624e8e9a8c803d6d86be9fdaeb827ea05db87dbe6fc03d8  /tmp/native-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/native-layer.zip \
    && grep -q 'combat-build-v56.loader.js' /usr/share/nginx/html/assets/combat/runtime.json
RUN wget -q -O /tmp/ui-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v42-arcana-native-v56/core-v42-native-v56-ui-layer.zip \
    && echo "7ef6bee3aa4e0d15924c406f8529bba9d485da3375c3ee84a64551bef5040af4  /tmp/ui-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/ui-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/ui-layer.zip \
    && grep -q '/assets/party-pjr55DZV.js' /usr/share/nginx/html/party/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
