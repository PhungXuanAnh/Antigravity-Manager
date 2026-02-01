# Code Style & Conventions

## Rust (Backend)
- **Edition**: 2021
- **Naming**: snake_case for functions/variables, PascalCase for types
- **Error Handling**: `Result<T, String>` or `anyhow::Result<T>`
- **Async**: Tokio runtime, async/await pattern
- **Logging**: `tracing::info!`, `tracing::error!`, `tracing::debug!`
- **Comments**: Chinese comments are common (bilingual codebase)
- **Modules**: Organized by domain (proxy/, modules/, commands/, models/)

## TypeScript (Frontend)
- **Target**: ES modules
- **Strict Mode**: Enabled
- **Component Style**: Functional components with hooks
- **State**: Zustand stores in `src/stores/`
- **Styling**: Tailwind utility classes + DaisyUI components

## Project Structure
```
src/                    # React frontend
  components/           # UI components by feature
  pages/               # Route pages
  stores/              # Zustand stores
  locales/             # i18n translations
  services/            # API service layers
  types/               # TypeScript types

src-tauri/src/         # Rust backend
  proxy/               # Axum proxy server
    handlers/          # Route handlers by protocol
    mappers/           # Request/response transformers
    middleware/        # HTTP middleware
  modules/             # Business logic
  commands/            # Tauri commands (IPC)
  models/              # Data structures
```

## Patterns Used
- **State Management**: Zustand with persistence
- **Dependency Injection**: Via Tauri app state
- **Round-robin**: Token rotation for load balancing
- **Circuit Breaker**: For rate limit handling
- **Atomic Writes**: For config/account file updates