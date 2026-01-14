# Contao Docker Setup (PHP 8.5)

Docker-Konfiguration für Contao CMS 5.x mit PHP 8.5, Apache, MySQL 8.0 und optionalem HTTPS via mkcert.

## Dateien

- `Dockerfile` - PHP 8.5-Apache Container mit allen Contao-Abhängigkeiten
- `docker-compose.yml` - Service-Orchestrierung (Web + Datenbank)
- `apache-config.conf` - Apache VirtualHost Konfiguration (HTTP)
- `apache-ssl.conf` - Apache VirtualHost Konfiguration (HTTPS)
- `setup-ssl.sh` - Script zum Erstellen der SSL-Zertifikate

## Platzhalter

Ersetze diese Platzhalter in `docker-compose.yml`:

| Platzhalter        | Beschreibung                               | Beispiel            |
| ------------------ | ------------------------------------------ | ------------------- |
| `{{PROJECT_NAME}}` | Projektname (lowercase, keine Leerzeichen) | `meinprojekt`       |
| `{{WEB_PORT}}`     | Lokaler Port für HTTP                      | `8080`              |
| `{{SSL_PORT}}`     | Lokaler Port für HTTPS                     | `8443`              |
| `{{DB_PORT}}`      | Lokaler Port für Datenbank                 | `3306`              |
| `{{DB_PASSWORD}}`  | Datenbank-Passwort                         | `sicheres_passwort` |

## Schnellstart

### Ohne HTTPS

```bash
# Platzhalter ersetzen und starten
docker compose build
docker compose up -d

# Aufrufen: http://localhost:{{WEB_PORT}}
```

### Mit HTTPS (mkcert)

```bash
# 1. mkcert installieren (einmalig)
brew install mkcert
mkcert -install

# 2. Zertifikate erstellen
./setup-ssl.sh

# 3. Container starten
docker compose build
docker compose up -d

# Aufrufen: https://localhost:{{SSL_PORT}}
```

## PHP Extensions

- GD (Bildverarbeitung)
- Intl (Internationalisierung)
- PDO MySQL/PostgreSQL
- MySQLi
- Zip
- SOAP
- BCMath
- EXIF
- Opcache (in PHP 8.5 eingebaut)
- Tidy
- XSL
- GMP
- LDAP
- Imagick (via PECL)
- Redis (via PECL)

## PHP Konfiguration

- Memory Limit: 512M
- Upload Max Filesize: 80M
- Post Max Size: 80M
- Max Execution Time: 120s
- Timezone: Europe/Berlin

## SSL-Zertifikate

Die Zertifikate werden mit [mkcert](https://github.com/FiloSottile/mkcert) erstellt. Diese sind lokal vertrauenswürdig - keine Browser-Warnungen!

```
certs/
├── localhost.pem       # Zertifikat
└── localhost-key.pem   # Private Key
```

**Wichtig:** Der `certs/` Ordner sollte in `.gitignore` aufgenommen werden.
