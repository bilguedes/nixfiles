{ config, pkgs, ...}:
 
{
  home.username = "mine";
  home.homeDirectory = "/home/mine";
  home.stateVersion = "25.11";

  # programs.bash = {
  #   enable = true;
  #   shellAliases = {
  #     btw = "i use nixOS, btw";
  #     ff = "fastfetch";
  #     neofetch = "fastfetch -c neofetch";
  #     config = "sudo nvim /etc/nixos/configuration.nix";
  #     home = "sudo nvim /etc/nixos/home.nix";
  #     flake = "sudo nvim /etc/nixos/flake.nix";
  #     update = "cd /etc/nixos; sudo nix flake update; sudo nixos-rebuild switch; cd ~";
  #     rebuild = "sudo nixos-rebuild switch";
  #     boot = "sudo nixos-rebuild boot";
  #   };
  #   initExtra = ''
  #     export PS1='\[\e[38;5;112m\]\u@\h\[\e[0m\] \[\e[38;5;69m\]\W\[\e[0m\] \\$ '   
  #     '';
  # };

  programs.nushell = {
    enable = true;
    extraConfig = ''
     $env.config = {
        show_banner: false,
     }
    '';
    shellAliases = {
      btw = "i use nixOS, btw";
      ff = "fastfetch";
      neofetch = "fastfetch -c neofetch";
      config = "sudo -E nvim /etc/nixos/configuration.nix";
      home = "sudo -E nvim /etc/nixos/home.nix";
      flake = "sudo -E nvim /etc/nixos/flake.nix";
      rebuild = "nh os switch /etc/nixos";
      boot = "nh os boot /etc/nixos";
    };
  };

  home.packages = with pkgs; [
   fastfetch
   pfetch
   btop
   unimatrix
   hollywood
  ];
}
