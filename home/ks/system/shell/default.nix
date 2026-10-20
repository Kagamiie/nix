{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      sys-up       = "sudo nixos-rebuild switch --flake $HOME/nix/.#moya";

      homec = "zeditor $HOME/System/nix/home/";
      sysc  = "zeditor $HOME/System/nix/";
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
}
