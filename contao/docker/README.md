# Contao Docker Setup (PHP 8.5)

Docker-Konfiguration für Contao CMS 5.x mit PHP 8.5, Apache und MySQL 8.0.

## Dateien

- `Dockerfile` - PHP 8.5-Apache Container mit allen Contao-Abhängigkeiten
- `docker-compose.yml` - Service-Orchestrierung (Web + Datenbank)
- `apache-config.conf` - Apache VirtualHost Konfiguration

## Platzhalter

Ersetze diese Platzhalter in `docker-compose.yml`:

| Platzhalter        | Beschreibung                               | Beispiel            |
| ------------------ | ------------------------------------------ | ------------------- |
| `{{PROJECT_NAME}}` | Projektname (lowercase, keine Leerzeichen) | `meinprojekt`       |
| `{{WEB_PORT}}`     | Lokaler Port für Webserver                 | `8080`              |
| `{{DB_PORT}}`      | Lokaler Port für Datenbank                 | `3306`              |
| `{{DB_PASSWORD}}`  | Datenbank-Passwort                         | `sicheres_passwort` |

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

## Verwendung

1. Dateien ins Projektverzeichnis kopieren
2. Platzhalter in `docker-compose.yml` ersetzen
3. Container starten:

```bash
docker compose build
docker compose up -d
```

4. Contao Manager aufrufen: `http://localhost:{{WEB_PORT}}/contao-manager.phar.php`
