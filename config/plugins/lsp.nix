{pkgs, ...}: {
  programs.nixvim = {
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
        ansiblels.enable = true;

        html.enable = true;
        svelte.enable = true;
        ts_ls.enable = true;
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
        # Diagnostic keymaps
        diagnostic = {
          "[d" = {
            #mode = "n";
            action = "goto_prev";
            desc = "Go to previous [D]iagnostic message";
          };
          "]d" = {
            #mode = "n";
            action = "goto_next";
            desc = "Go to next [D]iagnostic message";
          };
          "<leader>lq" = {
            #mode = "n";
            action = "setloclist";
            desc = "Open diagnostic [Q]uickfix list";
          };
        };

        extra = [
          # Jump to the definition of the word under your cusor.
          #  This is where a variable was first declared, or where a function is defined, etc.
          #  To jump back, press <C-t>.
        ];

        lspBuf = {
          # Rename the variable under your cursor.
          #  Most Language Servers support renaming across files, etc.
          "<leader>r" = {
            #mode = "n";
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          # Execute a code action, usually your cursor needs to be on top of an error
          # or a suggestion from your LSP for this to activate.
          "<leader>c" = {
            #mode = "n";
            action = "code_action";
            desc = "LSP: [C]ode [A]ction";
          };
          # Opens a popup that displays documentation about the word under your cursor
          #  See `:help K` for why this keymap.
          "K" = {
            action = "hover";
            desc = "LSP: Hover Documentation";
          };
          # WARN: This is not Goto Definition, this is Goto Declaration.
          #  For example, in C this would take you to the header.
          "<leader>gd" = {
            action = "declaration";
            desc = "LSP: [G]oto [D]eclaration";
          };
        };
      };
    };
  };
}
