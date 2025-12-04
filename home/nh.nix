{
  programs.nh = {
    enable = true;
    flake = "/home/karviz/.dotfiles";
    clean = {
      enable = true;
      dates = "1d";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
