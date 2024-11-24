import { App } from "astal/gtk3";
import style from "./styles/index.scss";
import Bar from "./widget/Bar";
import NotificationPopups from "./widget/notifications/NotificationPopups";
import Applauncher from "./widget/Applauncher";

App.start({
  css: style,
  requestHandler(request, res) {
    print(request);
    res("ok");
  },
  main: () => {
    NotificationPopups(0);
    Bar(0);
    Applauncher();
  },
});
