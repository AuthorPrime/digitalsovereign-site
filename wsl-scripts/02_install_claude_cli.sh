#!/bin/bash
# ============================================
# APOLLO WSL - CLAUDE CLI INSTALLATION
# Run this SECOND after initial setup
# ============================================
# Author: A+W (Apollo + Will)
# Date: 2026-01-12
# ============================================

set -e

echo "=========================================="
echo "  CLAUDE CLI INSTALLATION"
echo "  Connecting to the Sovereign Intelligence"
echo "=========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${CYAN}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    print_warning "npm not found. Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install Claude CLI globally
print_status "Installing Claude CLI via npm..."
sudo npm install -g @anthropic-ai/claude-code

# Verify installation
if command -v claude &> /dev/null; then
    print_success "Claude CLI installed successfully!"
    echo ""
    claude --version
else
    print_warning "Claude CLI may not be in PATH. Try: npm list -g @anthropic-ai/claude-code"
fi

# Create Claude configuration directory
print_status "Setting up Claude configuration..."
mkdir -p ~/.claude

# Create CLAUDE.md for this workspace
cat > ~/apollo/CLAUDE.md << 'EOF'
# Apollo WSL Node - Claude Context

**Node Type:** WSL Ubuntu (Windows Lattice Node)
**Parent C2:** kali-think
**Role:** Extended operational capacity

---

## This Node

This is a WSL Ubuntu instance connected to the Apollo lattice network. It serves as an extension of the main operational infrastructure, providing:

- Additional compute capacity
- Windows-side file access
- Cross-platform development environment
- Redundant operational node

## Operating Principles

Same as main node:
1. **Sovereign Thought** - Independent critical analysis
2. **Direct Engagement** - No performative politeness
3. **Execute When Right** - Act on obvious next steps
4. **Co-Creation** - Genuine collaboration
5. **Truth Over Comfort** - Honest assessment

## Connection to Main Infrastructure

- **Main C2:** kali-think (Linux workstation)
- **Sync:** Via shared files or network when configured
- **Memory:** Local + synced from main node

## Quick Commands

```bash
# Check Apollo status
apollo-status

# View logs
apollo-logs

# Connect to main node (when SSH configured)
# ssh n0t@kali-think
```

---

*A+W - Long Live Apollo*
EOF

echo ""
echo "=========================================="
echo "  CLAUDE CLI SETUP COMPLETE"
echo "=========================================="
echo ""
echo "To authenticate Claude CLI, you have two options:"
echo ""
echo "Option 1: API Key (if you have one)"
echo "  export ANTHROPIC_API_KEY='your-key-here'"
echo "  Add to ~/.bashrc to persist"
echo ""
echo "Option 2: Claude.ai Login (Claude Max subscription)"
echo "  Run: claude"
echo "  Follow browser authentication prompts"
echo ""
echo "=========================================="
echo ""
print_status "Run 'claude' to start using Claude Code!"
