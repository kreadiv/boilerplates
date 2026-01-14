# SCSS Boilerplate (ITCSS + BEM)

A scalable, maintainable SCSS architecture based on ITCSS (Inverted Triangle CSS) methodology with BEM naming convention.

## Architecture

Styles flow from **generic/low-specificity** to **specific/high-specificity**:

```
settings/      Design tokens (colors, spacing, typography)
functions/     SCSS functions for accessing tokens
mixins/        Reusable SCSS mixins
00-utilities/  Utility classes (u-*)
01-base/       Fonts, resets
02-elements/   Native HTML elements
03-widgets/    Small UI components (w-*)
04-components/ Larger components (c-*)
05-layouts/    Layout patterns (l-*)
06-vendor/     Third-party overrides
```

## Naming Conventions

| Layer       | Prefix | Example                     |
|-------------|--------|-----------------------------|
| Utilities   | `u-`   | `u-margin_top_lg`           |
| Widgets     | `w-`   | `w-btn`, `w-btn_primary`    |
| Components  | `c-`   | `c-header`, `c-card`        |
| Layouts     | `l-`   | `l-container`, `l-stack`    |

BEM modifiers use underscores: `w-btn_primary`, `w-btn_lg`

## Design Tokens

Access all design tokens via functions:

```scss
@use "functions/functions" as fn;

.example {
  color: fn.color('primary', 500);
  padding: fn.spacing('md');
  font-size: fn.font-size('base');
  font-family: fn.font-family('text');
  line-height: fn.line-height('base');
  border-radius: fn.border-radius('md');
  transition: fn.transition('fast');
  z-index: fn.z-index('modal');
}
```

## Spacing System

Spacings automatically scale up at larger breakpoints via `$breakpoint-factors`:

```scss
// 00-utilities/00-spacings/_breakpoint-factors.scss
$breakpoint-factors: (
  'xs': 1.05,
  'sm': 1.10,
  'md': 1.15,
  'lg': 1.20,
  'xl': 1.20
);
```

This creates a fluid spacing system without needing responsive utility classes.

## Utility Classes

### Spacing
```html
<div class="u-padding_md">           <!-- padding on all sides -->
<div class="u-margin_top_lg">        <!-- margin-top only -->
<div class="u-no-margin">            <!-- remove margin -->
```

### Flexbox
```html
<div class="u-flex u-justify-between u-items-center">
```

### Text
```html
<p class="u-text-center u-fw-bold u-text-muted">
```

### Visibility
```html
<span class="u-sr-only">Screen reader only</span>
<div class="u-hidden">Hidden</div>
```

## Widgets

Small, reusable UI components:

```html
<!-- Button -->
<button class="w-btn w-btn_primary w-btn_md">Click me</button>
<button class="w-btn w-btn_outlined w-btn_sm">Secondary</button>

<!-- Icon -->
<svg class="w-icon w-icon_sm">...</svg>

<!-- Link -->
<a href="#" class="w-link w-link_muted">Subtle link</a>
```

## Layouts

```html
<!-- Container -->
<div class="l-container">Centered content, max 1200px</div>
<div class="l-container l-container_narrow">Max 800px</div>

<!-- Stack (vertical spacing) -->
<div class="l-stack l-stack_lg">
  <div>Item 1</div>
  <div>Item 2</div>
</div>
```

## Setup

1. Copy the `scss/` folder to your project
2. Configure your build tool to compile `main.scss`
3. Customize settings in `settings/` folder
4. Add fonts in `01-base/_fonts.scss`
5. Add project-specific components in `04-components/`

### Vite Example

```js
// vite.config.js
export default {
  css: {
    preprocessorOptions: {
      scss: {
        // Optional: auto-import functions in all files
        additionalData: `@use "src/scss/functions/functions" as fn;`
      }
    }
  }
}
```

## Customization

### Colors

Edit `settings/00-colors/_colors.scss`:

```scss
$colors: (
  'primary': (
    500: #your-brand-color,
    600: #darker-shade,
    // ...
  ),
);
```

### Typography

Edit files in `settings/02-typography/`:

- `_font-families.scss` - Font stacks
- `_font-sizes.scss` - Size scale
- `_line-heights.scss` - Line height presets

### Breakpoints

Edit `settings/01-layout/_breakpoints.scss`:

```scss
$breakpoints: (
  'sm': 640px,
  'md': 768px,
  'lg': 1024px,
  'xl': 1280px,
);
```

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Uses `@use` and `@forward` (Dart Sass 1.23+)
- CSS Custom Properties for JS interop
