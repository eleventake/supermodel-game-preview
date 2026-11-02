# Accepted v38 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v38-party-native-v48-20261102
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v39-party-stage-native-v49/core-v39-native-v49-layer.zip     && echo "891ccd47f6c740e3658621982ba1dbd0986c2fc07537a3617f9b5eb04b615bed  /tmp/native-layer.zip" | sha256sum -c -     && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html     && rm /tmp/native-layer.zip     && wget -q -O /tmp/party-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v39-party-stage-native-v49/core-v39-native-v49-party-stage-layer.zip     && echo "e8bce047c76b091aa2b35691e7a6ab449e556c8f1c761a0f197dac7a2281c3f0  /tmp/party-layer.zip" | sha256sum -c -     && unzip -qo /tmp/party-layer.zip -d /usr/share/nginx/html     && rm /tmp/party-layer.zip     && grep -q 'combat-build-v49.loader.js' /usr/share/nginx/html/assets/combat/runtime.json     && grep -q '/assets/party-C0sJIxvx.js' /usr/share/nginx/html/party/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
