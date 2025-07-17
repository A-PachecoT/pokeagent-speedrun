# Alternative Installation Guides

This directory contains platform-specific setup guides and scripts for PokeAgent Challenge.

## Available Setups

### [Arch Linux](./arch-linux/)
- **Problem**: Library compatibility issues between conda and system mgba
- **Solution**: Wrapper scripts with `LD_PRELOAD` to force system libraries
- **Files**: 
  - `run_server_arch.sh` - Server wrapper
  - `run_agent_arch.sh` - Agent wrapper
  - `README.md` - Detailed setup instructions

## When to Use

Use these alternative setups if you encounter:
- Library compatibility errors
- Platform-specific installation issues
- Need for custom configurations

## Contributing

If you create setup scripts for other platforms (Ubuntu, macOS, Windows), please:
1. Create a new directory: `setup/your-platform/`
2. Include wrapper scripts if needed
3. Add a comprehensive README.md
4. Update this index