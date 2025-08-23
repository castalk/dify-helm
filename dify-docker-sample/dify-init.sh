#!/bin/bash
set -e
cd /dify
if [ ! -e "/dify/.initdone" ]; then
  PASSWORD=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
  sed -i "s/###PASSWORD###/${PASSWORD}/g" .env
  docker-compose -f docker-compose.yaml -f docker-compose.override.yaml up -d
  touch /dify/.initdone
else
  echo ''
fi
