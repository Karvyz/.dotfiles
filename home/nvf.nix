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
        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<Tab>";
            next = null;
            previous = null;
          };
        };

        lsp.formatOnSave = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableFormat = true;

          nix = {
            enable = true;
            lsp.server = "nixd";
            format.type = "nixfmt";
          };
          rust.enable = true;
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
              }
            }";
          };
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            silent = true;
            action = ":Oil<CR>";
          }
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
