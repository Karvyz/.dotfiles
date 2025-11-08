{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        options = {
          tabstop = 2;
          shiftwidth = 0;
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };

        git = {
          enable = true;
          neogit = {
            enable = true;
            mappings.open = "<leader>g";
            mappings.commit = null;
            mappings.pull = null;
            mappings.push = null;
          };
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        comments.comment-nvim.enable = true;
        binds.whichKey.enable = true;
        ui.noice.enable = true;
        debugger.nvim-dap = {
          enable = true;
          ui = {
            enable = false;
          };
          mappings = {
            continue = "<F4>";
            stepBack = "<F5>";
            stepInto = "<F6>";
            stepOut = "<F7>";
            stepOver = "<F8>";
            toggleBreakpoint = "<leader>b";
          };
        };

        autocomplete.blink-cmp = {
          enable = true;
          mappings = {
            confirm = "<Tab>";
            next = null;
            previous = null;
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          mappings = {
            codeAction = "<leader>ca";
            goToDefinition = "gd";
            goToDeclaration = "gD";
            hover = "<leader>h";
            previousDiagnostic = "<leader>k";
            nextDiagnostic = "<leader>j";
          };
        };

        autopairs.nvim-autopairs.enable = true;
        utility = {
          oil-nvim.enable = true;
          motion.flash-nvim.enable = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;

          nix = {
            enable = true;
            lsp.server = "nixd";
            format.type = "nixfmt";
          };
          rust = {
            enable = true;
            dap.enable = true;
          };
          clang.enable = true;
          python.enable = true;
          bash.enable = true;
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            action = ":Oil<CR>";
          }
        ];
      };
    };
  };
}
