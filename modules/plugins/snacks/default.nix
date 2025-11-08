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
      indent.enabled = true;
      dashboard.enabled = false;
      quickfile.enabled = true;
      notifier.enabled = true;
    };
  };
}
