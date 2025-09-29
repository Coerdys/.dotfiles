Default NIX_PATH:
  export NIX_PATH="nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"

To use the custom PATH:
  export NIX_PATH="nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/home/corby/.dotfiles/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"

Both configuration.nix and hardware-configuration.nix must be in dotfiles!

