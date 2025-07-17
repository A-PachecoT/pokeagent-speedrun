#!/bin/bash
# Wrapper script for running the agent on Arch Linux

# Change to project root directory
cd "$(dirname "$0")/../.." || exit 1

# Activate conda environment
source /opt/miniconda3/etc/profile.d/conda.sh
conda activate pokeagent

# Force use of system libraries
export LD_PRELOAD="/usr/lib/libmgba.so.0.10:/usr/lib/libstdc++.so.6:/usr/lib/libgcc_s.so.1"

# Run the agent with provided arguments
echo "Starting PokeAgent with arguments: $@"
python agent.py "$@"