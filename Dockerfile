# Accepted v33 image; exact ID and parent layer prefix are independently verified.
FROM local/super-model-preview:core-v33-cg-native-v46-20261022
USER root
RUN wget -q -O /tmp/preview-layer.zip https://github.com/eleventake/supermodel-game-preview/releases/download/core-v34-stable-native-v46/core-v34-native-v46-evening-layer.zip     && echo "b96c97ccd5e0841e1b5efdba205e73e7014a19ce08307a22ad523d89ad05fc3c  /tmp/preview-layer.zip" | sha256sum -c -     && unzip -qo /tmp/preview-layer.zip -d /usr/share/nginx/html     && rm /tmp/preview-layer.zip
COPY nginx.conf /etc/nginx/conf.d/default.conf
USER 101
EXPOSE 8080
