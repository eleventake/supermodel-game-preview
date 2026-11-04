# Accepted v40 image. Exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v40-ally-strikes-native-v50-20261102
USER root
RUN wget -q -O /tmp/text-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v41-text-native-v50/core-v41-native-v50-text-layer.zip     && echo "e4229c95cb0d9034458d8411e6e52899232cec2a7c036f8141304ab3eae8c027  /tmp/text-layer.zip" | sha256sum -c -     && unzip -qo /tmp/text-layer.zip -d /usr/share/nginx/html     && rm /tmp/text-layer.zip     && grep -q '/assets/story-Cgp8io5q.js' /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
