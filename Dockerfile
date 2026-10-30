# Accepted v36 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v36-native-v48-20261023
USER root
RUN wget -q -O /tmp/story-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v37-stable-native-v48/core-v37-native-v48-story-layer.zip     && echo "c2b6d3f6365475c9857244d36d32f4402702321f06856a6b3e4fec7bb0bf335b  /tmp/story-layer.zip" | sha256sum -c -     && unzip -qo /tmp/story-layer.zip -d /usr/share/nginx/html     && rm /tmp/story-layer.zip     && grep -q '/assets/story-Be27mVA_.js' /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
