import { Workspaces } from "./modules/workspaces.js"
import { Applauncher } from "./modules/applauncher.js"

export const WINDOW_NAME = "hub";

function Center() {
		return Widget.Box({
				vertical: true,
				spacing: 12,
				children: [
						Workspaces(false),
						Applauncher(),
				],
		})
}

export const hub = Widget.Window({
    name: WINDOW_NAME,
    setup: self => self.keybind("Escape", () => {
        App.closeWindow(WINDOW_NAME)
    }),
    visible: false,
    keymode: "exclusive",
    child: Center(),
})
