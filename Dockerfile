# Accepted v34 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v34-evening-native-v46-20261023
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v35-stable-native-v47/core-v35-native-v47-layer.zip     && echo "a135d21232c36cc65a0f14e5f38ca931078dfa2dae96da8334ad65b8a27dc48f  /tmp/native-layer.zip" | sha256sum -c -     && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html     && rm /tmp/native-layer.zip
RUN wget -q -O /tmp/frontend-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v35-stable-native-v47/core-v35-native-v47-frontend-layer.zip     && echo "e62ff9732652ba2e262008385eadf0926791ad4b35e314c04e5a9a67c67608b6  /tmp/frontend-layer.zip" | sha256sum -c -     && unzip -qo /tmp/frontend-layer.zip -d /usr/share/nginx/html     && rm /tmp/frontend-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
