# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Build and Run
- `nix run .` - Build and run the nixvim configuration
- `nix build .` - Build the nixvim configuration
- `nix flake check .` - Verify configuration is not broken

### Development
- `nix develop` - Enter development shell with dependencies
- `nix flake update` - Update flake.lock dependencies

## Architecture

This is a NixVim configuration that uses Nix flakes to manage a Neovim setup. The configuration is structured as a modular system:

### Core Structure
- `flake.nix` - Main flake configuration defining inputs, outputs, and build system
- `config/default.nix` - Main configuration entry point that imports all modules
- `config/options.nix` - Core Neovim options and settings
- `config/plugins/` - Individual plugin configurations as separate Nix modules

### Key Components
- **Theme**: Catppuccin colorscheme with polarity parameter (light/dark)
- **LSP**: Comprehensive language server setup supporting multiple languages (TypeScript, Rust, Python, Go, Nix, etc.)
- **Formatting**: Conform.nvim with language-specific formatters (stylua, alejandra, clang-format)
- **Plugin Management**: Each plugin is configured in its own Nix file under `config/plugins/`

### Configuration Pattern
The configuration uses a functional approach where:
- `config/default.nix` accepts a `polarity` parameter to control light/dark theme
- Each plugin file exports a function that takes `pkgs` and other parameters
- Plugin configurations include keymaps, settings, and required packages

### Key Features
- Multi-language LSP support with TypeScript, Rust, Python, Go, Nix, and more
- Automatic formatting on save with language-specific formatters
- File management with Neo-tree and Oil
- Git integration with Gitsigns
- Telescope for fuzzy finding
- Treesitter for syntax highlighting
- Tab management with Barbar
- Status line with Lualine