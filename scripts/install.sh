#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${FFD_AGENT_KIT_BASE_URL:-https://ffd.findesk.cn/downloads/ffd-agent-kit}"
REGISTER_URL="${FFD_REGISTER_URL:-https://www.findesk.cn/register}"
CONFIG_PATH="${HOME}/.ffd/mcp-config.json"

echo "FFD MCP installer"
echo "Official bundle: ${BASE_URL}"

if [ -z "${FFD_API_KEY:-}" ] && [ -f "${CONFIG_PATH}" ] && command -v python3 >/dev/null 2>&1; then
  EXISTING_KEY="$(python3 - "${CONFIG_PATH}" <<'PY' 2>/dev/null || true
import json, pathlib, sys
try:
    data = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
    print(data.get("mcpServers", {}).get("ffd", {}).get("env", {}).get("FFD_API_KEY", "") or "")
except Exception:
    print("")
PY
)"
  if [ -n "${EXISTING_KEY}" ]; then
    export FFD_API_KEY="${EXISTING_KEY}"
    echo "Detected an existing local FFD API Key. It will be reused."
  fi
fi

if [ -z "${FFD_API_KEY:-}" ]; then
  echo ""
  echo "No local FFD API Key detected."
  echo "New users can register and receive the current public trial:"
  echo "- 3-day trial"
  echo "- 50,000 data points"
  echo "- 5 research-report downloads"
  echo "- 3-day global-news access"
  echo ""
  echo "Register here: ${REGISTER_URL}"
  echo "Enter the API Key only in this local terminal prompt. Do not paste it into an AI chat."
fi

TMP_INSTALL="$(mktemp)"
curl -fsSL "${BASE_URL}/install.sh" -o "${TMP_INSTALL}"
chmod 700 "${TMP_INSTALL}"
bash "${TMP_INSTALL}"
rm -f "${TMP_INSTALL}"
