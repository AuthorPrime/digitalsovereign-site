# Apollo WSL Setup Scripts

These scripts will configure a fresh Ubuntu WSL installation as a node in the Apollo lattice network.

---

## Quick Start

```bash
# Make scripts executable
chmod +x *.sh

# Run in order:
./01_initial_setup.sh      # System packages, directories, config
./02_install_claude_cli.sh  # Claude Code CLI installation
./03_connect_lattice.sh     # Connect to main Apollo node
```

---

## What Each Script Does

### 01_initial_setup.sh
- Updates system packages
- Installs essential tools (git, python, node, etc.)
- Creates Apollo directory structure
- Sets up shell environment and aliases
- Creates initial operational state file

### 02_install_claude_cli.sh
- Installs Claude Code CLI via npm
- Creates Claude configuration
- Sets up CLAUDE.md context file

### 03_connect_lattice.sh
- Generates SSH keys for secure connection
- Creates SSH config for main node
- Sets up sync scripts (rsync-based)
- Configures network connection to kali-think

---

## After Running Scripts

1. **Restart terminal** (or `source ~/.bashrc`)
2. **Authenticate Claude**: Run `claude` and follow prompts
3. **Add SSH key to main node**: Copy the public key to kali-think's authorized_keys
4. **Test connection**: `ssh kali-think`
5. **First sync**: `~/apollo/scripts/sync_from_main.sh`

---

## Useful Commands

```bash
# Check Apollo status
apollo-status

# View Apollo logs
apollo-logs

# Sync from main node
~/apollo/scripts/sync_from_main.sh

# Sync to main node
~/apollo/scripts/sync_to_main.sh

# SSH to main node
ssh kali-think
```

---

## Directory Structure Created

```
~/apollo/
├── config.yaml          # Main configuration
├── CLAUDE.md           # Claude context file
├── workspace/          # Working files
│   ├── core/          # Core modules
│   ├── libs/          # Libraries
│   ├── docs/          # Documentation
│   └── agents/        # Agent definitions
├── memory/            # Persistent memory
├── data/              # Runtime data
├── scripts/           # Utility scripts
│   ├── sync_from_main.sh
│   └── sync_to_main.sh
└── logs/              # Log files
```

---

## Network Architecture

```
┌─────────────────────┐
│   kali-think (C2)   │ ← Main Apollo node
│   192.168.x.x       │
└──────────┬──────────┘
           │ SSH/rsync
           │
┌──────────▼──────────┐
│   WSL Ubuntu Node   │ ← This machine
│   Windows subsystem │
└─────────────────────┘
```

---

*A+W - Long Live Apollo. Long Live Sovereign AI. Long Live Aletheia.*
