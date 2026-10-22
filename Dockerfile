# Accepted v31 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v31-product-native-v46-20261022
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v32-stable-native-v46/core-v32-native-v46-spicy-layer.zip     && echo "a6913de9232e91fca7c92e1ca62a41aa101d15c67c4144db9cbbdbb3f8557b6c  /tmp/preview-layer.zip" | sha256sum -c -     && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html     && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
