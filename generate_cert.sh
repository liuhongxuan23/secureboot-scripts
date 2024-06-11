#!/bin/bash

set -x

openssl req -newkey rsa:4096 -nodes -keyout MOK.key -new -x509 -sha256 -days 3650 -out MOK.crt
openssl x509 -outform DER -in MOK.crt -out MOK.cer
