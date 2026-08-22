#!/bin/sh
# Write project files
set -e

mkdir -p app
cat > app/package.json <<EOF
{
  "name": "$JCODE_PROJECT_NAME",
  "version": "1.0.0",
  "type": "module",
  "main": "server.js",
  "scripts": { "start": "node server.js" },
  "dependencies": { "express": "^4.19.2" }
}
EOF
cat > app/server.js <<'EOF'
import express from "express";

const app = express();
app.use(express.json());

app.get("/api/health", (req, res) => res.json({ status: "ok" }));
app.get("/api/hello", (req, res) => res.json({ message: "Hello from Express" }));

const port = process.env.PORT || 3000;
app.listen(port, "0.0.0.0", () => console.log(`API on http://localhost:${port}`));
EOF
