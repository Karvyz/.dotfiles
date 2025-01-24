{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = [ pkgs.nixfmt-rfc-style ];
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nixd = {
            enable = true;
            settings = {
              formatting.command = [ "nixfmt" ];
              nixpkgs.expr = "import <nixpkgs> { }";
              options.nixos.expr = "(builtins.getFlake \"/home/karviz/.dotfiles/\").nixosConfigurations.orion.options";
            };
          };
          clangd.enable = true;
          pyright.enable = true;

          texlab.enable = true;
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
            completion.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            documentation.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
          };
        };
      };
    };
  };
}
