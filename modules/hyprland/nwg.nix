{ pkgs, ... }:

{
  home.packages = [
  	pkgs.nwg-dock-hyprland
	pkgs.nwg-drawer
  ];

  home.file.".config/nwg-dock-hyprland/style.css".text = ''

  window {
    background: #171717;
    padding: 10px;
      border-radius: 15px;
      border-style: none;
      border-width: 1px;
      /*border-color: rgba(156, 142, 122, 0.7)*/
  }

  #box {
    /* Define attributes of the box surrounding icons here */
    padding: 10px;
  }

  #active {
      /* This is to underline the button representing the currently active window */
      border-bottom: solid 0px;
      border-color: rgba(255, 255, 255, 0.3);
  }

  button, image {
      background: none;
      border-style: none;
      box-shadow: none;
      color: #b2b5b3;
  }

  button {
      padding: 4px;
      margin-left: 4px;
      margin-right: 4px;
      color: #b2b5b3;
    font-size: 12px;
    border-radius: 4px;
  }

  button:hover {
      background-color: rgba(255, 255, 255, 0.15);
      border-radius: 8px;
  }

  button:focus {
      box-shadow: none;
  }

  '';



  home.file.".config/nwg-drawer/drawer.css".text = ''

  window {
    background-color: rgba(12, 12, 12, 0.95);
    color: #eeeeee
  }

  /* search entry */
  entry {
      background-color: rgba (0, 0, 0, 0.2)
  }

  button, image {
      background: none;
      border: none
  }

  button:hover {
      background-color: rgba (255, 255, 255, 0.1)
  }

  /* in case you wanted to give category buttons a different look */
  #category-button {
     margin: 0 10px 0 10px
  }

  #pinned-box {
      padding-bottom: 5px;
      border-bottom: 1px dotted gray
  }

  #files-box {
      padding: 5px;
      border: 1px dotted gray;
      border-radius: 15px
  }

  /* math operation result label */
  #math-label {
      font-weight: bold;
      font-size: 16px
  }

  '';

}
