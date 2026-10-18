# Accepted v23 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v23-stable-20261017
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v24-stable-native-v41/core-v24-native-v41-layer.zip \
    && echo "ea6654df8ba74bcbacad6daa975e8ddeafb34e4de6d0351895159442198d19f4  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
