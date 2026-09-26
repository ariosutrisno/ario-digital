# ARIO DIGITAL

Business-focused Flutter Web UI for presenting digital services, sample work,
pricing guidance, delivery process, FAQs, and a project inquiry form.

## Project layout

```text
lib/
  main.dart
  ario_digital/
    app.dart
    core/
      app_links.dart       # Website and contact links in one place
      site_data.dart       # Service, project, and FAQ content
      site_theme.dart      # Colors and shared typography
      site_widgets.dart    # Layout, buttons, cards, and responsive grid
    features/
      home/
        business_page.dart # Page composition and section navigation
        sections/          # One file per page section
```

Keep visual tokens and shared components in `core`. Keep page-specific UI in
`features/home/sections`, and edit customer-facing copy and demo content in
`core/site_data.dart`.

## UI-only behavior

The inquiry form validates fields in the browser and shows a local confirmation.
It does not store or send form data. Set WhatsApp, email, and demo URLs in
`lib/ario_digital/core/app_links.dart` when those details are ready.

## Run and build

```sh
flutter run -d chrome
flutter build web --release --base-href "/ario-digital/"
```

If the browser reports CanvasKit shader compilation errors, restart the Flutter
run session and open the app with `?rendering=cpu` before any URL hash, for example
`http://localhost:8080/?rendering=cpu`. This optional mode bypasses WebGL using
CanvasKit CPU rendering and may be slower. Remove the query parameter to return
to normal rendering. A hot restart alone does not reload the bootstrap script.
