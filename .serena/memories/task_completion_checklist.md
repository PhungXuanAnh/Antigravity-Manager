# Task Completion Checklist

## Before Committing Code Changes

### Frontend (TypeScript/React)
- [ ] Run `npm run build` - Check for TypeScript errors
- [ ] Verify no console warnings in browser
- [ ] Test responsive design if UI changes

### Backend (Rust)
- [ ] Run `cargo check` - Verify compilation
- [ ] Run `cargo clippy` - Check for lints
- [ ] Run `cargo fmt` - Format code
- [ ] Test proxy endpoints if API changes

### General
- [ ] Update locales if adding new UI strings (12 language files in `src/locales/`)
- [ ] Update README if adding new features
- [ ] Test on target platform (macOS/Windows/Linux)

## Testing Commands
```bash
# Full build test
npm run tauri build

# Type check only
tsc --noEmit

# Rust checks
cd src-tauri
cargo check
cargo clippy
cargo fmt --check
```

## Before Release
- [ ] Update version in `package.json` and `Cargo.toml`
- [ ] Update CHANGELOG if exists
- [ ] Test installation scripts (deploy/arch/install.sh)
- [ ] Test Docker build (docker/Dockerfile)