{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    # config options
    settings = {
      style             = "/home/ks/.config/wofi/styles.css";
      show              = "drun";
      width             = "50%";
      height            = "50%";
      lines             = 7;
      columns           = 3;
      always_parse_args = true;
      show_all          = false;
      print_command     = true;
      layer             = "overlay";
      insensitive       = true;
      prompt            = "...";
      term              = "foot";
      hide_scroll       = true;
      line_wrap         = false;
      allow_images      = true;
      image_size        = 24;
    };

    style = null;
  };

  home.file = {
    ".config/wofi/styles.css".text = ''
      * {
          font-family: "JetBrains Mono", "Fira Code", monospace;
          font-size: 13px;
      }

      window {
          margin: 0px;
          border: 2px solid #555555;
          background-color: #1e1e1e;
      }

      #input {
          margin: 8px;
          padding: 8px 12px;
          border: 2px solid #555555;
          border-radius: 0px;
          color: #cccccc;
          background-color: #2a2a2a;
          animation: slideIn 0.2s ease;
          transition: border-color 0.2s ease;
      }

      #input:focus {
          border-color: #9f61ef;
      }

      #input image {
          color: #888888;
          margin-right: 8px;
      }

      #input placeholder {
          color: #666666;
      }

      #inner-box {
          margin: 5px;
          border: none;
          background-color: transparent;
          animation: fadeIn 0.3s ease;
      }

      #outer-box {
          margin: 5px;
          border: none;
          background-color: transparent;
      }

      #scroll {
          margin: 0px;
          border: none;
      }

      #entry {
          padding: 8px 12px;
          margin: 2px 8px;
          border: none;
          border-radius: 0px;
          background-color: transparent;
          color: #cccccc;
          transition: all 0.15s ease;
      }

      #entry:nth-child(odd) {
          background-color: rgba(255, 255, 255, 0.02);
      }

      #entry:hover {
          background-color: #2a2a2a;
          transform: translateX(2px);
      }

      #entry:selected {
          background-color: #3a3a3a;
          border-left: 3px solid #9f61ef;
          font-weight: normal;
      }

      #entry image {
          margin-right: 10px;
          transition: transform 0.2s ease;
      }

      #entry:selected image {
          transform: scale(1.1);
      }

      #text {
          margin: 0px;
          border: none;
          color: #cccccc;
      }

      #text:selected {
          background-color: transparent;
      }

      @keyframes slideIn {
          from {
              opacity: 0;
              transform: translateY(-10px);
          }
          to {
              opacity: 1;
              transform: translateY(0);
          }
      }

      @keyframes fadeIn {
          from {
              opacity: 0;
          }
          to {
              opacity: 1;
          }
      }
    '';
  };
}
