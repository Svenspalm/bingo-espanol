# Bingo Español

Static web app (one HTML file, no build step, no database). Serves the 5x5 Spanish
BINGO board: Palabras (words), Dibujos (draw-your-own pictures), Jugar (play with caller),
Lista (vocab pool, 59 terms preloaded). Drawing works with mouse, touch, or a stylus
(Apple Pencil, etc.) via the Pointer Events API.

## Sign-in

4 local profiles, each with their own saved board/drawings (stored in that browser's
`localStorage`, keyed per user — nothing leaves the device):

- Jen Hensley
- Charlie Gallus
- Spencer Barnett
- Teacher

Shared password for all profiles: `password`. This is a lightweight gate for a shared
family/classroom device, not real security — don't reuse it anywhere else.

## Use it

Live at: **https://svenspalm.github.io/bingo-espanol/**

It's an installable PWA — open the link in Chrome/Edge (desktop, or a Chromebook) and
use "Install app" to get a standalone window with its own icon, no browser chrome. Once
installed it works fully offline (the game logic and saves are all local; only the first
load and the Google Fonts need a connection).

## Self-host instead (optional)

No Docker? Run: `python3 -m http.server 8088 --bind 127.0.0.1`

With Docker + Tailscale:

    docker compose up -d
    sudo tailscale serve --bg --https=443 http://127.0.0.1:8088

## Notes
- Each user's pictures, marks, and called words save under their own profile.
- Fonts load from Google Fonts when online and fall back to system fonts otherwise.
- Update: edit `index.html`; redeploy (push to `main` for Pages, or `nginx` picks up
  local edits immediately for self-host).
- PWA cache bump: change `CACHE` in `sw.js` after an update so installed copies refresh.
