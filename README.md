# prompt-token-counter (toksum)

[中文](README.zh.md)

CLI tool for counting tokens and estimating API costs across 300+ LLM models. Useful for OpenClaw workspace token consumption audits (memory, persona, skills).

## Features

- **300+ models** across 34+ providers (OpenAI, Anthropic, Google, Meta, Mistral, DeepSeek, etc.)
- **Token counting**: exact via tiktoken for OpenAI; ~85–95% accuracy for others
- **Cost estimation**: input/output token pricing
- **CLI**: text, file, and URL input

## Quick Start

```bash
python -m scripts.cli -m gpt-4 "Hello, world!"
```

## Usage Examples

```bash
# Count tokens from file
python -m scripts.cli -f input.txt -m claude-3-opus -c

# Multiple files with cost
python -m scripts.cli -v -c -f AGENTS.md -f SOUL.md -f MEMORY.md -m gpt-4o

# List supported models
python -m scripts.cli -l
```

## Options

| Option | Description |
|--------|-------------|
| `-m, --model` | Model name (required unless `--list-models`) |
| `-f, --file` | Read from file (repeatable) |
| `-u, --url` | Read from URL (repeatable) |
| `-l, --list-models` | List all supported models |
| `-c, --cost` | Show cost estimate |
| `--output-tokens` | Use output token pricing |
| `--currency` | USD or INR |
| `-v, --verbose` | Verbose output |

## Python API

```python
from scripts import TokenCounter, count_tokens, estimate_cost

tokens = count_tokens("Hello!", "gpt-4")
counter = TokenCounter("claude-3-opus")
tokens = counter.count_messages([
    {"role": "system", "content": "..."},
    {"role": "user", "content": "..."}
])
cost = estimate_cost(tokens, "gpt-4", input_tokens=True)
```

## Project Structure

```
prompt_token_counter/
├── SKILL.md
├── package.json
├── publish_npm.py
└── scripts/
    ├── cli.py
    ├── core.py
    └── registry/
        ├── models.py
        └── pricing.py
```

## License

MIT
