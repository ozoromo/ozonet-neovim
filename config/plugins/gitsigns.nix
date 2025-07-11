{...}: {
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>gb";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      options = {
        desc = "[G]it toggle [B]lame";
      };
    }
    {
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<cr>";
      options = {
        desc = "[G]it [R]eset hunk";
      };
    }
  ];
}
