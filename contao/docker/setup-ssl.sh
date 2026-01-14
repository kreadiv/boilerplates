#!/bin/bash

# SSL-Zertifikate mit mkcert erstellen
# Voraussetzung: mkcert installiert (brew install mkcert)

set -e

# Prüfen ob mkcert installiert ist
if ! command -v mkcert &> /dev/null; then
    echo "mkcert ist nicht installiert!"
    echo "Installation: brew install mkcert"
    exit 1
fi

# mkcert Root-CA installieren (falls noch nicht geschehen)
mkcert -install

# Zertifikate-Ordner erstellen
mkdir -p certs

# Zertifikate generieren
cd certs
mkcert localhost 127.0.0.1 ::1

# Dateien umbenennen für Docker-Compose
mv localhost+2.pem localhost.pem
mv localhost+2-key.pem localhost-key.pem

echo ""
echo "SSL-Zertifikate erstellt in ./certs/"
echo "  - localhost.pem"
echo "  - localhost-key.pem"
echo ""
echo "Container neu starten: docker compose up -d --build"
