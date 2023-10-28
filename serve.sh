#!/bin/bash
set -euo pipefail
cd ${0%/*}

export PORT=4001
export APP_NAME=proxy

pnpm build
pm2 delete $APP_NAME || :
PORT=$PORT pm2 start node --name $APP_NAME -- build/index.js
