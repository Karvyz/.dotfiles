import { Workspaces } from './modules/workspaces.js'
const systemtray = await Service.import("systemtray")
const audio = await Service.import("audio")
const battery = await Service.import("battery")

const vertical = true

function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
            child: Widget.Icon({ icon: item.bind("icon") }),
            on_primary_click: (_, event) => item.activate(event),
            on_secondary_click: (_, event) => item.openMenu(event),
            tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        children: items,
				vertical: vertical,
    })
}


function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
				vertical: vertical,
        children: [icon,/*  slider */],
    })
}

function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)

    return Widget.CircularProgress({
				visible: battery.bind('available'),
				value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
				class_name: battery.bind('charging').as(ch => ch ? 'charging' : ''),
				rounded: true,
			  css: 'min-width: 40px;'  // its size is min(min-height, min-width)
						+ 'min-height: 40px;'
						+ 'font-size: 6px;' // to set its thickness set font-size on it
						+ 'margin: 4px;' // you can set margin on it
    })
}

const date = Variable("", {
    poll: [1000, 'date "+%H:%M\n%d:%m"'],
})

function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
				justification: "center",
    })
}



// layout of the bar
function Left() {
    return Widget.Box({
        spacing: 8,
				vertical: vertical,
        children: [
            Workspaces(vertical),
        ],
    })
}

function Right() {
    return Widget.Box({
        vpack: "end",
        spacing: 8,
				vertical: vertical,
        children: [
            SysTray(),
            Volume(),
            BatteryLabel(),
            Clock(),
        ],
    })
}

export const bar = Widget.Window({
    name: `bar`, // name has to be unique
    class_name: "bar",
    anchor: ["left", "top", "bottom"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
				vertical: true,
        start_widget: Left(),
        end_widget: Right(),
    }),
})



