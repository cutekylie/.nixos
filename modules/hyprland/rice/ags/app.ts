import { App, Gtk } from "astal/gtk3";
import style from "./styles/index.scss";
import Bar from "./widget/Bar";
import NotificationPopups from "./widget/notifications/NotificationPopups";
import Applauncher from "./widget/Applauncher";
import ControlCenter from "./widget/ControlCenter";

const settings = Gtk.Settings.get_default();
settings.gtk_enable_animations = true;

App.start({
  css: style,
  requestHandler(request, res) {
    print(request);
    res("ok");
  },
  main: () => {
    NotificationPopups(0);
    ControlCenter();
    Bar(0);
    Applauncher();
  },
});
