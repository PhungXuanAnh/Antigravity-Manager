# Run in development mode (with rebuild if needed)
run-in-development-mode:
	nvm use 22.17.1 && npm run tauri dev

# Run the already-compiled binary directly (no rebuild, fastest)
run-binary:
	./src-tauri/target/debug/antigravity_tools

# Run with debug logging
run-with-debug-logging:
	nvm use 22.17.1 && RUST_LOG=debug npm run tauri dev

# Build for production
build-for-production:
	nvm use 22.17.1 && npm run tauri build
rebase:
	git remote add upstream https://github.com/lbjlaq/Antigravity-Manager.git || true
	git fetch upstream
	git checkout main
	git rebase upstream/main
	git push origin main
