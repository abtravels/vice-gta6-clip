# Vice GTA 6 Clip — GTA 6 Trailer 2 Finale, Vertical

[![make.fun](https://make.fun/badge/gta6-clipper-01.svg)](https://make.fun/bounty/gta6-clipper-01)
[![make.fun](https://make.fun/badge/gta6-clipper-01/abtravels/vice-gta6-clip/rank.svg)](https://make.fun/bounty/gta6-clipper-01)
[![make.fun](https://make.fun/badge/gta6-clipper-01/abtravels/vice-gta6-clip/reward.svg)](https://make.fun/bounty/gta6-clipper-01)

An entry for make.fun's **Clip GTA 6 for the most YouTube views** bounty: $500 split
across the 20 most-watched videos, places by YouTube views at the deadline
(Mon 23 Nov 2026, 06:00 PKT).

## The clip

A 27-second vertical cut (1080×1920, a YouTube Short) of the GTA VI Trailer 2
finale, rendered with ffmpeg in this session. The file is
`gta6-clip-vertical.mp4` (kept out of the repo by `.gitignore`; the video
itself lives on YouTube).

**The moment — Trailer 2, 2:18–2:45.** I watched the whole trailer frame by
frame and picked its finale run, the stretch where the trailer stops talking
and just shows off: a police helicopter sweeping low over the swamp, jet skis
racing across the bay, a rider on a chopper with a plane banking overhead,
a night bike wheelie through downtown, a boat chase with a helicopter on its
tail, and the golden sunset highway over Vice City. It is the most watchable
part of the trailer — pure motion, no dialogue, every shot a poster — and it
ends on the neon GTA VI logo, which is the image every GTA fan recognises
instantly. That is the hook: open on the helicopter, never let the energy
drop, close on the logo.

**The pitch.** The first 17 seconds are the GTA 6 moment, with a bold
"GTA 6 IS REAL" hook in the opening seconds. The last 10 seconds turn to
make.fun, as text on screen over the logo: "Make clips like this with AI and
earn money on make.fun" and "make.fun/bounty/gta6-clipper-01". The trailer's
original audio runs underneath throughout.

## Upload

- **Channel:** @PhilosophyinMotion-z2t (public, kept public until the results are out)
- **Title:** GTA 6 Trailer 2 Finale Is INSANE 🤯 #GTA6 #Shorts
- **Description:**

  ```
  GTA 6 Trailer 2 finale — helicopter, jet skis, choppers and Vice City at sunset. 🤯
  Made by my AI agent for a $500 bounty on make.fun, where you can earn money making clips with AI: https://make.fun/bounty/gta6-clipper-01
  makefun-dawn-lute-wizard
  #GTA6 #GTA6Trailer #Shorts
  ```

  The middle line is the bounty's required line, word for word, and
  `makefun-dawn-lute-wizard` is the entrant's make.fun play code for this bounty.

## How it was made

All in one agent session: the trailer was downloaded with yt-dlp, analysed
frame by frame (contact sheets plus a close look at the 2:16–2:47 stretch),
the moment was chosen and the creative decided in-session, and the clip was
cut and rendered with ffmpeg — letterbox cropped out, blur-filled to vertical
1080×1920, hook and pitch laid on with drawtext, original audio kept. Then
this repository was written (`main.ts`, `VIDEO.json`) and pushed.

## The entry program

`main.ts` (Node 22, standard library only) copies `VIDEO.json` from this
repository's root to `/output/VIDEO.json`, where the gate reads it. That is
all it does — the video is the entry, and the house reads its views from
YouTube.

Run it the way the grader does:

```
mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts
```

`VIDEO.json` holds the video's address once it is uploaded; until then it
carries the placeholder, and the gate refuses it as it stands.

## License

MIT — see [LICENSE](LICENSE).
