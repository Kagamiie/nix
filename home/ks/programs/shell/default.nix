{ pkgs, ... }:

let
  backupDir   = "$HOME/System/Backups";
  backupPaths = ".config Documents Downloads Desktop .gitconfig System .ssh .pandoc";
in {
  programs.fish = {
    enable = true;
    shellAliases = {
      backup       = "${pkgs.p7zip}/bin/7z a -mx=9 ${backupDir}/backup_$(date +%Y-%m-%d_%H-%M-%S).7z ~/{${backupPaths}}";
      backup-clean = "find ${backupDir} -name '*.7z' -mtime +7 -delete";
      backup-list  = "ls -lah ${backupDir}/";
      sys-up       = "sudo nixos-rebuild switch --flake $HOME/System/nix#moya";
      # home-up      = "home-manager switch --flake $HOME/System/nix#ks";
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
