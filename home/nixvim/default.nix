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

      # updatetime = 100; # faster completion

      cursorline = true;
      list = true;
      # showmode = false;
      signcolumn = "yes";
      incsearch = true;
      termguicolors = true;

      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      tabstop = 2;

      completeopt = "menu,menuone";
      wildmode = "longest:full,full";

      undofile = true;
      undolevels = 10000;
    };
  };
}
