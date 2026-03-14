# prompt-token-counter (toksum)

[English](README.md)

命令行工具，统计 300+ 大语言模型的 token 数量并估算 API 成本。适用于 OpenClaw 工作区 token 消耗审计（memory、persona、skills）。

## 功能

- **300+ 模型**：覆盖 OpenAI、Anthropic、Google、Meta、Mistral、DeepSeek 等 34+ 提供商
- **Token 统计**：OpenAI 使用 tiktoken 精确计数，其余为近似（约 85–95% 准确）
- **成本估算**：支持输入/输出 token 定价
- **CLI**：支持文本、文件、URL 输入

## 快速开始

```bash
python -m scripts.cli -m gpt-4 "Hello, world!"
```

## 用法示例

```bash
# 统计文件 token
python -m scripts.cli -f input.txt -m claude-3-opus -c

# 多文件 + 成本
python -m scripts.cli -v -c -f AGENTS.md -f SOUL.md -f MEMORY.md -m gpt-4o

# 列出支持模型
python -m scripts.cli -l
```

## 选项

| 选项 | 说明 |
|------|------|
| `-m, --model` | 模型名（必填，除非 `--list-models`） |
| `-f, --file` | 从文件读取（可重复） |
| `-u, --url` | 从 URL 读取（可重复） |
| `-l, --list-models` | 列出所有支持模型 |
| `-c, --cost` | 显示成本估算 |
| `--output-tokens` | 使用输出 token 定价 |
| `--currency` | USD 或 INR |
| `-v, --verbose` | 详细输出 |

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

## 项目结构

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
