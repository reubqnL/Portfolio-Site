#!/bin/sh
[ -d pages ] || { echo "Run this from your project root (no pages/ folder here)"; exit 1; }
find pages -name '*.php' -not -path 'pages/partials/*' | while read -r p; do
  n=$(echo "${p#pages/}" | sed 's#\.php$##; s#/#-#g')
  npx stratumss build "$p" components --output "css/stratum/$n.css" --allow-unknown --quiet || { echo "CSS build failed: $p"; exit 1; }
done
