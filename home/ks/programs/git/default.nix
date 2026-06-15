{ config, pkgs, ... }:

{  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kagamiie";
        email = "cakic.lukasrb@gmail.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
