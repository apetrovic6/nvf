# flake.nix
{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    # Optional, if you intend to follow nvf's obsidian-nvim input
    # you must also add it as a flake input.
    obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };
  };

  outputs = inputs@{ flake-parts, nvf, import-tree, ... }: {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

    imports = [
      nvf.nixosModules.default
      (import-tree ./modules)
    ];

    perSystem = {pkgs, inuputs', system, ...}: {
      packages.${system}.default = (nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [ 
         ./nvf-configuration.nix
      ];
    });
    };
  };
}
