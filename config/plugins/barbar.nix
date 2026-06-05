{...}: {
  plugins.barbar = {
    enable = true;
  };

  keymaps = [
    # [[ <leader>b: discoverable buffer actions (shown by which-key) ]]
    {
      key = "<leader>bp";
      action = "<cmd>BufferPick<cr>";
      options.desc = "[B]uffer [P]ick";
    }
    {
      key = "<leader>bc";
      action = "<cmd>BufferClose<cr>";
      options.desc = "[B]uffer [C]lose";
    }
    {
      key = "<leader>bC";
      action = "<cmd>BufferPickDelete<cr>";
      options.desc = "[B]uffer pick & [C]lose";
    }

    # [[ Quick buffer navigation, matching the [x / ]x bracket convention ]]
    {
      key = "[b";
      action = "<cmd>BufferPrevious<cr>";
      options.desc = "Previous [b]uffer";
    }
    {
      key = "]b";
      action = "<cmd>BufferNext<cr>";
      options.desc = "Next [b]uffer";
    }

    # [[ barbar's standard Alt-key mappings ]]
    {
      key = "<A-,>";
      action = "<cmd>BufferPrevious<cr>";
      options.desc = "Previous buffer";
    }
    {
      key = "<A-.>";
      action = "<cmd>BufferNext<cr>";
      options.desc = "Next buffer";
    }
    {
      key = "<A-<>";
      action = "<cmd>BufferMovePrevious<cr>";
      options.desc = "Move buffer left";
    }
    {
      key = "<A->>";
      action = "<cmd>BufferMoveNext<cr>";
      options.desc = "Move buffer right";
    }
    {
      key = "<A-1>";
      action = "<cmd>BufferGoto 1<cr>";
      options.desc = "Go to buffer 1";
    }
    {
      key = "<A-2>";
      action = "<cmd>BufferGoto 2<cr>";
      options.desc = "Go to buffer 2";
    }
    {
      key = "<A-3>";
      action = "<cmd>BufferGoto 3<cr>";
      options.desc = "Go to buffer 3";
    }
    {
      key = "<A-4>";
      action = "<cmd>BufferGoto 4<cr>";
      options.desc = "Go to buffer 4";
    }
    {
      key = "<A-5>";
      action = "<cmd>BufferGoto 5<cr>";
      options.desc = "Go to buffer 5";
    }
    {
      key = "<A-6>";
      action = "<cmd>BufferGoto 6<cr>";
      options.desc = "Go to buffer 6";
    }
    {
      key = "<A-7>";
      action = "<cmd>BufferGoto 7<cr>";
      options.desc = "Go to buffer 7";
    }
    {
      key = "<A-8>";
      action = "<cmd>BufferGoto 8<cr>";
      options.desc = "Go to buffer 8";
    }
    {
      key = "<A-9>";
      action = "<cmd>BufferGoto 9<cr>";
      options.desc = "Go to buffer 9";
    }
    {
      key = "<A-0>";
      action = "<cmd>BufferLast<cr>";
      options.desc = "Go to last buffer";
    }
    {
      key = "<A-p>";
      action = "<cmd>BufferPin<cr>";
      options.desc = "Pin/unpin buffer";
    }
    {
      key = "<A-c>";
      action = "<cmd>BufferClose<cr>";
      options.desc = "Close buffer";
    }
  ];
}
