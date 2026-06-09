{ ... }: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
    # Bloquer tout le reste par défaut
    rejectPackets = true;
  };
}