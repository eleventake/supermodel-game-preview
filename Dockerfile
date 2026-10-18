# Accepted v25 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v25-native-v42-20261018
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v26-stable-native-v43/core-v26-native-v43-layer.zip \
    && echo "a5d8d24783ee1e58f2b68a3d2451fb8de20b842cf84775e4a152cec0e49ba533  /tmp/preview-layer.zip" | sha256sum -c - \
    && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html \
    && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
