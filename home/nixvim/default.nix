{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lsp.nix
    ./plugins.nix
    ./keybinds.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      confirm = true;

      cursorline = true;
      list = true;
      signcolumn = "yes";
      incsearch = true;
      termguicolors = true;

      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      tabstop = 2;

      undofile = true;
      undolevels = 10000;
    };
  };
}
