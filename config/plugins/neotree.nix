{...}: {
  # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
  plugins.neo-tree = {
    enable = true;
    settings.log_to_file = false;
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      key = "\\";
      action = "<cmd>Neotree toggle<cr>";
      options.desc = "Toggle Neo-tree (explorer)";
    }
    {
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options.desc = "[E]xplorer (Neo-tree)";
    }
  ];
}
