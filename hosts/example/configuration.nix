{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./disk.nix
    ../../modules/base.nix
    ../../modules/ssh.nix
    ../../modules/firewall.nix
    ../../modules/locale.nix
    # Décommenter selon les besoins :
    # ../../modules/web/apache.nix
    # ../../modules/web/php.nix
    # ../../modules/web/mariadb.nix
  ];

  networking.hostName = "example";

  # Utilisateur admin — remplacer la clé SSH
  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQQ/1fknVpcy9YOWkH5ndbT717clDynXWGlu7LrAg+Q kbf\cschmitt@PC307"
    ];
  };

  system.stateVersion = "26.05";
}