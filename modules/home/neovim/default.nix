{ pkgs, ... }:
{
    home.packages = with pkgs; [
    rust-analyzer
    lua-language-server
    nixd
  ];

  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
	  ripgrep
    ];

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim

	  nvim-treesitter.withAllGrammars  

      lualine-nvim
      nvim-web-devicons


      comment-nvim

      telescope-nvim
      telescope-fzf-native-nvim

	  lsp-zero-nvim
  	  nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp 
      luasnip
	];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/lsp-zero.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/other.lua}
    '';
  };
}
