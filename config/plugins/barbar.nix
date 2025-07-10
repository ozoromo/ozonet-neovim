{...}: {
  programs.nixvim = {
    plugins.barbar = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader>bp";
        action = "<cmd>BufferPick<cr>";
      }
      {
        key = "<leader>bc";
        action = "<cmd>BufferClose<cr>";
      }
      {
        key = "<leader>bC";
        action = "<cmd>BufferPickDelete<cr>";
      }
      {
        key = "<A-1>";
        action = "<cmd>BufferGoto 1<cr>";
      }
      {
        key = "<A-2>";
        action = "<cmd>BufferGoto 2<cr>";
      }
      {
        key = "<A-3>";
        action = "<cmd>BufferGoto 3<cr>";
      }
      {
        key = "<A-4>";
        action = "<cmd>BufferGoto 4<cr>";
      }
      {
        key = "<A-5>";
        action = "<cmd>BufferGoto 5<cr>";
      }
    ];
  };
}
