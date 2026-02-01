# Antigravity Tools - Project Overview

## Purpose
Antigravity Tools is a **professional AI account management and protocol proxy system (v4.0.11)**. It serves as a local AI gateway/dispatcher that:

1. **Multi-Account Management**: Manages multiple Google/Anthropic OAuth accounts with automatic quota monitoring
2. **Protocol Conversion**: Converts Web sessions (Google/Anthropic) into standardized API interfaces
3. **Smart Request Routing**: Automatically rotates accounts when quotas are exceeded or rate limits hit (429/401)
4. **API Compatibility**: Provides OpenAI, Anthropic, and Gemini compatible endpoints

## Key Features
- **OAuth 2.0 Authorization**: Automatic/manual Google OAuth flow for account management
- **Smart Account Scheduling**: Auto-switches accounts when quota depletes, prioritizes based on subscription tier (FREE/PRO/ULTRA)
- **Protocol Adapters**: 
  - `/v1/chat/completions` (OpenAI format)
  - `/v1/messages` (Anthropic format)
  - Native Gemini SDK support
- **Multi-Modal Support**: Image generation via Imagen 3, vision/audio processing
- **Quota Protection**: Automatically protects accounts from overuse
- **Circuit Breaker**: Rate limiting and health scoring for accounts

## Tech Stack
- **Frontend**: React 19, TypeScript, Vite, TailwindCSS, DaisyUI, Zustand
- **Backend**: Rust (Tauri v2), Axum web framework
- **Database**: SQLite (via rusqlite), JSON files for account storage
- **Desktop**: Tauri v2 (cross-platform: macOS, Windows, Linux)
- **Docker**: Headless mode available for NAS/server deployment

## Target Users
- Developers needing unified AI API access
- AI enthusiasts managing multiple Google/Anthropic accounts
- Teams wanting to maximize free tier usage across accounts

## License
CC-BY-NC-SA-4.0 (Non-commercial use)