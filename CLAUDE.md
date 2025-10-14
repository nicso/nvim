# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

- **Format code**: Use StyLua with `stylua .` (configured in `stylua.toml` with 2-space indentation, 120 column width)
- **Check syntax**: Use `nvim --headless -c "checkhealth" -c quit` to validate configuration
- **Test configuration**: Launch nvim and check for any startup errors

## Architecture Overview

This is a LazyVim-based Neovim configuration with a modular plugin architecture:

### Core Structure
- **Entry point**: `init.lua` bootstraps the configuration by requiring `config.lazy`
- **Plugin manager**: Uses Lazy.nvim with LazyVim as the base distribution
- **Configuration pattern**: Three main directories under `lua/`:
  - `config/`: Core Neovim settings (options, keymaps, autocmds)
  - `plugins/`: Plugin specifications that override/extend LazyVim defaults
  - `jdtls/`: Java development tools configuration

### Key Configuration Files

- `lua/config/lazy.lua`: Lazy.nvim setup with LazyVim integration
- `lua/config/options.lua`: Neovim options (2-space tabs, relative numbers, transparent background)
- `lua/config/keymaps.lua`: Custom keybindings including Alt+arrow line movement, custom navigation
- `lazyvim.json`: LazyVim extras configuration (neo-tree, refactoring, telescope enabled)

### Plugin Architecture

Plugins are organized in `lua/plugins/` and follow LazyVim's spec format:
- Each file returns a table of plugin specifications
- Plugins can override LazyVim defaults by using the same plugin key
- Custom configurations are merged with LazyVim's defaults

### Enhanced Development Plugins

- **git-enhanced.lua**: Enhanced Gitsigns with real-time blame, better hunk navigation, and comprehensive Git keybindings
- **emmet-lsp.lua**: Modern Emmet via Language Server Protocol integrated with blink.cmp
- **terminal.lua**: ToggleTerm with specialized terminals (Maven, Node, GitUI) using `<leader>T*` keymaps
- **autopairs.lua**: Enhanced autopairs with blink.cmp integration and smart bracket handling
- **lspsaga.lua**: Beautiful and performant LSP UI with enhanced hover, definition peek, and diagnostics

### Language Support

- **Java**: Custom JDTLS setup in `lua/jdtls/jdtls_setup.lua` with Mason integration
- **C#**: Enhanced with csharpls-extended-lsp for better navigation
- **Lua**: Configured for Neovim development with lazydev.nvim, custom diagnostics disabled for undefined-global/field
- **Dart**: Custom settings for Flutter development
- **TypeScript/JavaScript**: Standard LSP configuration
- **GDScript**: Godot game engine support
- **Tailwind CSS**: Enhanced development with tailwind-tools.nvim (inline colors, class conceal, sorting)

### Post-load Customizations

Files in `plugin/after/` run after all plugins load:
- `lsp.lua`: LSP keybindings, client configurations, and Java autocmd
- `transparency.lua`: Comprehensive transparency settings for background

### Theme and UI

- **Colorscheme**: Nordfox (from nightfox.nvim)
- **Transparency**: Extensive transparent background configuration
- **File explorer**: Neo-tree (LazyVim extra)
- **Fuzzy finder**: Telescope (LazyVim extra)

### Development Workflow

1. Plugin configurations should extend LazyVim defaults, not replace them
2. Language-specific settings go in `plugin/after/lsp.lua` or dedicated files
3. Custom keymaps use descriptive descriptions for which-key integration
4. Transparency settings are centralized in `plugin/after/transparency.lua`

### Custom Keybinding Patterns

- `Alt+Up/Down`: Move lines in all modes
- `Ctrl+Up/Down`: Half-page scroll with centering
- `hh`: Escape from insert mode
- `<leader>f`: Format document
- Custom window navigation with `Ctrl+r/i/d/t`
- Paste without clipboard replacement
- `<leader>bd`: Buffer delete (using bufdelete.nvim)
- `<leader>fr`: Recent project files with Telescope

### LSP Enhanced Navigation (via LSPSaga)

- `gh` / `K`: Enhanced hover documentation
- `gd`: Go to definition with LSPSaga
- `gp`: Peek definition in floating window
- `gr`: Find references and implementations
- `<F2>`: Smart rename with preview
- `<F4>`: Code actions with beautiful UI
- `g]` / `g[`: Navigate diagnostics with enhanced display
- `<leader>o`: Toggle outline/symbols sidebar

### AI Integration

- **GitHub Copilot**: Configured with custom keybindings
  - `Ctrl+e`: Accept suggestion
  - `Ctrl+t/d/r`: Navigate/dismiss suggestions
- **CopilotChat**: AI-powered code assistance
  - `<leader>cc`: Toggle Copilot Chat
  - `<leader>ce/cr/ci/co`: Explain/Review/Fix/Optimize selected code

### Text Objects and Editing

- **Surround**: Mini.surround for text object manipulation
  - `sa/sd/sr`: Add/Delete/Replace surrounding characters
  - `sf/sF/sh`: Find/highlight surrounding objects
- **Autopairs**: Enhanced bracket/quote pairing with blink.cmp integration
  - Smart spacing in brackets
  - Fast wrap with `Alt+e`
- **Emmet LSP**: Web development abbreviations via Language Server
  - Integrated with completion engine (blink.cmp)
  - Tab completion for Emmet expansions in HTML/JSX/TSX files

### Terminal Integration

- **ToggleTerm**: Multiple specialized terminal instances
  - `<leader>Tf/Th/Tv`: Float/Horizontal/Vertical terminals
  - `<leader>Tm/Tn/Tg/Tb`: Maven/Node/GitUI/Bottom terminals
  - Terminal-specific keymaps avoid conflicts with testing plugin

### Git Integration

- **Enhanced Gitsigns**: Real-time git blame and advanced hunk management
  - `<leader>tb`: Toggle line blame
  - `<leader>hs/hr`: Stage/reset hunks
  - `]c/[c`: Navigate between hunks
  - `<leader>hp`: Preview hunk changes