# 🚀 Neovim Configuration

Configuration Neovim optimisée pour le développement fullstack **Java/Spring Boot + React/TypeScript**.

Basée sur [LazyVim](https://github.com/LazyVim/LazyVim) avec plugins et optimisations personnalisées.

## ⚡ Fonctionnalités

- 🎯 **Java/Spring Boot** : JDTLS optimisé, génération de code, debugging
- ⚛️ **React/TypeScript** : LSP avancé, Emmet, auto-tags JSX, import helpers
- 🧪 **Testing intégré** : Neotest pour Java (JUnit) et JavaScript (Jest)
- 📋 **Terminaux spécialisés** : Maven, Node, Git, Database
- 🎨 **UI moderne** : Nordfox theme, transparence, Flash navigation
- 🛠️ **Outils qualité** : Linting, formatting, coverage de code
- 🔄 **Git intégré** : Blame temps réel, hunks interactifs, diff preview
- 📁 **Navigation avancée** : Oil explorer, recent project files, fuzzy search

## 🎮 Cheat Sheet

### Navigation
| Keymap | Description |
|--------|-------------|
| `s` / `S` | Flash navigation (mots/treesitter) |
| `<leader>o` | Oil file explorer |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fp` | Recent project files |
| `<leader>fR` | Recent files |
| `<leader>ft` | Find TODO comments |
| `<C-PageUp/Down>` | Previous/Next buffer |
| `<leader>bd` | Delete buffer |

### Édition
| Keymap | Description |
|--------|-------------|
| `hh` | Escape insert mode |
| `<Alt-Up/Down>` | Move lines (tous modes) |
| `<Ctrl-Up/Down>` | Half-page scroll centered |
| `sa` / `sd` / `sr` | Add/Delete/Replace surround |
| `<leader>f` | Format document |
| `<leader>rn` | Replace word globally |
| `<C-Z>,` | Emmet expand |
| `<M-e>` | Fast wrap (autopairs) |

### LSP & Code
| Keymap | Description |
|--------|-------------|
| `gh` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `<F2>` | Rename |
| `<F4>` | Code actions |
| `g]` / `g[` | Next/Previous diagnostic |

### Java/Spring Boot
| Keymap | Description |
|--------|-------------|
| `<leader>jb` | Spring Boot Run |
| `<leader>jc` | Generate Class |
| `<leader>je` | Generate Entity |
| `<leader>jr` | Generate Repository |
| `<leader>js` | Generate Service |
| `<leader>jk` | Generate Controller |

### Testing
| Keymap | Description |
|--------|-------------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run tests in file |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Show test output |
| `<leader>tc` | Show test coverage |

### Terminaux
| Keymap | Description |
|--------|-------------|
| `<C-\>` | Toggle terminal |
| `<leader>Tm` | Maven terminal |
| `<leader>Tn` | Node terminal |
| `<leader>Tg` | Git terminal |
| `<leader>Td` | Database terminal |
| `<leader>Tf/h/v` | Float/Horizontal/Vertical |

### Git Integration (Enhanced)
| Keymap | Description |
|--------|-------------|
| `]h` / `[h` | Next/Prev git hunk |
| `<leader>ghs/r` | Stage/Reset hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghb` | Blame line |
| `<leader>gtb` | Toggle git blame |
| `<leader>ghd` | Diff this |

### Import/Export (JS/TS)
| Keymap | Description |
|--------|-------------|
| `<leader>if` | Import file under cursor |
| `<leader>iF` | Import from list |
| `<leader>ii` | Import word under cursor |
| `<leader>ig` | Go to module |
| `<leader>is` | Sort imports |
| `<leader>ic` | Fix imports |

### AI/Copilot
| Keymap | Description |
|--------|-------------|
| `<C-e>` | Accept Copilot suggestion |
| `<C-l>` | Accept Copilot line |
| `<C-t/d/r>` | Next/Prev/Dismiss suggestion |
| `<leader>cc` | Toggle Copilot Chat |
| `<leader>ce/cr/ci/co` | Explain/Review/Fix/Optimize |

### Debugging
| Keymap | Description |
|--------|-------------|
| `<F5>` | Start/Continue debug |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>du` | Toggle debug UI |

## 📁 Structure

```
~/.config/nvim/
├── lua/
│   ├── config/           # Core settings
│   │   ├── options.lua   # Neovim options
│   │   ├── keymaps.lua   # Custom keybindings
│   │   └── lazy.lua      # Lazy.nvim setup
│   ├── plugins/          # Plugin configurations
│   │   ├── spring.lua    # Spring Boot tools
│   │   ├── react.lua     # React/TypeScript tools
│   │   ├── testing.lua   # Test frameworks
│   │   ├── terminal.lua  # Terminal integration
│   │   └── ...
│   └── jdtls/           # Java LSP configuration
└── plugin/after/        # Post-load customizations
    ├── lsp.lua          # LSP settings
    └── transparency.lua # UI transparency
```

## 🛠️ Outils requis

### Frontend (React/TypeScript)
```bash
npm install -g prettier eslint typescript
```

### Backend (Java/Spring)
```bash
# Java 17+ requis
sudo pacman -S jdk17-openjdk maven
```

### Optionnels
```bash
# Formatters/Linters additionnels
npm install -g markdownlint-cli
pip install codespell
```

## 🎨 Thème

- **Colorscheme** : Nordfox
- **Background** : Transparent
- **Icons** : Nerd Fonts requis

## 📋 Commandes projet

Pour un projet Java/Spring + React :

```bash
# Structure recommandée
project/
├── backend/     # Spring Boot
└── frontend/    # React

# Commandes rapides
<leader>Tm  # Start Maven: mvn spring-boot:run
<leader>Tn  # Start React: npm run dev
<leader>tt  # Run tests
```

---

**💡 Tip** : Utilisez `<leader>` (espace par défaut) suivi de la lettre pour découvrir les commandes disponibles grâce à which-key !