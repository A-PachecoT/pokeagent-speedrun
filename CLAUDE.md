# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
PokeAgent Challenge - An AI agent that plays Pokémon Emerald using vision-language models (VLMs) for speedrunning competitions. The agent uses computer vision to analyze game screenshots and makes strategic decisions through customizable prompt modules.

## Key Commands

### Running the Project
```bash
# Start the emulator server (required first)
python -m server.app

# In a separate terminal, run the AI agent
python agent.py --backend openai --model-name gpt-4o-mini

# Other backend examples:
python agent.py --backend gemini --model-name gemini-1.5-flash-002
python agent.py --backend local --model-name Qwen/Qwen2-VL-7B-Instruct
```

### Development Setup
```bash
# Create conda environment
conda create -y -n pokeagent python=3.10
conda activate pokeagent

# Install dependencies
pip install -r requirements.txt

# Install mgba (required system library)
# Ubuntu/Debian: sudo apt-get install libmgba0.10 mgba-common
# macOS: brew install mgba
# Other systems: See README.md for detailed instructions
```

## Architecture

### Core Components
- **agent.py**: Main entry point that orchestrates the AI agent loop
- **server/app.py**: FastAPI server that wraps the Game Boy Advance emulator
- **agent/**: Modular prompt components (perception, planning, memory, action)
- **pokemon_env/**: Game environment interface for emulator communication
- **utils/vlm.py**: Unified interface for different VLM backends (OpenAI, Gemini, local models)

### Agent Modules
The agent uses a modular prompt architecture where each module can be customized:
- **system_prompt.py**: Defines agent personality and objectives
- **perception.py**: Analyzes game screenshots to extract relevant information
- **planning.py**: Makes strategic decisions based on current game state
- **memory.py**: Maintains context across game sessions
- **action.py**: Translates decisions into button inputs

### Important Files
- **utils/state_formatter.py**: Formats game state for VLM consumption
- **utils/anticheat.py**: Tracks agent actions for competition submission
- **Emerald-GBAdvance/**: Directory where the Pokémon Emerald ROM must be placed

## VLM Backend Configuration
Set API keys as environment variables:
```bash
export OPENAI_API_KEY="your-key"
export GEMINI_API_KEY="your-key"
export OPENROUTER_API_KEY="your-key"
```

## Development Notes
- The project uses FastAPI for the emulator server (port 8000)
- Web interface available at http://localhost:8000 for real-time monitoring
- Logs are created in `logs/` directory with timestamps
- Anti-cheat tracking stores actions in `anticheat_tracking.json`
- No formal test suite - manual testing through gameplay
- Python 3.10 recommended (3.9+ minimum)

## Competition Submission
When preparing for competition:
1. Test your agent thoroughly
2. Check `anticheat_tracking.json` is being generated
3. Create video recording of your run
4. Submit via Discord with required hashtags (#pokeagent-submission #<backend>)