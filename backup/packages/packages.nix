{ pkgs, ...}: {
  # System wide packages (installed as root)
  environment.systemPackages = with pkgs; [
	
	# Terminal Emulator
	alacritty
	
	# Terminal Editor
	vim
	neovim

	# GUI Code Editor
	vscodium

	# Terminal Utilities
	wget
	curl
	jq
	dnsutils
	ripgrep
	htop

	# Zsh
	zsh
	oh-my-zsh
	zsh-autosuggestions
	nix-zsh-completions

	# SMB/CIFS mounting
	cifs-utils

	# Code version control
	git

	# Terminal Candy
	lsd
	nerdfonts

	# Gaming
	vulkan-extension-layer
	vulkan-headers
	vulkan-tools
	steam
	wine
	lutris
	
	# Virtualisation
	virt-manager

	# Browser
	firefox
	
	# Security
	opensnitch

	# Gnome Extensions
	gnomeExtensions.dash-to-panel
	gnomeExtensions.screenshot-tool
  ];

  # If using gnome desktop manager, exclude these from installation
  environment.gnome.excludePackages = with pkgs; [
	gnome.cheese
	gnome-photos
	gnome.gnome-music
	gnome.gedit
	epiphany
	evince
	gnome.gnome-characters
	gnome.totem
	gnome.tali
	gnome.iagno
	gnome.hitori
	gnome.atomix
	gnome.gnome-weather
	gnome.gnome-screenshot
	gnome.gnome-contacts
	gnome.gnome-maps
	gnome.geary
	gnome-tour
	gnome-connections
  ];

  # Use the nerdfont "Hack" system wide (this also gives icons in terminal)
  fonts.fonts = with pkgs; [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];

}

