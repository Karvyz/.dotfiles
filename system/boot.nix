{ pkgs, ...}:
{
	boot = {
		plymouth = {
      enable = true;
      theme = "cross_hud";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "cross_hud" ];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

		# Bootloader.
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
	    # Hide the OS choice for bootloaders.
			# It's still possible to open the bootloader list by pressing any key
			# It will just not appear on screen unless a key is pressed
			timeout = 0;
		};
	};

	services.udev.extraRules = ''
SUBSYSTEM=="usb", ATTRS{idVendor}=="03e7", MODE="0666"
	'';
}
