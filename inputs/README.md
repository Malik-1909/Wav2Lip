# Eingabedateien

Hier legst du **dein Portrait oder Video** und **dein Audio** ab (beliebige Dateinamen).

| Datei | Format | Hinweis |
|-------|--------|---------|
| Gesicht | `.jpg`, `.png` oder `.mp4` | Gesicht gut sichtbar, frontal wirkt am besten |
| Audio | `.wav`, `.mp3`, … | Wird intern auf 16 kHz verarbeitet; bei Nicht-WAV nutzt das Skript ffmpeg |

**Test ausführen** (nach Setup im Projektroot):

```bash
chmod +x scripts/lipsync.sh
./scripts/lipsync.sh inputs/face.jpg inputs/speech.wav results/mein_test.mp4
```

**Ausgabe:** standardmäßig `results/result_voice.mp4` (oder der Pfad aus dem 3. Argument).

Es gibt **keine Web-Oberfläche** — du übergibst Dateipfade an `inference.py` oder `scripts/lipsync.sh`.
