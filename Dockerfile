# Accepted v26 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v26-native-v43-20261018
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v27-stable-native-v44/core-v27-native-v44-layer.zip \
    && echo "16d458ccc961bb48099c749a30606852634460a50be9e332d7ffa356ae3ecfb2  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
