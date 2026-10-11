# Maker Bootcamp

Two single-page web apps built during a 10x maker boot camp sprint. No build step, no dependencies to install: open either page in a browser and go.

## Pages

- **`index.html`** — The 10x Maker Boot Camp dashboard. A three-phase curriculum (Days 1-21) with an interactive checklist, a skill-trajectory chart, and a capstone "Day Done" fire-and-confetti celebration overlay. Dark theme, Tailwind via CDN.
- **`vehicle-tracker.html`** — AutoFlow Pro, a vehicle intake and parts tracker backed by Supabase. Decode VINs via the NHTSA API, track purchase/sale numbers, parts inventory, refurb costs, and transport status.

## Run locally

```bash
git clone https://github.com/boriskozak/maker-bootcamp.git
cd maker-bootcamp
# index.html works straight from the file system
open index.html
```

AutoFlow Pro needs a Supabase project:

1. Create a project at [supabase.com](https://supabase.com) and run `supabase-schema.sql` in the SQL Editor (creates `vehicles`, `parts`, and `refurb_costs` tables).
2. Put your project URL and publishable key in the `SUPABASE_URL` / `SUPABASE_KEY` constants at the top of the script in `vehicle-tracker.html`.
3. Serve the directory over HTTP so the Supabase client loads cleanly:

```bash
python3 -m http.server 8000
# then visit http://localhost:8000/vehicle-tracker.html
```

## Live

Hosted on GitHub Pages: https://boriskozak.github.io/maker-bootcamp/
