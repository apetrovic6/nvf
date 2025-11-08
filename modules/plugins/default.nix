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

        register = {
          "<leader>f" = "Find";
          "<leader>g" = "Git";
          "<leader>s" = "Search";
          "<leader>b" = "Buffers";
        };
      };

      filetree.neo-tree = {
        enable = false;
      };

      # terminal.toggleterm = {
      #   enable = true;
      #   lazygit.enable = true;
      # };

      statusline.lualine.enable = true;
      telescope.enable = false;
      # fzf-lua = {
      #     enable = true;
      #     profile = "";
      # };

      utility.snacks-nvim.enable = true;
      autocomplete.nvim-cmp.enable = true;
      tabline.nvimBufferline.enable = true;
      notes.todo-comments.enable = true;

      utility.motion.flash-nvim.enable = true;
      ui.noice.enable = true;
      ui.colorizer = {
        enable = true;
        setupOpts = {
        };
      };
    };
  };
}
