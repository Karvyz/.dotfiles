{
  programs.nixvim.plugins = {
    comment.enable = true;
    autoclose.enable = true;
    lsp-format.enable = true;

    oil.enable = true;
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    copilot-lua = {
      enable = true;
      settings = {
        suggestion.enabled = false;
        panel.enabled = false;
      };
    };
    copilot-chat.enable = true;

    neogit.enable = true;
    gitsigns.enable = true;

    noice.enable = true;
    web-devicons.enable = true;
    treesitter.enable = true;
    lualine.enable = true;
    dressing.enable = true;
  };
}
