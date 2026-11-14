# Accepted v43 image. Exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v43-run-native-v57-20261114
USER root
RUN wget -q -O /tmp/ui-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v44-plates-native-v57/core-v44-native-v57-ui-layer.zip     && echo "352dc83b77af8e2a278e244f51f919b760a4f9ab23de51e5c1b2972784b71092  /tmp/ui-layer.zip" | sha256sum -c -     && unzip -qo /tmp/ui-layer.zip -d /usr/share/nginx/html     && rm /tmp/ui-layer.zip     && grep -q '/assets/party-DqWeHMET.js' /usr/share/nginx/html/party/index.html     && grep -q '/assets/party-BRWZpNPA.css' /usr/share/nginx/html/party/index.html     && grep -q 'combat-build-v57.loader.js' /usr/share/nginx/html/assets/combat/runtime.json
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
