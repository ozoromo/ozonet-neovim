{polarity ? "dark", ...}: {
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./keymaps.nix

    ./plugins/barbar.nix
    ./plugins/lualine.nix
    ./plugins/which-key.nix

    ./plugins/treesitter.nix
    ./plugins/conform.nix
    ./plugins/nvim-cmp.nix
    ./plugins/lsp.nix
    ./plugins/indent-blankline.nix
    ./plugins/todo-comments.nix
    ./plugins/gitsigns.nix

    ./plugins/render-markdown.nix
    ./plugins/noice.nix

    ./plugins/telescope.nix
    ./plugins/neotree.nix
    ./plugins/oil.nix
    ./plugins/leap.nix
    ./plugins/sleuth.nix
  ];

  viAlias = true;
  vimAlias = true;

  plugins.web-devicons.enable = true;
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour =
        if (polarity == "light")
        then "latte"
        else "frappe";
    };
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = true;
  };
}
