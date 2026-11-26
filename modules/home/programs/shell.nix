{ config, ... }:

{
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/System/nix";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      sys-up   = "nh os switch --ask $HOME/System/nix";
      sys-test = "nh os test $HOME/System/nix";

      homec = "zeditor -n $HOME/System/nix/home/ks.nix $HOME/System/nix/modules/home";
      sysc  = "zeditor -n $HOME/System/nix";
    };

    interactiveShellInit = ''
      set fish_greeting
      function fish_prompt
        set -l s $status
        set -l cyan (set_color brcyan)
        set -l red  (set_color red)
        set -l rst  (set_color normal)
        set -g __fish_git_prompt_showupstream auto
        printf '%s%s%s:%s%s ' $cyan (whoami) $rst (prompt_pwd) (fish_git_prompt)
        test $s -ne 0; and printf '%s[%s]%s ' $red $s $rst
        printf '$ '
      end
      function jme
        nohup java -jar ~/.local/bin/jmerise/JMerise.jar >/dev/null 2>&1 &
      end
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}
