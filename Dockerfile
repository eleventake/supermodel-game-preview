# Accepted v28 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v28-ui-native-v44-20261020
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v29-stable-interlude-native-v44/core-v29-native-v44-interlude-layer.zip \
    && echo "f879e8fae8540f2c68121d68c9ca4ff46a86836163cf7ba8f25117e22034660b  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
