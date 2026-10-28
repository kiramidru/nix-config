{ config, pkgs, ... }:
{
  programs.wlogout = {
    enable = true;

    # GTK CSS cannot stop wlogout's grid from stretching to fill the screen.
    # Center a natural-size grid so every launcher gets the same compact row.
    package = pkgs.wlogout.overrideAttrs (old: {
      postPatch = (old.postPatch or "") + ''
        substituteInPlace main.c \
          --replace-fail 'static int buttons_per_row = 3;' 'static int buttons_per_row = 5;' \
          --replace-fail 'static int margin[] = {230, 230, 230, 230};' 'static int margin[] = {24, 24, 24, 24};' \
          --replace-fail 'static int space[] = {0, 0};' 'static int space[] = {0, 18};' \
          --replace-fail 'GtkWidget *grid = gtk_grid_new();' 'GtkWidget *grid = gtk_grid_new();
            gtk_widget_set_halign(grid, GTK_ALIGN_CENTER);
            gtk_widget_set_valign(grid, GTK_ALIGN_CENTER);
            gtk_grid_set_column_homogeneous(GTK_GRID(grid), TRUE);
            gtk_grid_set_row_homogeneous(GTK_GRID(grid), TRUE);' \
          --replace-fail 'gtk_widget_set_name(but[i][j], buttons[count].label);' 'gtk_widget_set_name(but[i][j], buttons[count].label);
            atk_object_set_name(gtk_widget_get_accessible(but[i][j]), buttons[count].label);' \
          --replace-fail 'gtk_widget_set_hexpand(but[i][j], TRUE);' 'gtk_widget_set_hexpand(but[i][j], FALSE);' \
          --replace-fail 'gtk_widget_set_vexpand(but[i][j], TRUE);' 'gtk_widget_set_vexpand(but[i][j], FALSE);'
      '';
    });

    layout =
      map
        (
          entry:
          entry
          // {
            text = "";
            circular = true;
          }
        )
        [
          {
            label = "lock";
            action = "${config.programs.swaylock.package}/bin/swaylock -f";
            keybind = "l";
          }
          {
            label = "logout";
            # End this graphical session, not every session belonging to the user.
            action = "${pkgs.uwsm}/bin/uwsm stop";
            keybind = "e";
          }
          {
            label = "suspend";
            # swayidle's before-sleep hook locks the screen before sleep proceeds.
            action = "${pkgs.systemd}/bin/systemctl suspend";
            keybind = "u";
          }
          {
            label = "reboot";
            action = "${pkgs.systemd}/bin/systemctl reboot";
            keybind = "r";
          }
          {
            label = "shutdown";
            action = "${pkgs.systemd}/bin/systemctl poweroff";
            keybind = "s";
          }
        ];
  };
}
