{self, ...}: {
  flake.nixosModules.snacks = {
    config,
    lib,
    pkgs,
    ...
  }: let
    lua = self.lib.lua;
  in {
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
      scope.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = true;
        lazygit.enabled = true;
      # dashboard.enabled = true;
    };

    vim.keymaps = [
      # General
      {
        key = "<leader>bD";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Delete all buffers";
        action = lua.mkLuaCmd "snacks" "bufdelete.all";
      }

      {
        key = "<leader>bo";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Delete other buffers";
        action = lua.mkLuaCmd "snacks" "bufdelete.other";
      }
    ];
  };
}
