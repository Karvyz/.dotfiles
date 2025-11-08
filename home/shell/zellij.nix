{
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      show_startup_tips = false;
      show_release_notes = false;
      on_force_close = "quit";
      ui.pane_frames.hide_session_name = true;
    };
    enableZshIntegration = true;
    exitShellOnExit = true;
  };
}
