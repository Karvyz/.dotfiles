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
    extraConfig = ''
      keybinds {
        shared_except "locked" {
          bind "Ctrl y" {
            LaunchOrFocusPlugin "file:~/.config/zellij/plugins/room.wasm" {
              floating true
              ignore_case true
              quick_jump true
            }
          }
        }
      }
    '';
    enableZshIntegration = true;
    exitShellOnExit = true;
  };

  home.file.".config/zellij/layouts/default.kdl".text = ''
    layout {
      pane
    }
  '';
}
