{
  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
    	"scratchpads",
    ]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 60%"
    unfocus = "hide"

    [scratchpads.updater]
    animation = "fromTop"
    command = "kitty --class updater --hold nh os switch"
    class = "updater"
    size = "75% 60%"
    unfocus = "hide"

    [scratchpads.volume]
    animation = "fromRight"
    command = "pavucontrol"
    class = "pavucontrol"
    lazy = true
    size = "40% 90%"
    unfocus = "hide"
     	'';
}
