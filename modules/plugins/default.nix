{self, ...}: {
  flake.nixosModules.plugins = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.oil
    ];

    vim = {
      binds.whichKey = {
        enable = true;
        setupOpts.preset = "helix";
      };

      filetree.neo-tree = {
        enable = false ;
      };

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };
  };
}
