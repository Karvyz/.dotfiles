const hyprland = await Service.import("hyprland")

export function Workspaces(vertical) {
    const activeId = hyprland.active.workspace.bind("id");
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws
            .filter(workspace => workspace.id > 0) // Filter out non-positive IDs
            .sort((a, b) => a.id - b.id)
            .map(({ id }) => Widget.Button({
                on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
                child: Widget.Label(`${id}`),
                class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
            }))
        );

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
        vertical: vertical,
				hpack: "center",
				vpack: "center",
    });
}
