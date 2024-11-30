import { Variable, GLib, bind } from "astal";
import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import Battery from "gi://AstalBattery";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Tray from "gi://AstalTray";
import Notifd from "gi://AstalNotifd";

import Workspaces from "./Workspaces";
import FocusedClient from "./FocusedClient";

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


class NotificationMap {
  private map: Map<number, Gtk.Widget> = new Map();
  private var: Variable<Array<Gtk.Widget>> = Variable([]);

  constructor() {
    const notifd = Notifd.get_default();

    notifd.connect("notified", (_, id) => {
      const notification = notifd.get_notification(id);

      if (notification) {
        const notificationBox = new Gtk.Box({ orientation: Gtk.Orientation.HORIZONTAL, spacing: 10 });

        const icon = notification.icon;
        if (icon && Gtk.isPixbuf(icon)) {
          const image = new Gtk.Image({ pixbuf: icon });
          notificationBox.pack_start(image, false, false, 0);
        }

        const titleLabel = new Gtk.Label({ label: notification.summary });
        notificationBox.pack_start(titleLabel, false, false, 0);

        const bodyLabel = new Gtk.Label({ label: notification.body || "No content" });
        notificationBox.pack_start(bodyLabel, false, false, 0);

        this.set(id, notificationBox);
      }
    });

    notifd.connect("resolved", (_, id) => {
      this.delete(id);
    });
  }

  private set(key: number, value: Gtk.Widget) {
    if (this.map.has(key)) {
      this.removeFromUI(key);
    }
    this.map.set(key, value);
    this.var.set([...this.map.values()]);
  }

  private removeFromUI(key: number) {
    const widget = this.map.get(key);
    if (widget) {
      widget.destroy();
      this.map.delete(key);
    }
  }

  private delete(key: number) {
    const widget = this.map.get(key);
    if (widget) {
      widget.destroy();
      this.map.delete(key);
    }
    this.var.set([...this.map.values()]);
  }

  clearAll() {
    const keys = Array.from(this.map.keys());
    keys.forEach(key => {
      this.delete(key);
    });
  }

  get() {
    return this.var.get();
  }

  subscribe(callback: (list: Array<Gtk.Widget>) => void) {
    return this.var.subscribe(callback);
  }
}

function NotificationPopup(notifs: NotificationMap) {
  let isWindowOpen = false;
  let popupWindow: Gtk.Window | null = null;

  const toggleWindow = () => {
    if (isWindowOpen) {
      if (popupWindow) {
        popupWindow.destroy();
        popupWindow = null;
      }
      isWindowOpen = false;
    } else {
      popupWindow = new Gtk.Window();
      popupWindow.set_title("Notifiche");
      popupWindow.set_default_size(400, 300);

      const notificationsBox = new Gtk.Box({ orientation: Gtk.Orientation.VERTICAL, spacing: 5 });

      const clearButton = new Gtk.Button({ label: "󰎟 Clear" });
      clearButton.connect("clicked", () => {
        notifs.clearAll();
      });

      notificationsBox.pack_start(clearButton, false, false, 0);

      const notifications = notifs.get();
      notifications.forEach((notificationWidget, index) => {
        notificationsBox.pack_start(notificationWidget, false, false, 0);
        if (index < notifications.length - 1) {
          const separator = new Gtk.Separator({ orientation: Gtk.Orientation.HORIZONTAL });
          notificationsBox.pack_start(separator, false, false, 5);
        }
      });

      popupWindow.add(notificationsBox);

      popupWindow.connect("key-press-event", (widget, event) => {
        const keyval = event.keyval;
        if (keyval === Gdk.KEY_Escape) {
          toggleWindow();
        }
      });

      popupWindow.show_all();

      const screen = Gdk.Screen.get_default();
      const monitorIndex = screen.get_monitor_at_window(popupWindow.get_window());
      const geometry = screen.get_monitor_geometry(monitorIndex);
      const width = geometry.width;
      const height = geometry.height;

      const windowWidth = 420;
      const windowHeight = 340;
      popupWindow.move(width - windowWidth - 20, height - windowHeight - 20);

      isWindowOpen = true;
    }
  };

  return toggleWindow;
}

export default function Bar(monitor: number) {
  const anchor =
    Astal.WindowAnchor.BOTTOM |
    Astal.WindowAnchor.LEFT |
    Astal.WindowAnchor.RIGHT;

  const notifs = new NotificationMap();

  const showNotifications = (button: Gtk.Button) => {
    const notificationMenu = NotificationPopup(notifs);
    notificationMenu();
  };

  return (
    <window
      className="Bar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={anchor}
    >
      <centerbox>
        <box hexpand halign={Gtk.Align.START}>
          <Time />
          <FocusedClient />
          <Workspaces />
        </box>
        <box>
          {/* that is the center */}
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <SysTray />
          <AudioSlider />
          <BatteryLevel />
          <button label="󰂞 " on-click={showNotifications} />
        </box>
      </centerbox>
    </window>
  );
}
