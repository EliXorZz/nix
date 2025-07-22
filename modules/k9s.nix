{ inputs, config, pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.k9s = {
      enable = true;

      # TRANSPARENT
      skins = {
        body = {
          bgColor = "default";
        };

        prompt = {
          bgColor = "default";
        };

        info = {
          sectionColor = "default";
        };

        dialog = {
          bgColor = "default";
          labelFgColor = "default";
          fieldFgColor = "default";
        };

        frame = {
          crumbs = {
            bgColor = "default";
          };
          title = {
            bgColor = "default";
            counterColor = "default";
          };
          menu = {
            fgColor = "default";
          };
        };

        views = {
          charts = {
            bgColor = "default";
          };
          table = {
            bgColor = "default";
            header = {
              fgColor = "default";
              bgColor = "default";
            };
          };
          xray = {
            bgColor = "default";
          };
          logs = {
            bgColor = "default";
            indicator = {
              bgColor = "default";
              toggleOnColor = "default";
              toggleOffColor = "default";
            };
          };
          yaml = {
            colonColor = "default";
            valueColor = "default";
          };
        };
      };
    };
  };
}