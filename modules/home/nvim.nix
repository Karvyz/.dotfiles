{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.vscode.enable = true;
    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      oil.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = false;
        ensureInstalled = [ "lua" "rust" "c" "python" ];
	parserInstallDir = "~/.config/nvim/treesitter";
      };
      luasnip.enable = true;
      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          clangd.enable = true;
          pylsp.enable = true;
        };
      };
      cmp = {
        enable = true;
	# sources = [
	#   { name = "nvim-lsp"; }
	#   { name = "path"; }
	#   { name = "buffer"; }
	# ];
      };
    };
  };
}
