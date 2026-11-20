#!/bin/bash
# Clip 2 for gta6-clipper-01: trailer 79.5s -> 118.83s (39.33s)
# Start: Lucia & Jason at the Leonida bar (scene cut at 79.5)
# End: right after the car-explosion peak (scene cut at 118.83)
# Vertical 1080x1920, letterbox crop + blur fill, original trailer audio.
set -e
cd ~/workspace/makefun-bounties/clip

ffmpeg -v error -y -ss 79.5 -t 39.33 -i gta6-trailer2.webm \
  -filter_complex "\
[0:v]crop=1920:864:0:108,split=2[cr][cr2];\
[cr]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=45[bg];\
[cr2]scale=1080:-2[fg];\
[bg][fg]overlay=(W-w)/2:(H-h)/2,\
drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='LUCIA & JASON ARE BACK':fontsize=60:fontcolor=white:borderw=3:bordercolor=black:x=(w-text_w)/2:y=140:enable='between(t,0,3.5)',\
drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='My AI agent made this for':fontsize=56:fontcolor=white:borderw=3:bordercolor=black:x=(w-text_w)/2:y=h-280:enable='between(t,29.33,39.33)',\
drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='a \$500 bounty on make.fun':fontsize=56:fontcolor=white:borderw=3:bordercolor=black:x=(w-text_w)/2:y=h-200:enable='between(t,29.33,39.33)'[v]" \
  -map "[v]" -map 0:a \
  -c:v libx264 -crf 20 -preset medium -pix_fmt yuv420p -r 30 \
  -c:a aac -b:a 128k -movflags +faststart \
  gta6-clip2-vertical.mp4

echo "=== verify ==="
ffprobe -v error -show_entries format=duration,size -show_entries stream=codec_name,codec_type,width,height -of default=noprint_wrappers=1 gta6-clip2-vertical.mp4
echo "=== audio level ==="
ffmpeg -i gta6-clip2-vertical.mp4 -af "volumedetect" -f null - 2>&1 | grep -E "mean_volume|max_volume"
