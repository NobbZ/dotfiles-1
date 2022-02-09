{
  networking.hostName = "kirin-nix";

  # networking.wireless.enable = true;

  networking.useDHCP = false;

  networking.firewall = {
	allowedTCPPorts = [ 22 ];
  };
}
