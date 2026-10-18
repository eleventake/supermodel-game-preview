# Accepted v24 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v24-native-v41-20261018
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v25-stable-native-v42/core-v25-native-v42-layer.zip \
    && echo "5da55eb09aa15c6a80dcf2dd096540003bf07d7b4ba10d9a71a087b5b1e020f4  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
