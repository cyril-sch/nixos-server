{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim git curl wget htop rsync
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Pas de sudo mot de passe pour wheel
  security.sudo.wheelNeedsPassword = false;

  system.autoUpgrade = {
    enable = false; # activer en prod si voulu
    flake = "github:cyril-sch/nixos-server-template#<hostname>";
    allowReboot = false;
  };
}