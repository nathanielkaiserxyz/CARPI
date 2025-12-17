#!/bin/sh
set -e

exec rpicam-vid -t 0 -n \
  --width 640 --height 480 \
  --framerate 15 \
  --codec h264 \
  --bitrate 1500000 \
  --profile baseline \
  --inline \
  -o - | \
ffmpeg -re -f h264 -i - \
  -c copy -rtsp_transport tcp \
  -f rtsp rtsp://127.0.0.1:8554/cam
