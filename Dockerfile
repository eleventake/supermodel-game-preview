# Accepted v29 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v29-interlude-native-v44-20261020
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v30-stable-native-v46/core-v30-native-v46-layer.zip     && echo "92c43f7ac8e8d5eb2a6a66d9bc61c54f6bced9e34ac9297fa29034c5dbf36f66  /tmp/native-layer.zip" | sha256sum -c -     && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html     && rm /tmp/native-layer.zip
RUN wget -q -O /tmp/frontend-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v30-stable-native-v46/core-v30-native-v46-frontend-layer.zip     && echo "c1447bcbfd4d6ff1aa1f8b9053a6141da9c6842b19b74cc571567edd08ceb839  /tmp/frontend-layer.zip" | sha256sum -c -     && unzip -qo /tmp/frontend-layer.zip -d /usr/share/nginx/html     && rm /tmp/frontend-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
