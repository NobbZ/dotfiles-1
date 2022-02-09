{ pkgs, ...}: {
    users = {
	defaultUserShell = pkgs.zsh;
	mutableUsers = false;
	users = {
	  kirin = {
	    uid = 1000;
	    hashedPassword = "$6$0PD3hk827ivtjHE9$p9Xqs5/BD98aa0YKbN2mbp06b5w83vr2HdqmWS7sMcn36zrGh6Kinc5XxihZvPEAGmm95N5LOUnfnWwiNQou91";
	    isNormalUser = true;
	    extraGroups = [ "wheel" ];
	   };
	};
    };
}
