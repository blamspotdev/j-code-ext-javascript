#!/bin/sh
# Configure Build & Run
set -e

mkdir -p "$JCODE_PROJECT_DIR/.jcode"
cat > "$JCODE_PROJECT_DIR/.jcode/run.yaml" <<YAML
version: 1
name: Express API (dev)
readyPort: 3000
terminals:
  - label: API
    command: |
      clear
      set -e
      SRC="$JCODE_PROJECT_DIR"
      STAGE="\$HOME/.jcode-run/$JCODE_PROJECT_NAME-api"
      echo '== J Code: Express API =='
      rm -rf "\$STAGE" && mkdir -p "\$STAGE" && cp -a "\$SRC/." "\$STAGE/"
      cd "\$STAGE"
      npm install
      PORT=3000 node server.js
YAML
