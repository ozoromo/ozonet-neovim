{pkgs, ...}: {
  extraPackages = with pkgs; [typescript];
  plugins.typescript-tools.enable = true;

  # LSP updates in bottom right
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  plugins.fidget = {
    enable = true;
  };

  plugins.lsp = {
    enable = true;

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
      gopls.enable = true;
      nil_ls = {
        enable = true;
        settings = {
          autoArchive = true;
        };
      };
      java_language_server.enable = true;
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
