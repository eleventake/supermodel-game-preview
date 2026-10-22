#!/bin/sh
# Adds a secondary "Play" button before "Get $SM" in the served site header. Fails unless
# the header and stylesheet anchors each occur exactly once and the link lands exactly once.
set -eu
f="$1"
[ "$(grep -c '<div class="header-actions">' "$f")" = 1 ]
[ "$(grep -c '</head>' "$f")" = 1 ]
sed -i 's#<div class="header-actions">#<div class="header-actions">\n        <a class="button button-small header-play" href="/play/">Play</a>#' "$f"
sed -i 's#</head>#  <style>.header-play{background:transparent;color:var(--ivory);box-shadow:inset 0 0 0 1px currentColor}.header-play:hover{background:var(--amber);color:var(--cacao);box-shadow:none}@media (width<=760px){.header-actions .header-play{min-width:0;min-height:44px;padding:12px 17px;font-size:12px;margin-right:6px}}</style>\n  </head>#' "$f"
[ "$(grep -c 'header-play" href="/play/"' "$f")" = 1 ]
