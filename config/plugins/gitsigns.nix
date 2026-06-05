{...}: {
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    # [[ Hunk actions (<leader>g, the Git which-key group) ]]
    {
      key = "<leader>gs";
      action = "<cmd>Gitsigns stage_hunk<cr>";
      options.desc = "[G]it [S]tage/unstage hunk";
    }
    {
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<cr>";
      options.desc = "[G]it [R]eset hunk";
    }
    {
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<cr>";
      options.desc = "[G]it [P]review hunk";
    }
    {
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<cr>";
      options.desc = "[G]it [D]iff this";
    }

    # [[ Blame ]]
    {
      key = "<leader>gb";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      options.desc = "[G]it toggle line [B]lame";
    }
    {
      key = "<leader>gB";
      action.__raw = ''
        function()
          require('gitsigns').blame_line { full = true }
        end
      '';
      options.desc = "[G]it [B]lame line (full)";
    }

    # [[ Hunk navigation, matching the [x / ]x bracket convention ]]
    {
      key = "]h";
      action = "<cmd>Gitsigns nav_hunk next<cr>";
      options.desc = "Next git [h]unk";
    }
    {
      key = "[h";
      action = "<cmd>Gitsigns nav_hunk prev<cr>";
      options.desc = "Previous git [h]unk";
    }
  ];
}
