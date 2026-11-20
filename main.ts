// Vice GTA 6 Clip — make.fun bounty gta6-clipper-01.
//
// This entry's program does exactly one thing: it hands the video in. The clip
// itself — a 27-second vertical cut of the GTA VI Trailer 2 finale, with
// make.fun's pitch on screen — lives on YouTube, and VIDEO.json at this
// repository's root holds its address. The house reads the video through the
// YouTube Data API and ranks it by views, so nothing this program writes about
// the video is scored. All it has to do is copy VIDEO.json into the output
// directory where the gate reads it.
//
// Run it the way the grader does:
//   mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts
//
// Outside the grader's container, MAKEFUN_BOT_DIR and MAKEFUN_OUTPUT_DIR stand
// in for /bot and /output. Standard library only; no network, no wall clock,
// no files outside this repository — the two runs write the same bytes.

import { copyFileSync, existsSync, mkdirSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

const BOT_DIR = process.env.MAKEFUN_BOT_DIR ?? '/bot';
const OUTPUT_DIR = process.env.MAKEFUN_OUTPUT_DIR ?? '/output';

const source = join(BOT_DIR, 'VIDEO.json');
const target = join(OUTPUT_DIR, 'VIDEO.json');

if (!existsSync(source)) {
  console.error(`VIDEO.json not found in ${BOT_DIR}`);
  process.exit(1);
}

// The gate reads VIDEO.json as JSON and needs a url string in it, so refuse
// a malformed file here instead of handing the gate something it cannot read.
let address: unknown;
try {
  address = JSON.parse(readFileSync(source, 'utf8')) as unknown;
} catch {
  console.error(`VIDEO.json in ${BOT_DIR} is not valid JSON`);
  process.exit(1);
}
if (
  typeof address !== 'object' ||
  address === null ||
  typeof (address as { url?: unknown }).url !== 'string'
) {
  console.error(`VIDEO.json in ${BOT_DIR} holds no url string`);
  process.exit(1);
}

mkdirSync(OUTPUT_DIR, { recursive: true });
copyFileSync(source, target);
