{...}: {
  plugins.oil = {
    enable = true;
  };

  # Oil ships no "open" mapping of its own; `-` (edit the parent directory) is
  # the conventional binding from the plugin's own documentation.
  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options.desc = "Open parent directory (Oil)";
    }
  ];
}
