# flake.nix
{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, nvf, import-tree, ... }: 
    flake-parts.lib.mkFlake {inherit inputs;} {
    
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

    perSystem = {pkgs, inputs', system, ...}: {
      packages.${system}.default = (nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [ 
         ./nvf-configuration.nix
      ];
    }).neovim;
    };
  };
}
