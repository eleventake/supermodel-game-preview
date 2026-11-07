# Super Model website with the game under /play/

Image for the `supermodel-web-staging` OVH target. It starts from the v41 website image
already served there (`local/supermodel-web-staging:web-play-core-v41-20261104`: the unchanged bootstrap 33b06ce site
with the Play button) and lays the core-v42/native-v56 game over `/play/`: the served v42 preview tree with only the current
native build, plus a small layer whose HTML and bundles are built for the `/play/` base.
A secondary "Play" button is added before "Get $SM" in the site header.

Source/image build is separate from release acceptance. No GitHub Actions or auto deploy.
