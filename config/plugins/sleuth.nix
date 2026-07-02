{...}: {
  # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
  plugins.sleuth = {
    enable = true;
  };

  keymaps = [
    # Sleuth only detects indentation when a buffer is loaded, so after an
    # autoformatter changes the indent style the buffer keeps stale settings.
    # This re-runs detection without having to reopen the file.
    {
      mode = "n";
      key = "<leader>bi";
      action = "<cmd>Sleuth<cr>";
      options.desc = "[B]uffer re-detect [I]ndent";
    }
  ];
}
