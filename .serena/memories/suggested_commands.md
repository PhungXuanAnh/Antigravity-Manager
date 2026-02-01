# Suggested Commands

## Development
```bash
# Install dependencies
npm install

# Run development (frontend + Tauri backend)
npm run tauri dev

# Run with debug logging
RUST_LOG=debug npm run tauri dev

# Build for production
npm run tauri build

# Just frontend dev server
npm run dev

# Frontend build only
npm run build
```

## Linux Utilities
```bash
# Standard tools
git, ls, cd, grep, find, cat, sed, awk

# File operations
cp, mv, rm, mkdir -p

# Process management
ps, kill, pkill
```

## Homebrew Installation (macOS)
```bash
brew tap lbjlaq/antigravity-manager https://github.com/lbjlaq/Antigravity-Manager
brew install --cask antigravity-tools
# Or with quarantine fix:
brew install --cask --no-quarantine antigravity-tools
```

## Arch Linux Installation
```bash
curl -sSL https://raw.githubusercontent.com/lbjlaq/Antigravity-Manager/main/deploy/arch/install.sh | bash
```

## Docker Deployment
```bash
docker run -d --name antigravity-manager \
  -p 8045:8045 \
  -e API_KEY=sk-your-api-key \
  -v ~/.antigravity_tools:/root/.antigravity_tools \
  lbjlaq/antigravity-manager:latest
```

## Using the Proxy
```bash
# With Claude Code CLI
export ANTHROPIC_API_KEY="sk-antigravity"
export ANTHROPIC_BASE_URL="http://127.0.0.1:8045"
claude

# Test with curl
curl -X POST http://127.0.0.1:8045/v1/chat/completions \
  -H "Authorization: Bearer sk-antigravity" \
  -H "Content-Type: application/json" \
  -d '{"model":"gemini-3-flash","messages":[{"role":"user","content":"Hello"}]}'
```