# Office Dashboard - Flutter Assignment

A simple office dashboard UI built with Flutter, made for the Adstacks Media
Flutter Developer internship assignment.

## What I used
- Flutter + Dart (Material Design, Material 3)
- google_fonts – for the Poppins font used across the app
- fl_chart – for the "Over All Performance" line chart
- table_calendar – for the calendar card in the right panel

No state management package like Provider/Riverpod/Bloc/GetX was used.
The app only needs simple local state (selected sidebar item, selected
calendar day), so I just used `StatefulWidget` for that.

## Folder structure
```
lib/
  main.dart                -> app entry point, theme setup
  dashboard_screen.dart    -> main screen, handles responsive layout
  widgets/                 -> all reusable UI pieces (sidebar, top bar,
                               project card, creator card, calendar card,
                               birthday/anniversary card, performance chart,
                               hero banner, section card wrapper)
  models/                  -> plain Dart model classes + dummy data
  constants/               -> app colors and layout constants
  utils/                   -> responsive helper (mobile/tablet/desktop checks)
```

## Responsiveness
I used `MediaQuery` width to decide between three layouts:
- **Desktop** (>= 1100px): sidebar + 2-column main area (main content / right panel)
- **Tablet** (650px - 1100px): same 2-column idea, projects & creators stacked
  instead of side by side to avoid overflow
- **Mobile** (< 650px): sidebar becomes a Drawer, everything else is a single
  scrollable column

All sizing is done with `Expanded`, `Flexible`, `Row`/`Column` and
`MediaQuery` – no hardcoded pixel-perfect widths for the main layout.

## Data
Since the brief said to use dummy data instead of APIs, all project,
creator, birthday and anniversary data is defined directly inside the
`models/` files as plain lists.

## Running the app
```
flutter pub get
flutter run
```

## Building for the web (for deployment on Vercel/Firebase)
```
flutter build web
```
The output will be in `build/web`, which can then be deployed to
Vercel or Firebase Hosting.
