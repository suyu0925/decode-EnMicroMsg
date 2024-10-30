#!/bin/sh

# 检查 DECODE_KEY 是否存在
if [ -z "$DECODE_KEY" ]; then
  echo "Error: DECODE_KEY environment variable is not set."
  exit 1
fi

SCRIPT_DIR=$(pwd)

sed -i "s/PRAGMA key = '[^']*'/PRAGMA key = '$DECODE_KEY'/g" $SCRIPT_DIR/decode.sql

cd /data

sqlcipher EnMicroMsg.db < $SCRIPT_DIR/decode.sql
