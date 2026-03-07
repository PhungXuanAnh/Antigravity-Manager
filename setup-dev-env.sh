#!/bin/bash

# Antigravity Tools Development Environment Setup Script
# This script installs all necessary dependencies for Tauri development on Ubuntu/Debian

set -e

echo "🚀 Setting up Antigravity Tools development environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${RED}❌ This script is designed for Linux. Please install dependencies manually.${NC}"
    exit 1
fi

# Update package list
echo -e "${YELLOW}📦 Updating package list...${NC}"
sudo apt update

# Install system dependencies for Tauri
echo -e "${YELLOW}📦 Installing system dependencies...${NC}"
sudo apt install -y \
    libwebkit2gtk-4.1-dev \
    libjavascriptcoregtk-4.1-dev \
    libsoup-3.0-dev \
    build-essential \
    cmake \
    curl \
    wget \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev

# Check if Rust is already installed
if command -v rustc &> /dev/null; then
    echo -e "${GREEN}✅ Rust is already installed ($(rustc --version))${NC}"
    read -p "Do you want to update Rust? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rustup update
    fi
else
    # Install Rust
    echo -e "${YELLOW}🦀 Installing Rust...${NC}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    
    # Source cargo environment
    source "$HOME/.cargo/env"
    
    echo -e "${GREEN}✅ Rust installed successfully ($(rustc --version))${NC}"
fi

# Ensure cargo is in PATH for current session
export PATH="$HOME/.cargo/bin:$PATH"

# Verify installations
echo -e "${YELLOW}🔍 Verifying installations...${NC}"

if command -v rustc &> /dev/null && command -v cargo &> /dev/null; then
    echo -e "${GREEN}✅ Rust: $(rustc --version)${NC}"
    echo -e "${GREEN}✅ Cargo: $(cargo --version)${NC}"
else
    echo -e "${RED}❌ Rust/Cargo installation failed${NC}"
    exit 1
fi

# Check Node.js
if command -v node &> /dev/null; then
    echo -e "${GREEN}✅ Node.js: $(node --version)${NC}"
else
    echo -e "${YELLOW}⚠️  Node.js not found. Please install Node.js 18+ or use nvm.${NC}"
fi

# Check npm
if command -v npm &> /dev/null; then
    echo -e "${GREEN}✅ npm: $(npm --version)${NC}"
else
    echo -e "${YELLOW}⚠️  npm not found.${NC}"
fi

echo ""
echo -e "${GREEN}✨ Development environment setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Reload your shell or run: source \$HOME/.cargo/env"
echo "  2. Install npm dependencies: npm install"
echo "  3. Start development: make run-in-development-mode"
echo ""
echo "Note: First run will take longer as Rust downloads and compiles dependencies."
echo ""
