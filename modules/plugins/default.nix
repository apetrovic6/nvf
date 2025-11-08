{self, ...}: {
  flake.nixosModules.plugins = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.oil
      self.nixosModules.snacks
    ];

    vim = {
      binds.whichKey = {
        enable = true;
        setupOpts.preset = "helix";
      };

      filetree.neo-tree = {
        enable = false;
      };

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      statusline.lualine.enable = true;
      telescope.enable = false;
      # fzf-lua = {
      #     enable = true;
      #     profile = "";
      # };

      utility.snacks-nvim.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}
