# AGENTS.md

This file contains guidelines for agentic coding tools working in this Neovim configuration.

## Build & Development

This is a Neovim configuration (not a traditional project). No build system exists.

**Plugin Management:**
- Package manager: lazy.nvim (auto-installed on first run)
- Sync/update plugins: Run `:Lazy sync` in Neovim or `nvim --headless "+Lazy! sync" +qa`
- Clean unused plugins: Run `:Lazy clean`

**Linting & Formatting:**
- Format Lua files: `stylua %` (stylua must be installed system-wide)
- Format JS/TS/CSS/HTML/JSON/YAML: `prettier --write %`
- Format Python: `ruff format %` then `ruff check --fix %`
- Format Go: `gofmt -w %`
- Format PHP: `pretty-php %`
- Lint JS/TS: `eslint_d %` 
- Lint Python: `ruff check %`
- Format on save: Enabled via conform.nvim for all configured file types

**Treesitter:**
- Update parsers: `:TSUpdate` in Neovim

## Code Style Guidelines

**Lua Files (all configuration files):**
- Indentation: 2 spaces (no tabs)
- Tab width: 2
- Max line length: Not strictly enforced, prefer readability
- Use `local` for all module and variable declarations
- Plugin specs: Return tables with plugin name, dependencies, and config
- Module structure: `lua/{category}/{module}.lua` (e.g., `lua/lsp/cmp.lua`)
- Variable naming: snake_case (e.g., `lspconfig`, `telescope`)
- Comments: Minimal, use inline comments for clarification
- String quotes: Double quotes preferred
- Keys in tables: Use string keys with quotes (e.g., `"name"`)

**Plugin Configuration Pattern:**
```lua
return {
	"author/plugin-name",
	dependencies = { "other/plugin" },
	version = "x.*",  -- optional version pinning
	event = { "BufReadPre", "BufNewFile" },  -- lazy loading
	build = ":TSUpdate",  -- build command if needed
	config = function()
		-- configuration logic
	end,
}
```

**Keymaps:**
- Leader: `<Space>` (set in lua/config/lazy.lua)
- Localleader: `\`
- Define with `vim.keymap.set("mode", "lhs", rhs, opts)`
- Always include `opts` table with description: `{ desc = "Description here" }`

**LSP Configuration:**
- Uses nvim-lspconfig with blink.cmp for autocompletion
- Capabilities fetched via `require("blink.cmp").get_lsp_capabilities()`
- Lint via nvim-lint (eslint_d, ruff)
- Format via conform.nvim (format-on-save enabled, fallback to LSP)

**File Organization:**
- `lua/core/`: Core Neovim settings (options, keymaps, colorscheme)
- `lua/plugins/`: Plugin configurations
- `lua/lsp/`: LSP, completion, formatting, linting configs
- `lua/config/`: Configuration bootstrap (lazy.nvim setup)
- `init.lua`: Entry point, requires core modules, applies highlight overrides
- `lazy-lock.json`: Lockfile for plugin versions (commit with changes)

**Error Handling:**
- Plugin load failures: lazy.nvim handles automatically
- Git clone failures: Bootstrap script in lua/config/lazy.lua shows error and exits
- LSP errors: Handled by LSP client (show via vim.lsp.diagnostic)

**Testing:**
No test suite exists. Manual testing by opening Neovim with this config.

**Import Conventions:**
- Use `require("module.path")` for Lua modules
- Prefer local assignment: `local module = require("module.path")`
- Module paths relative to `lua/` directory (no `.lua` extension)

**Autocommands:**
- Use `vim.api.nvim_create_autocmd(events, opts)` to define autocommands
- Common events: `BufReadPre`, `BufNewFile`, `BufWritePre`, `BufEnter`, `InsertLeave`
- Pattern field: Use `"*"` for all files or specific patterns like `"*.lua"`
- Always provide callback function with args (e.g., `args.buf`)

**Neovim API Usage:**
- `vim.opt`: Set options (e.g., `vim.opt.number = true`)
- `vim.g`: Set global variables (e.g., `vim.g.mapleader = " "`)
- `vim.keymap.set`: Define keybindings (mode, lhs, rhs, opts)
- `vim.api.nvim_*`: Direct API calls for advanced operations
- `vim.cmd`: Execute Vimscript commands when Lua API insufficient

**Plugin Dependencies:**
- LSP plugins go in `lua/lsp/` directory
- UI plugins go in `lua/plugins/` directory
- Core settings go in `lua/core/` directory
- Lazy.nvim automatically imports from these directories based on config

**Common Patterns:**
- Lazy loading: Use `event`, `cmd`, or `keys` to delay plugin loading
- Version: Pin major version with `"x.*"` for stability
- Build: Install compilers/formatters when adding new language support
- Event triggering: Use appropriate events for lazy-loaded functionality

**Language Server Protocols:**
- Use `vim.lsp.config("*", { capabilities = capabilities })` for global config
- LSP servers are configured via nvim-lspconfig
- Auto-attach to buffers with matching file types via `event = { "BufReadPre", "BufNewFile" }`
- Use blink.cmp for completion integration with LSP servers

**File Search Exclusions:**
Telescope and Telescope-fzf-native exclude:
- `**/.git/*`
- `**/.idea/*`
- `**/.vscode/*`
- `**/build/*`
- `**/dist/*`
- `**/yarn.lock`
- `**/package-lock.json`

**Treesitter Parsers:**
Installed parsers: lua, c, cpp, html, css, javascript, typescript, tsx, json, vim, vimdoc, php, go
Add new languages to `ensure_installed` list in lua/plugins/treesitter.lua

**Keybinding Categories:**
- Use `<leader>` prefix for custom commands (e.g., `<leader>mp`)
- Use `<localleader>` (`\`) for buffer-local commands
- Always include descriptive text in opts table for which-key compatibility

**Color Scheme:**
- Colorscheme defined in `lua/core/colorscheme.lua`
- Use `vim.api.nvim_set_hl(0, "HighlightGroup", { fg = "color", bg = "color" })` for highlights
- Background transparency: Set `bg = "none"` where needed
- Global highlights can be set in `init.lua` after loading core modules