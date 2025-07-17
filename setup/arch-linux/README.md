# Arch Linux Setup Guide

This guide helps run PokeAgent on Arch Linux, which has library compatibility issues with conda environments.

## Problem
Arch Linux's system mgba (from pacman) requires newer C++ libraries than conda's Python 3.10 environment provides, causing `GLIBCXX_3.4.30 not found` errors.

## Solution
Use the provided wrapper scripts that preload system libraries:

### Running the Server
```bash
# From project root
./setup/arch-linux/run_server_arch.sh

# Or from this directory
./run_server_arch.sh
```

### Running the Agent
```bash
# From project root
./setup/arch-linux/run_agent_arch.sh --backend openrouter --model-name openai/gpt-4o-mini

# Or from this directory
./run_agent_arch.sh --backend openrouter --model-name openai/gpt-4o-mini
```

## Installation Steps
1. Install mgba from pacman:
   ```bash
   sudo pacman -S mgba-qt
   ```

2. Follow the main README for conda setup with Python 3.10 and libffi=3.3

3. Use the wrapper scripts instead of running directly

## How It Works
The scripts use `LD_PRELOAD` to force the use of system libraries:
```bash
export LD_PRELOAD="/usr/lib/libmgba.so.0.10:/usr/lib/libstdc++.so.6:/usr/lib/libgcc_s.so.1"
```

This bypasses the conda environment's older libraries that conflict with Arch's newer system packages.