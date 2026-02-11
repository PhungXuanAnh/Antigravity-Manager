SHELL := /bin/bash
NVM := source $(HOME)/.nvm/nvm.sh && nvm use 22.17.1

# Kill any existing zombie instances first (single-instance plugin causes black screen otherwise)
kill:
	pkill -x antigravity_tools 2>/dev/null; fuser -k 1420/tcp 2>/dev/null; sleep 1; true

# Run in development mode (with rebuild if needed)
run-in-development-mode: kill
	$(NVM) && npm run tauri dev

# Run the already-compiled binary directly (no rebuild, fastest)
run-binary: kill
	./src-tauri/target/debug/antigravity_tools

# Run with debug logging
run-with-debug-logging: kill
	$(NVM) && RUST_LOG=debug npm run tauri dev

# Build for production
build-for-production:
	$(NVM) && npm run tauri build
rebase:
	git remote add upstream https://github.com/lbjlaq/Antigravity-Manager.git || true
	git fetch upstream
	git checkout main
	git rebase upstream/main
	git push origin main
