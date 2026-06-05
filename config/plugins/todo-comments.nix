{...}: {
  # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
  plugins.todo-comments = {
    enable = true;
  };

  # Jump between TODO/FIXME/etc. comments, matching the [x / ]x bracket convention.
  keymaps = [
    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
          require('todo-comments').jump_next()
        end
      '';
      options.desc = "Next [t]odo comment";
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
          require('todo-comments').jump_prev()
        end
      '';
      options.desc = "Previous [t]odo comment";
    }
  ];
}
