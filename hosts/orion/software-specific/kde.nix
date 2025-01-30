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

    shortcuts = {
      kwin = {
        # "Overview" = "Meta";
        "Overview" = "Meta,Meta+W,Toggle Overview";
        # "Window Close" = "Meta+C";
        "Window Close" = "Meta+C,Alt+F4,Close Window";
        # "services/kitty.desktop"."_launch" = "Meta+A";
      };
    };

    configFile = {
      "ksmserverrc"."General"."loginMode" = "emptySession";
      "kwinrc"."Effect-kwin4_effect_geometry_change"."Duration" = 500;
      "kwinrc"."MaximizeTile"."DisableOutlineTile" = false;
      "kwinrc"."MaximizeTile"."DisableRoundTile" = false;
      "kwinrc"."Plugins"."kinetic_scaleEnabled" = true;
      "kwinrc"."Plugins"."kinetic_squashEnabled" = true;
      "kwinrc"."Plugins"."kwin4_effect_geometry_changeEnabled" = true;
      "kwinrc"."Plugins"."poloniumEnabled" = true;
      "kwinrc"."Plugins"."scaleEnabled" = false;
      "kwinrc"."Plugins"."squashEnabled" = false;
      "kwinrc"."PrimaryOutline"."ActiveOutlineUseCustom" = false;
      "kwinrc"."PrimaryOutline"."ActiveOutlineUsePalette" = true;
      "kwinrc"."PrimaryOutline"."InactiveOutlineThickness" = 2;
      "kwinrc"."PrimaryOutline"."InactiveOutlineUseCustom" = false;
      "kwinrc"."PrimaryOutline"."InactiveOutlineUsePalette" = true;
      "kwinrc"."PrimaryOutline"."OutlineThickness" = 2;
      "kwinrc"."Windows"."DelayFocusInterval" = 0;
      "kwinrc"."Windows"."FocusPolicy" = "FocusStrictlyUnderMouse";
    };
  };
}
