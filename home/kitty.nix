{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      confirm_os_window_close = 0;
    };

    keybindings = {
      "ctrl+shift+j" = "change_font_size all -2.0";
      "ctrl+shift+k" = "change_font_size all +2.0";
    };
  };
}
