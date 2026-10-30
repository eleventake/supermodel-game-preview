# Super Model website with the game under /play/

Image for the `supermodel-web-staging` OVH target. It starts from the v36 website image
already served there (`local/supermodel-web:web-play-core-v36`: the unchanged bootstrap 33b06ce site
with the Play button) and lays the core-v37/native-v48 game over `/play/`: the served v37 preview tree with only the current
native build, plus a small layer whose HTML and bundles are built for the `/play/` base.
A secondary "Play" button is added before "Get $SM" in the site header.

Source/image build is separate from release acceptance. No GitHub Actions or auto deploy.
