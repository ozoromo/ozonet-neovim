{pkgs, ...}: {
  # https://nix-community.github.io/nixvim/plugins/telescope/index.html
  extraPackages = with pkgs; [
    ripgrep
  ];
  plugins.telescope = {
    # The easiest way to use Telescope, is to start by doing something like:
    #  :Telescope help_tags
    #
    # Two important keymaps to use while in Telescope are:
    #  - Insert mode: <c-/>
    #  - Normal mode: ?
    #
    # [[ Configure Telescope ]]
    # See `:help telescope` and `:help telescope.setup()`
    enable = true;

    # Enable Telescope extensions
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    # You can put your default mappings / updates / etc. in here
    #  See `:help telescope.builtin`
    keymaps = {
      "<leader>fh" = {
        mode = "n";
        action = "help_tags";
        options = {
          desc = "[F]ind [H]elp";
        };
      };
      "<leader>ff" = {
        mode = "n";
        action = "find_files";
        options = {
          desc = "[F]ind [F]iles";
        };
      };
      "<leader>ft" = {
        mode = "n";
        action = "builtin";
        options = {
          desc = "[F]ind [T]elescope";
        };
      };
      "<leader>fc" = {
        mode = "n";
        action = "colorscheme";
        options = {
          desc = "[F]ind [C]olorschemes";
        };
      };
      "<leader>fw" = {
        mode = "n";
        action = "grep_string";
        options = {
          desc = "[F]ind current [W]ord";
        };
      };
      "<leader>fg" = {
        mode = "n";
        action = "live_grep";
        options = {
          desc = "[F]ind by [G]rep";
        };
      };
      "<leader>fd" = {
        mode = "n";
        action = "diagnostics";
        options = {
          desc = "[F]ind [D]iagnostics";
        };
      };
      "<leader>fr" = {
        mode = "n";
        action = "resume";
        options = {
          desc = "[F]ind [R]esume (last picker)";
        };
      };
      "<leader>fo" = {
        mode = "n";
        action = "oldfiles";
        options = {
          desc = "[F]ind [O]ld files (recent)";
        };
      };
      "<leader>fk" = {
        mode = "n";
        action = "keymaps";
        options = {
          desc = "[F]ind [K]eymaps";
        };
      };
      "<leader>fb" = {
        mode = "n";
        action = "buffers";
        options = {
          desc = "[F]ind [B]uffers";
        };
      };
      "<leader><leader>" = {
        mode = "n";
        action = "buffers";
        options = {
          desc = "[ ] Find existing buffers";
        };
      };
    };
    settings = {
      extensions.__raw = "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    # Slightly advanced example of overriding default behavior and theme
    {
      mode = "n";
      key = "<leader>/";
      # You can pass additional configuration to Telescope to change the theme, layout, etc.
      action.__raw = ''
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false
            }
          )
        end
      '';
      options = {
        desc = "[/] Fuzzily search in current buffer";
      };
    }
  ];
}
