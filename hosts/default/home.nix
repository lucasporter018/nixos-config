{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lucasp";
  home.homeDirectory = "/home/lucasp";


  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    vesktop
    wofi
    bibata-cursors
    fzf
    lazygit
    repgrep
    fd
    prettier
    black
    stylua
    fish
    nixpkgs-fmt
    google-java-format
    mako
    lua
    python3
    ripgrep
    wl-clipboard
  ];

  # Config Files 
  xdg.configFile = {

    # Alacritty config
    "alacritty/alacritty.toml".source = ../../configs/alacritty/alacritty.toml;

    # Hyprland config
    "hypr/hyprland.conf".source = ../../configs/hypr/hyprland.conf;

    # Hyprpaper config
    "hypr/hyprpaper.conf".source = ../../configs/hypr/hyprpaper.conf;

    # Waybar config
    "waybar/config".source = ../../configs/waybar/config.jsonc;
    "waybar/style.css".source = ../../configs/waybar/style.css;

    # # Nvim config
    # nvim.source = ../../configs/nvim;
    # nvim.recursive = true;
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lucasp/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR-THEME = "Bibata-Modern-Ice";
    XCURSOR-SIZE = "20";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}


