# Super Model website with the game under /play/

Image for the `supermodel-web-staging` OVH target. It starts from the v42 website image
already served there (`local/supermodel-web-staging:web-play-core-v43-20261114`: the unchanged bootstrap 33b06ce site
with the Play button) and lays the core-v44/native-v57 game over `/play/`: the served v44 preview tree with only the current
native build, plus a small layer whose HTML and bundles are built for the `/play/` base.
A secondary "Play" button is added before "Get $SM" in the site header.

Source/image build is separate from release acceptance. No GitHub Actions or auto deploy.
