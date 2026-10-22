# Accepted v32 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v32-spicy-native-v46-20261022
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v33-stable-native-v46/core-v33-native-v46-cg-layer.zip     && echo "5b665b7009de853181aa7aa333b65e475bde579f9c63216dec444b68152d4116  /tmp/preview-layer.zip" | sha256sum -c -     && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html     && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
