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

        git = {
          enable = true;
          vim-fugitive.enable = false;
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
          mappings = {
            codeAction = "<leader>ca";
            goToDefinition = "gd";
            goToDeclaration = "gD";
            hover = "<leader>h";
            previousDiagnostic = "<leader>k";
            nextDiagnostic = "<leader>j";
          };
        };
        luaConfigPre = ''
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
        '';

        autopairs.nvim-autopairs.enable = true;
        utility = {
          yazi-nvim = {
            enable = true;
            mappings.openYazi = "-";
          };
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
        };

        assistant.copilot = {
          enable = true;
          cmp.enable = true;
        };

        extraPlugins = with pkgs.vimPlugins; {
          oil = {
            package = oil-nvim;
            setup = "require('oil').setup {}";
          };
          neogit = {
            package = neogit;
            setup = "require('neogit').setup {}";
          };
          avante = {
            package = avante-nvim;
            setup = "require('avante').setup {
              provider = 'copilot',
              copilot = {
                endpoint = 'https://api.githubcopilot.com/',
                model = 'claude-3.7-sonnet',
              },
              windows = {
	      	      position = 'right',
                width = 50,
              },
            }";
          };
        };

        keymaps = [
          {
            key = "<leader>g";
            mode = "n";
            silent = true;
            action = ":Neogit<CR>";
          }
        ];
      };
    };
  };
}
