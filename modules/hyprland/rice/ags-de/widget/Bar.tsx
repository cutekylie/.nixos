import { Variable, GLib, bind } from "astal";
import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import Battery from "gi://AstalBattery";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Tray from "gi://AstalTray";
import Notifd from "gi://AstalNotifd";

import Workspaces from "./Workspaces";

function SysTray() {
  const tray = Tray.get_default();

  return (
    <box className="SysTray">
      {bind(tray, "items").as((items) =>
        items.map((item) => {
          if (item.iconThemePath) App.add_icons(item.iconThemePath);

          const menu = item.create_menu();

          return (
            <button
              tooltipMarkup={bind(item, "tooltipMarkup")}
              onDestroy={() => menu?.destroy()}
              onClickRelease={(self) => {
                menu?.popup_at_widget(
                  self,
                  Gdk.Gravity.SOUTH,
                  Gdk.Gravity.NORTH,
                  null,
                );
              }}
            >
              <icon gIcon={bind(item, "gicon")} />
            </button>
          );
        }),
      )}
    </box>
  );
}

function AudioSlider() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <box className="AudioSlider" css="margin: 0 10px;">
      <eventbox
        onScroll={(_, e) => {
          if (!speaker) return;

          speaker.volume = Math.max(
            0,
            Math.min(
              speaker.volume +
                (e.delta_y < 0
                  ? speaker.volume <= 0.09
                    ? 0.01
                    : 0.03
                  : speaker.volume <= 0.09
                    ? -0.01
                    : -0.03),
              150,
            ),
          );
        }}
        onClickRelease={ "pavucontrol" }
      >
        <icon icon={bind(speaker, "volumeIcon")} />  
      </eventbox>
    </box>
  );
}

function BatteryLevel() {
  const bat = Battery.get_default();

  return (
    <box
      className="Battery"
      visible={bind(bat, "isPresent")}
      valign={Gtk.Align.CENTER}
    >
      <icon icon={bind(bat, "batteryIconName")} valign={Gtk.Align.CENTER} />
      <label
        className="txt-smaller"
        valign={Gtk.Align.CENTER}
        label={bind(bat, "percentage").as((p) => `${Math.floor(p * 100)}%`)}
      />
    </box>
  );
}

function Time({ format = "%H:%M", date_format = "%A %e." }) {
  const date = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(date_format)!,
  );
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!,
  );

  return (
    <box valign={Gtk.Align.CENTER} css="min-width: 30pt; padding: 0 10pt;" className="Clock">
      <box vertical>
        <box className="txt-smaller">
          <label
            onDestroy={() => time.drop()}
            label={time()}
          />
        </box>
        <box className="txt-smallie">
          <label
            onDestroy={() => date.drop()}
            label={date()}
          />
        </box>
      </box>
    </box>
  );
}

export default function Bar(monitor: number) {
  const anchor =
    Astal.WindowAnchor.TOP |
    Astal.WindowAnchor.LEFT |
    Astal.WindowAnchor.RIGHT;

  return (
    <window
      className="Bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={anchor}
    >
      <centerbox>
        <box hexpand halign={Gtk.Align.START}>
          <button label="   "
            onClick={ 'nwg-drawer' }/>
          <Workspaces />
        </box>
        <box>
          {/* that is the center */}
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <SysTray />
          <AudioSlider />
          <BatteryLevel />
          <button label=" 󰂞 "
            onButtonReleaseEvent={() => {
              const win = App.get_window("ControlCenter");
              win.set_visible(!win.visible);
            }} />
          <Time />
        </box>
      </centerbox>
    </window>
  );
}
