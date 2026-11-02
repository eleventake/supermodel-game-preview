# Accepted v39 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v39-party-stage-native-v49-20261102
USER root
RUN wget -q -O /tmp/native-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v40-ally-strikes-native-v50/core-v40-native-v50-layer.zip     && echo "0df2c678f79ec6e350afe3a8f13a767012b9884333c66ddc19698835137ae510  /tmp/native-layer.zip" | sha256sum -c -     && unzip -qo /tmp/native-layer.zip -d /usr/share/nginx/html     && rm /tmp/native-layer.zip     && grep -q 'combat-build-v50.loader.js' /usr/share/nginx/html/assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
