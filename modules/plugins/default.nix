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
        setupOpts.preset = "modern";
      };

      filetree.neo-tree = {
        enable = true;
      };

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };
  };
}
