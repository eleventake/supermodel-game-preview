# Accepted v27 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v27-native-v44-20261018
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v28-stable-ui-native-v44/core-v28-native-v44-ui-layer.zip \
    && echo "f1c09495110b3ee77a18ddf67e7666628eb0057d894253c370cec77613ba960d  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
