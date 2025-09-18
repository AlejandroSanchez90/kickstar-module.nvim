# AGENTS.md - Coding Guidelines for Neovim Config

## Build/Lint/Test Commands
- **Format Lua**: `stylua .` (configured with 2-space indent, single quotes, no call parentheses)
- **Lint**: Automatic via nvim-lint (eslint for JS/TS, markdownlint for MD)
- **Check**: Use `:checkhealth` in Neovim to validate configuration

## Code Style Guidelines
- **Language**: Lua for all configuration files
- **Indentation**: 2 spaces (defined in .stylua.toml)
- **Quotes**: Single quotes preferred (AutoPreferSingle)
- **Line width**: 160 characters max
- **Require style**: Use `require 'module'` (space, single quotes)
- **Plugin structure**: Return table with plugin specs in `lua/plugins/*.lua`
- **File endings**: `-- vim: ts=2 sts=2 sw=2 et` for Lua files

## Naming Conventions
- **Files**: Kebab-case (e.g., `auto-session.lua`, `mini-ai.lua`)
- **Variables**: snake_case
- **Functions**: snake_case
- **Keymaps**: Use `<leader>` prefix (space) for custom mappings

## Architecture
- **Core config**: `lua/core/` (options, keymaps)
- **Plugins**: Individual files in `lua/plugins/`
- **Dependencies**: Define explicitly in plugin specs
- **Lazy loading**: Use `ft`, `event`, `cmd` for performance