#!/bin/bash
set -euo pipefail
cd ${0%/*}

PORT=8080
SERVER=ec2-user@52.77.162.31
DIRECTORY=/home/ec2-user/sveltekit
PM2_NAME=sveltekit
HOST=127.0.0.1

pnpm build
tar -zcf dist.tar.gz build package.json

scp dist.tar.gz $SERVER:${DIRECTORY}/dist.tar.gz
ssh $SERVER "bash -i -c 'cd ${DIRECTORY} && tar -xvf dist.tar.gz && pnpm install --prod && pm2 delete $PM2_NAME || : && PORT=$PORT pm2 start node --name $PM2_NAME -- build/index.js'"

