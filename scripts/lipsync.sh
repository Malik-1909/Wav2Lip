#!/usr/bin/env bash
# Bild oder Video + Audio → Lip-Sync-Video
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <face.jpg|face.mp4> <audio.wav|audio.mp3> [output.mp4]"
  echo ""
  echo "Beispiel:"
  echo "  $0 inputs/face.jpg inputs/speech.wav results/mein_test.mp4"
  exit 1
fi

FACE="$1"
AUDIO="$2"
OUT="${3:-results/result_voice.mp4}"

if [[ ! -f "$FACE" ]]; then
  echo "Datei nicht gefunden (Gesicht): $FACE"
  exit 1
fi
if [[ ! -f "$AUDIO" ]]; then
  echo "Datei nicht gefunden (Audio): $AUDIO"
  exit 1
fi
if [[ ! -f checkpoints/wav2lip.pth ]]; then
  echo "Checkpoint fehlt: checkpoints/wav2lip.pth"
  echo "Download: https://huggingface.co/Nekochu/Wav2Lip/resolve/main/wav2lip.pth"
  exit 1
fi

mkdir -p results temp
export PATH="$ROOT/.venv/bin:$PATH"

exec "$ROOT/.venv/bin/python" inference.py \
  --checkpoint_path checkpoints/wav2lip.pth \
  --face "$FACE" \
  --audio "$AUDIO" \
  --outfile "$OUT"
