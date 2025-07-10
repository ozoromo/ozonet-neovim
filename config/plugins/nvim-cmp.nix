{...}: {
  # https://nix-community.github.io/nixvim/plugins/luasnip/index.html
  plugins.luasnip = {
    enable = true;
  };

  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp.html
  plugins.cmp-nvim-lsp = {
    enable = true;
  };

  # https://nix-community.github.io/nixvim/plugins/cmp-path.html
  plugins.cmp-path = {
    enable = true;
  };

  # `friendly-snippets` contains a variety of premade snippets
  #    See the README about individual language/framework/plugin snippets:
  #    https://github.com/rafamadriz/friendly-snippets
  # https://nix-community.github.io/nixvim/plugins/friendly-snippets.html
  # plugins.friendly-snippets = {
  #   enable = true;
  # };

  # Autocompletion
  # See `:help cmp`
  # https://nix-community.github.io/nixvim/plugins/cmp/index.html
  plugins.cmp = {
    enable = true;

    settings = {
      snippet = {
        expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };

      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      # For an understanding of why these mappings were
      # chosen, you will need to read `:help ins-completion`
      #
      # No, but seriously, Please read `:help ins-completion`, it is really good!
      mapping = {
        "<C-f>" = "cmp.mapping.scroll_docs(-4)";
        "<C-b>" = "cmp.mapping.scroll_docs(4)";

        "<CR>" = "cmp.mapping.confirm { select = true }";
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
      };

      # WARNING: If plugins.cmp.autoEnableSources Nixivm will automatically enable the
      # corresponding source plugins. This will work only when this option is set to a list.
      # If you use a raw lua string, you will need to explicitly enable the relevant source
      # plugins in your nixvim configuration.
      sources = [
        {
          name = "luasnip";
        }
        {
          name = "nvim_lsp";
        }
        {
          name = "path";
        }
        {
          name = "buffer";
        }
      ];
    };
  };
}
