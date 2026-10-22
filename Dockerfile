# Accepted v30 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v30-native-v46-20261021
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v31-stable-native-v46/core-v31-native-v46-product-layer.zip     && echo "e917e01a567895c8365a4408a6d98225288a17ee369eedcf8872c126b7c349bc  /tmp/preview-layer.zip" | sha256sum -c -     && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html     && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
