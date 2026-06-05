{...}: {
  # https://nix-community.github.io/nixvim/plugins/which-key/index.html
  plugins.which-key = {
    enable = true;
    settings = {
      # Register the leader-key groups so the popup shows readable section
      # names instead of a bare "+prefix" for each namespace.
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "LSP";
        }
      ];
    };
  };
}
