{...}: {
  # Global, non-plugin keymaps.
  # Plugin-specific keymaps live next to their plugin under ./plugins/.
  keymaps = [
    # [[ Basic file actions ]]
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<cr>";
      options.desc = "[W]rite (save) buffer";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<cr>";
      options.desc = "[Q]uit window";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>x<cr>";
      options.desc = "Save and quit (:[x])";
    }

    # [[ Clear search highlights ]]
    # Implements the behaviour promised in options.nix (hlsearch on, cleared with <Esc>).
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Clear search highlight";
    }

    # [[ Window navigation ]]
    # Move focus between splits without the <C-w> prefix.
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }
  ];
}
