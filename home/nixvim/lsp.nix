{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
        clangd.enable = true;
        pyright.enable = true;
      };
    };

    rustaceanvim.enable = true;

    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "copilot"; }
        ];
        completion.completeopt = "menu,menuone,noinsert";
        window = {
          completion.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          documentation.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        };
      };
    };
  };
}
