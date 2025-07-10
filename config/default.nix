{
  polarity ? "dark",
  ...
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./plugins/barbar.nix
    ./plugins/lualine.nix
    ./plugins/which-key.nix

    ./plugins/treesitter.nix
    ./plugins/conform.nix
    ./plugins/nvim-cmp.nix
    ./plugins/lsp.nix
    ./plugins/indent-blankline.nix
    ./plugins/todo-comments.nix

    ./plugins/telescope.nix
    ./plugins/neotree.nix
    ./plugins/oil.nix
    ./plugins/leap.nix
    ./plugins/sleuth.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour =
          if (polarity == "light")
          then "latte"
          else "frappe";
      };
    };
    plugins.web-devicons.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";

      have_nerd_font = true;
    };

    keymaps = [
      {
        key = "<leader>w";
        action = "<cmd>w<cr>";
      }
      {
        key = "<leader>q";
        action = "<cmd>q<cr>";
      }
      {
        key = "<leader>x";
        action = "<cmd>x<cr>";
      }
    ];

    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];
  };
}
