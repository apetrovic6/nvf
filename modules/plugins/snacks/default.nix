{self, ...}: {
  flake.nixosModules.snacks = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.snacks-picker
    ];

    vim.utility.snacks-nvim.enable = true;

    vim.utility.snacks-nvim.setupOpts = {
      animate.enabled = true;
      debug.enabled = true;
      dim.enabled = true;
      git.enabled = true;
      gitbrowse.enabled = true;
      image.enabled = true;
      input.enabled = true;
      rename.enabled = true;
      terminal.enabled = true;
    };
  };
}
