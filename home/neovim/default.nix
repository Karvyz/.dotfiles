{ pkgs, config, ... }:
let
  palette = config.lib.stylix.colors;
in
{
  home.packages = [
    pkgs.nixd
    pkgs.lua-language-server
  ];

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      ripgrep
      lldb
    ];

    plugins = with pkgs.vimPlugins; [
      base16-nvim

      nvim-treesitter.withAllGrammars

      noice-nvim
      nui-nvim
      nvim-notify

      lualine-nvim
      nvim-web-devicons

      gitsigns-nvim

      neogit
      plenary-nvim
      diffview-nvim

      nvim-dap
      nvim-nio
      nvim-dap-ui

      oil-nvim

      autoclose-nvim

      comment-nvim

      telescope-nvim
      telescope-fzf-native-nvim

      vimtex

      lsp-zero-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      rustaceanvim

      copilot-vim
      CopilotChat-nvim
    ];

    extraLuaConfig = ''
            ${builtins.readFile ./options.lua}
            ${builtins.readFile ./plugins/lsp-zero.lua}
            ${builtins.readFile ./plugins/telescope.lua}
            ${builtins.readFile ./plugins/dap.lua}
            ${builtins.readFile ./plugins/other.lua}

      			require('base16-colorscheme').setup({
      				base00 = '#${palette.base00}', base01 = '#${palette.base01}', base02 = '#${palette.base02}', base03 = '#${palette.base03}',
      				base04 = '#${palette.base04}', base05 = '#${palette.base05}', base06 = '#${palette.base06}', base07 = '#${palette.base07}',
      				base08 = '#${palette.base08}', base09 = '#${palette.base09}', base0A = '#${palette.base0A}', base0B = '#${palette.base0B}',
      				base0C = '#${palette.base0C}', base0D = '#${palette.base0D}', base0E = '#${palette.base0E}', base0F = '#${palette.base0F}',
      			})
    '';
  };
}
