{
  pkgs,
  lib,
  ...
}: let
  # Filetypes whose ecosystem has one canonical indent width get it hard-set
  # here instead of relying on sleuth's detection (which only runs on buffer
  # load and can guess wrong on new/empty files). Add a line per language.
  indentByFiletype = {
    nix = 2;
  };
in {
  extraPackages = with pkgs; [typescript];
  plugins.typescript-tools.enable = true;

  # Sleuth's per-filetype heuristics would run after these autocmds and
  # override them, so turn them off for the hard-set filetypes.
  globals = lib.mapAttrs' (ft: _: lib.nameValuePair "sleuth_${ft}_heuristics" 0) indentByFiletype;

  autoCmd =
    lib.mapAttrsToList (ft: width: {
      event = "FileType";
      pattern = ft;
      desc = "Force ${toString width}-space indent for ${ft}";
      callback.__raw = ''
        function()
          vim.bo.shiftwidth = ${toString width}
          vim.bo.tabstop = ${toString width}
          vim.bo.softtabstop = ${toString width}
        end
      '';
    })
    indentByFiletype;

  # LSP updates in bottom right
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  plugins.fidget = {
    enable = true;
  };

  # Render diagnostics (from LSP servers and any linters) inline as virtual
  # text at the end of the line, in addition to the sign column and underline.
  # Maps to `vim.diagnostic.config`.
  diagnostic.settings = {
    virtual_text = true;
    underline = true;
    severity_sort = true;
    update_in_insert = false;
  };

  plugins.lsp = {
    enable = true;

    # Show LSP inlay hints (inline parameter names / inferred types) on attach.
    # Toggle them at runtime with <leader>lI (see keymaps below).
    inlayHints = true;

    # For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    servers = {
      clangd.enable = true;
      asm_lsp.enable = true;
      pyright.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      gopls = {
        enable = true;
        # gopls emits no inlay hints unless asked; turn the useful ones on.
        settings.gopls.hints = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          compositeLiteralTypes = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };
      };
      nil_ls = {
        enable = true;
        settings = {
          autoArchive = true;
        };
      };
      # `jdtls` (Eclipse JDT) is the canonical Java language server. The old
      # `java_language_server` (georgewfraser) is minimal and effectively
      # unmaintained. For a full Java IDE experience consider the dedicated
      # `plugins.jdtls` (nvim-jdtls) wrapper instead of the plain lspconfig server.
      jdtls.enable = true;
      texlab.enable = true;
      tinymist.enable = true;

      html.enable = true;
      svelte.enable = true;
      # NOTE: `ts_ls` (tsserver) is intentionally disabled. `typescript-tools`
      # (enabled above) already provides TypeScript/JavaScript support, and
      # running both attaches two LSP clients to every TS/JS buffer, producing
      # duplicate diagnostics, completions and hover results.
      # ts_ls.enable = true;
      tailwindcss.enable = true;
      volar.enable = true;

      lua_ls = {
        enable = true;

        # cmd = {
        #};
        # filetypes = {
        #};
        settings = {
          completion = {
            callSnippet = "Replace";
          };
          hint = {
            enable = true;
          };
          #diagnostics = {
          #  disable = {
          #    "missing-fields";
          #};
        };
      };
    };

    keymaps = {
      # Diagnostic keymaps that take no arguments live here (mapped to
      # `vim.diagnostic.<action>`). Cursor navigation lives in `extra` below so
      # it can use the modern `vim.diagnostic.jump` API.
      diagnostic = {
        "<leader>le" = {
          action = "open_float";
          desc = "Show diagnostic [E]rror (float)";
        };
        "<leader>lq" = {
          action = "setloclist";
          desc = "Diagnostics to loclist [Q]";
        };
      };

      extra = [
        # `vim.diagnostic.goto_prev/goto_next` are deprecated; use `jump`.
        {
          key = "[d";
          mode = "n";
          action.__raw = ''
            function()
              vim.diagnostic.jump { count = -1, float = true }
            end
          '';
          options.desc = "Previous [D]iagnostic message";
        }
        {
          key = "]d";
          mode = "n";
          action.__raw = ''
            function()
              vim.diagnostic.jump { count = 1, float = true }
            end
          '';
          options.desc = "Next [D]iagnostic message";
        }
        {
          key = "<leader>lI";
          mode = "n";
          action.__raw = ''
            function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end
          '';
          options.desc = "LSP: Toggle [I]nlay hints";
        }
      ];

      lspBuf = {
        # Navigation (universal Vim conventions, kept off the leader key).
        "gd" = {
          action = "definition";
          desc = "LSP: [G]oto [D]efinition";
        };
        "gD" = {
          action = "declaration";
          desc = "LSP: [G]oto [D]eclaration";
        };
        # Opens a popup that displays documentation about the word under your cursor.
        #  See `:help K` for why this keymap.
        "K" = {
          action = "hover";
          desc = "LSP: Hover Documentation";
        };

        # Actions and look-ups grouped under <leader>l (the LSP which-key group).
        "<leader>lr" = {
          action = "references";
          desc = "LSP: [R]eferences";
        };
        # Rename the symbol under your cursor across the project.
        "<leader>ln" = {
          action = "rename";
          desc = "LSP: Re[n]ame";
        };
        # Execute a code action; your cursor usually needs to be on an error or
        # a suggestion from your LSP for this to activate.
        "<leader>la" = {
          action = "code_action";
          mode = ["n" "x"];
          desc = "LSP: Code [A]ction";
        };
        "<leader>li" = {
          action = "implementation";
          desc = "LSP: [I]mplementation";
        };
        "<leader>lt" = {
          action = "type_definition";
          desc = "LSP: [T]ype Definition";
        };
        "<leader>ls" = {
          action = "document_symbol";
          desc = "LSP: Document [S]ymbols";
        };
        "<leader>lh" = {
          action = "signature_help";
          desc = "LSP: Signature [H]elp";
        };
      };
    };
  };
}
