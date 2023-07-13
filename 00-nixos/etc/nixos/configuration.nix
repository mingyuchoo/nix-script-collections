# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mgch = {
    isNormalUser = true;
    description = "mgch";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # for Web
      firefox
      # for desktop
      kate
      akonadi
      plasma5Packages.knotes
      # for Editor
      vscode
      dbeaver
      # for Rust
      cargo
      cargo-watch
      cargo-modules
      cargo-tauri
      cargo-lambda
      clippy
      rustc
      rustfmt
      rustup
      rust-analyzer
      # for Nodejs
      nodejs-18_x
      nodePackages_latest.pnpm
      nodePackages_latest.typescript
      nodePackages_latest.typescript-language-server
      # for Java
      coursier
      gradle
      jdk17
      # for Haskell
      haskell.compiler.ghc962
      haskellPackages.cabal-install
      haskellPackages.haskell-language-server
      haskellPackages.stack
      haskellPackages.stylish-haskell
      haskellPackages.ghcid
      haskellPackages.hindent
      haskellPackages.hlint
      haskellPackages.hoogle
      # for Lua
      lua5_4
      lua-language-server
      # for OCaml
      ocaml-ng.ocamlPackages_latest.ocaml
      ocaml-ng.ocamlPackages_latest.findlib
      ocaml-ng.ocamlPackages_latest.dune_3
      ocaml-ng.ocamlPackages_latest.ocamlgraph
      # for Terraform
      terraform
      # for Elm
      elmPackages.elm
      elmPackages.elm-analyse
      elmPackages.elm-doc-preview
      elmPackages.elm-format
      elmPackages.elm-language-server
      elmPackages.elm-live
      elmPackages.elm-test
      # for AWS
      awscli2
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    direnv
    git
    tree
    ripgrep
    wget
    zip
    unzip
    # for Editor
    emacs29-nox
    neovim
    # for Dev
    gcc
    cmake
    glib
    glibc
    glibc.static
    pkgconfig
    # for iOS
    libimobiledevice
    ifuse
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # iOS
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # PostgreSQL
  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql_15;

  # MySQL
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql80;

  # Redis
  services.redis.servers."local-redis" = {
    enable = true;
    port = 6379;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
