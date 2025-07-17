#!/bin/bash
# Workaround for Arch Linux library compatibility

echo "Starting PokeAgent server on Arch Linux..."

# Activate conda environment
source /opt/miniconda3/etc/profile.d/conda.sh
conda activate pokeagent

# Force use of system libraries for mgba
export LD_PRELOAD="/usr/lib/libmgba.so.0.10:/usr/lib/libstdc++.so.6:/usr/lib/libgcc_s.so.1"

echo "Server starting at http://localhost:8000"
python -m server.app