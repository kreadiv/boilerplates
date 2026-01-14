# Boilerplates

Projekt-Templates für schnelles Setup von Webprojekten.

## Struktur

```
boilerplates/
├── contao/
│   └── docker/          # Docker-Setup für Contao 5.x (PHP 8.5)
├── scss/                # ITCSS + BEM SCSS Framework
├── react/               # (geplant)
└── node/                # (geplant)
```

## Contao

### Docker-Setup

Vollständiges Docker-Setup für Contao CMS mit:

- PHP 8.5 + Apache
- MySQL 8.0
- Alle benötigten PHP-Extensions (GD, Imagick, Intl, etc.)
- Composer
- .env Vorlage und Contao `config/config.yaml`

```bash
# Dateien kopieren
cp contao/docker/* /pfad/zum/projekt/

# Platzhalter ersetzen und starten
docker compose build && docker compose up -d
```

[Mehr Details](contao/docker/README.md)

## SCSS Framework

ITCSS + BEM SCSS-Architektur mit:

- Design Tokens (Colors, Spacing, Typography)
- Generische Getter-Funktionen (`fn.color()`, `fn.spacing()`, etc.)
- Responsive Spacings mit automatischer Skalierung
- Utility-Klassen (`u-*`), Widgets (`w-*`), Components (`c-*`), Layouts (`l-*`)
- CSS Custom Properties für JavaScript-Zugriff

```bash
# Dateien kopieren
cp -r scss/* /pfad/zum/projekt/resources/scss/
```

[Mehr Details](scss/README.md)
