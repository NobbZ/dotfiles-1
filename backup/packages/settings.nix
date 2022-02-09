{

  programs.mtr.enable = true;

  programs.gnupg.agent = {
	enable = true;
	enableSSHSupport = true;
  };

  programs.zsh = {
	enable = true;
	autosuggestions.enable = true;
	syntaxHighlighting.enable = true;
	ohMyZsh = {
	  enable = true;
	  plugins = [ 
	    "git" 
	    "sudo" 
	    "zsh-autosuggestions" 
	    "zsh-syntax-highlighting" 
	    "zsh-completions"
	];
	theme = "risto";
	};
	
	shellAliases = {
	  nano = "vim";
	  ls = "lsd";
	  python = "python3";
	  update = "sudo nix-channel --update";
	  rebuild = "sudo nixos-rebuild switch";
	};
  };
}
