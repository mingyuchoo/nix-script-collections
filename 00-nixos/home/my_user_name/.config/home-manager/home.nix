{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mgch";
  home.homeDirectory = "/home/mgch";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    clang
    clang-tools
    claude-code
    clojure
    cmake
    codex
    elixir_1_19
    erlang_28
    fish
    fzf
    gemini-cli
    git
    go
    gnumake
    haskell.compiler.ghc9103
    haskell.packages.ghc9103.cabal-install
    haskell.packages.ghc9103.ghcid
    haskell.packages.ghc9103.haskell-language-server
    haskell.packages.ghc9103.hlint
    haskell.packages.ghc9103.hoogle
    haskell.packages.ghc9103.stylish-haskell
    haskellPackages.hindent
    haskellPackages.stack
    helix
    ifuse
    inotify-tools
    ocaml
    opam
    direnv
    emacs-nox
    openjdk25
    rlwrap
    rustup
    sbcl
    stumpwm
    telegram-desktop
    tmux
    unzip
    wget
    yazi
    zellij
    zip
    ## for building
    dbus
    glib
    gtk3
    libsoup_3
    librsvg
    openssl
    pkg-config
    webkitgtk_4_1
  ];

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
  #  /etc/profiles/per-user/mgch/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      df = "df -h";
      ll = "ls -alh";
      la = "ls -A";
      nr = "nix repl --expr '<nixpkgs>{}'";
      sbcl = "rlwrap sbcl";
      update = "sudo nixos-rebuild switch";
      y = "yazi";
    };
  };

  # Java
  programs.java = {
    enable = true;
    package = pkgs.openjdk25;

  };
}
