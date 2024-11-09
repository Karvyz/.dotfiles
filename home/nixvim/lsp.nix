{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
        clangd.enable = true;
        # rust_analyzer = {
        #   enable = true;
        #   installCargo = true;
        #   installRustc = true;
        # };
      };
    };

    rustaceanvim.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };
}
