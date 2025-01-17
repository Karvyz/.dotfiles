{ inputs, ... }:
{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  programs.plasma = {
    enable = true;
    kwin = {
      scripts.polonium.enable = true;
    };
    input.touchpads = [
      {
        enable = true;
        naturalScroll = true;
        name = "ELAN1201:00 04F3:3098 Touchpad";
        productId = "3098";
        vendorId = "04f3";
      }
    ];

    hotkeys.commands = {
      "launch-kitty" = {
        name = "Launch Kitty";
        key = "Meta+A";
        command = "kitty";
      };
    };

    shortcuts = {
      kwin = {
        "Overview" = "Meta";
        "Window Close" = "Meta+C";
      };
    };
  };
}
