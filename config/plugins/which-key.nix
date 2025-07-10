{...}: {
  programs.nixvim = {
    # https://nix-community.github.io/nixvim/plugins/which-key/index.html
    plugins.which-key = {
      enable = true;
    };
  };
}
