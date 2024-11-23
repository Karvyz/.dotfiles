{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {
      lsp.keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
      };

      cmp.settings.mapping = {
        "<Tab>" = "cmp.mapping.confirm({ select = true })";
        "<Up>" = "cmp.mapping.select_prev_item()";
        "<Down>" = "cmp.mapping.select_next_item()";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<CR>";
      }

      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
      }

      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>Neogit<CR>";
      }

      {
        mode = "n";
        key = "<leader>cc";
        action = "<cmd>CopilotChatToggle<CR>";
      }
      {
        mode = "v";
        key = "<leader>ce";
        action = "<cmd>CopilotChatExplain<CR>";
      }
      {
        mode = "v";
        key = "<leader>cd";
        action = "<cmd>CopilotChatDocs<CR>";
      }
    ];
  };
}
