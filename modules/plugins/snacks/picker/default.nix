{self, ...}: {
  flake.nixosModules.snacks-picker = {
    config,
    lib,
    pkgs,
    ...
  }: {
    vim.utility.snacks-nvim.setupOpts.picker = {
      enable =
        true;
    };

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
  };
}
