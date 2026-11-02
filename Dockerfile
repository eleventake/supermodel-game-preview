# Accepted v37 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v37-story-native-v48-20261030
USER root
RUN wget -q -O /tmp/party-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v38-party-native-v48/core-v38-native-v48-party-layer.zip     && echo "3d918770ad8e3b83ab07736e7508da3ea7cf300bedcb05e56d57a0b9118c5747  /tmp/party-layer.zip" | sha256sum -c -     && unzip -qo /tmp/party-layer.zip -d /usr/share/nginx/html     && rm /tmp/party-layer.zip     && grep -q '/assets/story-DQdTYxu2.js' /usr/share/nginx/html/index.html     && test -f /usr/share/nginx/html/party/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
