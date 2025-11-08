{self, ...}: {
  flake.nixosModules.snacks = {
    config,
    lib,
    pkgs,
    ...
  }: {
    vim.utility.snacks-nvim.enable = true;

    vim.keymaps = [
      {
        key = "<leader><space>";
        mode = "n";
        silent = true;
        action = self.lib.lua.mkLuaCmd "snacks.picker" "smart";
        noremap = true;
        desc = "Smart Find Files";
      }
    ];

    vim.utility.snacks-nvim.setupOpts = {
      indent.enabled = true;
      dashboard.enabled = false;
      quickfile.enabled = true;
      notifier.enabled = true;
      picker = {
        enable = true;
      };
    };
  };
}
