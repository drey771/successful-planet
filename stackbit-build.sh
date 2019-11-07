#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc3e51f8ed28c001960ae05/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc3e51f8ed28c001960ae05
curl -s -X POST https://api.stackbit.com/project/5dc3e51f8ed28c001960ae05/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dc3e51f8ed28c001960ae05/webhook/build/publish > /dev/null
