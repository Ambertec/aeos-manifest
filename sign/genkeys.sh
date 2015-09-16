#!/bin/sh

# Generate signature keys

openssl genrsa -out firmware.key 4096
openssl rsa -in firmware.key -pubout -out firmware.pub

# Generate encryption key

openssl rand -base64 2048 > firmware.aes
