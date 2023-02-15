#!/bin/bash
#
echo "For running on Cloudflare builders only"

set -a

npm install --location global pnpm
pnpm i --store=node_modules/.pnpm-store

pnpm_location=$(which pnpm)
export PATH="$PATH:$(dirname $pnpm_location)"

pnpm build:docs
cd packages/docs/
# cloudflare broke all user's Sites that have a "functions" path.
# ... thanks cloudflare. you're usually such a good company :p 
#
#  - https://github.com/NullVoxPopuli/ember-resources/issues/679
#    - https://github.com/TypeStrong/typedoc/issues/2111
#    - https://github.com/cloudflare/wrangler2/issues/2240
mv dist/functions dist/funcs  
find ./dist -type f -name '*.html' | xargs sed -i.bak --regexp-extended 's:(href="[^"]+)functions/:\1funcs/:g' 

