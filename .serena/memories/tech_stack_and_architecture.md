# Tech Stack & Architecture

## Frontend (React/TypeScript)
- **Framework**: React 19 with TypeScript
- **Build Tool**: Vite 7
- **Styling**: TailwindCSS 3.4 + DaisyUI 5
- **State Management**: Zustand 5
- **Routing**: react-router-dom 7
- **i18n**: i18next (12 languages supported)
- **Charts**: Recharts

## Backend (Rust/Tauri)
- **Desktop Framework**: Tauri v2
- **Web Server**: Axum 0.7 (for API proxy)
- **HTTP Client**: reqwest 0.12 (with SOCKS proxy support)
- **Database**: rusqlite 0.32 (SQLite)
- **Async Runtime**: Tokio (full features)
- **Concurrency**: DashMap for thread-safe maps
- **Logging**: tracing + tracing-subscriber

## Key Rust Modules
- `src-tauri/src/proxy/` - Main proxy server logic
  - `server.rs` - Axum server setup
  - `token_manager.rs` - Account pool management, token rotation
  - `handlers/` - Request handlers for OpenAI/Anthropic/Gemini protocols
  - `mappers/` - Protocol conversion (request/response mapping)
  - `middleware/` - Auth, CORS, logging, IP filtering
  - `security.rs` - Security configuration
- `src-tauri/src/modules/` - Core business logic
  - `account.rs` - Account CRUD operations
  - `oauth.rs` - Google OAuth flow
  - `quota.rs` - Quota fetching and monitoring
  - `scheduler.rs` - Smart warmup scheduler
  - `db.rs` - Antigravity IDE database interaction

## Architecture Flow
```
Client (Claude Code/NextChat) 
  → Antigravity Axum Server (localhost:8045)
    → Middleware (Auth/Rate Limit/Logging)
      → Model Router (ID mapping)
        → Account Dispatcher (Round-robin/Weighted)
          → Protocol Mapper (OpenAI→Gemini, etc.)
            → Upstream API (Google/Anthropic)
              → Response Mapper → Client
```

## Data Storage
- **Location**: `~/.antigravity_tools/`
- **Accounts**: `~/.antigravity_tools/accounts/<uuid>.json`
- **Config**: `~/.antigravity_tools/gui_config.json`
- **Index**: `~/.antigravity_tools/accounts.json`