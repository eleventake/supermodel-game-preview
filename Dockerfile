# Accepted v35 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v35-native-v47-20261023
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v36-stable-native-v48/core-v36-native-v48-layer.zip     && echo "df5e4cef4495ec57c9fc401d1031f902cb41166bcdb031d21f2f3d07a6dba15b  /tmp/native-layer.zip" | sha256sum -c -     && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html     && rm /tmp/native-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
