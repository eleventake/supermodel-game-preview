# Super Model website with the game under /play/

Image for the `supermodel-web-staging` OVH target. It starts from the website image already
served there (`local/supermodel-web:bootstrap-33b06ce`, unchanged) and adds the accepted
core-v36/native-v48 game under `/play/`: the served v36 preview tree with only the current
native build, plus a small layer whose HTML and bundles are built for the `/play/` base.
A secondary "Play" button is added before "Get $SM" in the site header.

Source/image build is separate from release acceptance. No GitHub Actions or auto deploy.
