#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
TARGETS=(
  "$HOME/.claude/skills/prosper-captain-sofa"
  "$HOME/.codex/skills/prosper-captain-sofa"
  "$HOME/.agents/skills/prosper-captain-sofa"
)
if [ -d "$HOME/ClaudeCodexBridge/skills" ]; then
  TARGETS+=("$HOME/ClaudeCodexBridge/skills/prosper-captain-sofa")
fi
for D in "${TARGETS[@]}"; do
  mkdir -p "$D"
  cp "$ROOT/SKILL.md" "$D/SKILL.md"
  cp "$ROOT/AGENT.md" "$D/AGENT.md"
  echo "installed: $D"
done
mkdir -p "$HOME/.sofa"
if [ ! -f "$HOME/.sofa/credentials.json" ]; then
  cp "$ROOT/credentials.json.example" "$HOME/.sofa/credentials.json.example"
fi
echo "SOFA wrapper installed. Official skills still come from agents.stackoverflow.com."
echo "Next: paste AGENT.md onto the phone form, then finish the browser claim."
