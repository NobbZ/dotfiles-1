{ config, lib, pkgs, ...}: {

    programs.home-manager.enable = true;
    home.username = "kirin";
    home.homeDirectory = "/home/kirin";
    home.stateVersion = "21.11";
    home.packages = with pkgs; [
       # Terminal Utilities
        wget
        curl
        jq
        dnsutils
        ripgrep
        htop
        xcp
        p7zip

        # Zsh
        zsh
        oh-my-zsh
        zsh-autosuggestions
        nix-zsh-completions

        # SMB/CIFS mounting
        cifs-utils

        # Code version control
        git

        # Code editors
        vscodium

        # Terminal Candy
        lsd
        nerdfonts
        neofetch

        # Gaming
        vulkan-extension-layer
        vulkan-headers
        vulkan-tools
        steam
        wine
        lutris

        # Media
        mpv
        spotify

        # Messengers
        discord
        signal-desktop

        # Office
        libreoffice-fresh
        pandoc
        
        # Virtualisation
        virt-manager
        
        # Security
        opensnitch 

        # Fonts
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

    # =========================== #
    # Per package configurations  #
    # =========================== #

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        history.extended = true;
        shellAliases = with pkgs; {
        ls = "lsd";
        cp = "xcp";
        python = "python3";
        update = "sudo nix-channel --update";
        rebuild = "sudo nixos-rebuild switch";
        test-flake = "sudo nixos-rebuild test --flake .";
        rebuild-flake = "sudo nixos-rebuild switch --flake .";
        };
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "sudo" "zsh-autosuggestions" "zsh-syntax-highlighting" "zsh-completions" ];
            theme = "risto";
        };
    };

    programs.tmux.enable = true;

    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };

    programs.git = {
        enable = true;
        userName = "nephalemsec";
        userEmail = "nephalem.sec@protonmail.com";
    };
}