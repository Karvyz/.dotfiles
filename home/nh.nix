{
  programs.nh = {
    enable = true;
    flake = "/home/karviz/.dotfiles";
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 5 --keep-since 14d";
    };
  };
}
