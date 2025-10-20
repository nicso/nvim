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
- **emmet-lsp.lua**: Modern Emmet via Language Server Protocol integrated with nvim-cmp
- **terminal.lua**: ToggleTerm with specialized terminals (Maven, Node, GitUI, Bottom) using `<leader>T*` keymaps
- **autopairs.lua**: Enhanced autopairs with nvim-cmp integration and smart bracket handling
- **lspsaga.lua**: Beautiful and performant LSP UI with enhanced hover, definition peek, and diagnostics
- **cmp.lua**: nvim-cmp completion engine with Tab/S-Tab navigation and LSP/buffer sources
- **ccc.lua**: Advanced color picker and highlighter with support for multiple color formats (RGB, HSL, HEX) and LSP integration

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
  - Disables semantic token highlights globally
  - Configures LSPSaga keybindings when available, falls back to default LSP
  - LSP-specific settings for lua_ls (disables undefined-global/field warnings), csharp_ls (extended navigation), dartls (2-space indent, 160 line length), ts_ls, gdscript, tailwindcss
- `transparency.lua`: Comprehensive transparency settings for background
  - Sets transparent background for core UI, float windows, file explorers (Neo-tree, nvim-tree), Telescope, notifications

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

### Important Configuration Patterns

- **Keybinding conflicts**: Several keybindings have context-dependent behavior:
  - `Ctrl+d/t/r` are used for both window navigation (normal mode) and Copilot/cmp operations (insert mode)
  - `Ctrl+e` prioritizes Copilot accept over nvim-cmp abort
  - Terminal keybindings use uppercase `T` prefix (`<leader>T*`) to avoid conflicts with testing plugin
- **Semantic tokens**: Disabled globally in `plugin/after/lsp.lua` for performance
- **Snippet engine**: Uses Neovim's native snippet engine (`vim.snippet`)
- **Autocmds**: Spell checking is disabled globally for all filetypes except markdown (which has wrap and 80-column formatting)
- **Special filetypes**: Java files trigger JDTLS setup via FileType autocmd, Godot projects have `<leader>gr` to run

### Custom Keybinding Patterns

#### Line and Text Manipulation
- `Alt+Up/Down`: Move lines in all modes (normal, visual, insert)
- `Ctrl+Up/Down`: Half-page scroll with centering
- `Ctrl+k`: Toggle comment line/selection in all modes (uses native `gcc`/`gc` with ts-comments.nvim)
- `hh`: Escape from insert mode
- `U`: Redo (Ctrl+r equivalent)
- `dd`/`d`/`x`: Delete without yanking to clipboard
- `<leader>d`: Delete to black hole register (in normal/visual)
- `<leader>p` / `p` in visual: Paste without replacing clipboard

#### Buffer and Window Management
- `Ctrl+PageUp/PageDown`: Navigate buffers
- `Ctrl+q`: Delete current buffer (using bufdelete.nvim)
- `<leader>bp/bn`: Alternative buffer navigation (previous/next)
- `Ctrl+r/i/d/t`: Window navigation (left/right/up/down respectively)
- `Ctrl+Alt+Left/Right/Up/Down`: Resize splits directionally
- `Ctrl+s`: Save file (normal and insert modes)
- `Q`: Save all and quit

#### Search and Navigation
- `<leader>ff`: Telescope find files
- `<leader>fg`: Telescope live grep
- `<leader>fb`: Telescope buffers
- `<leader>fr`: Telescope recent project files (current directory only)
- `<leader>rn`: Replace word under cursor globally
- `Home`: Jump to first non-blank character of line

#### Tabs and Splits
- `<leader>to/tx/tn/tp`: Tab open/close/next/previous
- `<leader>sv/sh/sx/se`: Split vertically/horizontally/close/equalize
- `Tab/Shift+Tab`: Buffer navigation (alternative)

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

- **GitHub Copilot**: Configured with custom keybindings (insert mode)
  - `Ctrl+e`: Accept suggestion (conflicts with cmp abort, Copilot takes priority)
  - `Ctrl+t`: Next suggestion (conflicts with window nav, context-dependent)
  - `Ctrl+d`: Previous suggestion (conflicts with window nav, context-dependent)
  - `Ctrl+r`: Dismiss suggestion (conflicts with window nav, context-dependent)
  - `<leader>cpd/cpe`: Disable/enable Copilot
- **CopilotChat**: AI-powered code assistance (visual mode)
  - `<leader>cc`: Toggle Copilot Chat
  - `<leader>ce`: Explain selected code
  - `<leader>cr`: Review selected code
  - `<leader>ci`: Fix selected code
  - `<leader>co`: Optimize selected code

### Text Objects and Editing

- **Surround**: Mini.surround for text object manipulation
  - `sa/sd/sr`: Add/Delete/Replace surrounding characters
  - `sf/sF/sh`: Find/highlight surrounding objects
- **Autopairs**: Enhanced bracket/quote pairing with nvim-cmp integration
  - Smart spacing in brackets
  - Fast wrap with `Alt+e`
- **Emmet LSP**: Web development abbreviations via Language Server
  - Integrated with completion engine (nvim-cmp)
  - Tab completion for Emmet expansions in HTML/JSX/TSX files
- **Completion (nvim-cmp)**:
  - `Ctrl+j/k`: Navigate completion items
  - `Tab/Shift+Tab`: Navigate completion menu
  - `Enter`: Confirm selection
  - `Ctrl+Space`: Trigger completion manually
  - `Ctrl+u/d`: Scroll documentation (conflicts with window nav when cmp visible)

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

### Color Management

- **ccc.nvim**: Advanced color picker and highlighter
  - `<leader>cp`: Open color picker
  - `<leader>cc`: Convert color to different format
  - `<leader>ct`: Toggle color highlighter
  - Auto-highlights colors in CSS, HTML, JS/TS, Vue, Svelte, Lua files
  - Supports RGB, HSL, HEX formats with alpha channel