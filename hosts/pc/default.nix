# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable sound.
  # Use pavucontrol or pactl to set volume
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  networking.hostName = "pc";
  networking.firewall.enable = false;
  networking.proxy = {
    default = "http://192.168.10.162:7890";
    noProxy = "127.0.0.1,localhost";
  };
}

