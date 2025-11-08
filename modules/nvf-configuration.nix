{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.default = {
    config,
    lib,
    pkgs,
    ...
  }: let
    lua = inputs.self.lib.lua;
  in {
    imports = [
      self.nixosModules.lsp
      self.nixosModules.plugins
    ];

    vim = {
      theme = {
        enable = true;
        name = "nord";
        style = "dark";
      };

      options = {
        relativenumber = true;
      };

      keymaps = [
        {
          key = "<C-a>";
          mode = "n";
          silent = true;
          action = "<C-w><C-h>";
          noremap = true;
          desc = "Move focus to the left window";
        }

        {
          key = "<C-c>";
          mode = "n";
          silent = true;
          action = "<C-w><C-l>";
          noremap = true;
          desc = "Move focus to the right window";
        }

        {
          key = "<C-e>";
          mode = "n";
          silent = true;
          action = "<C-w><C-j>";
          noremap = true;
          desc = "Move focus to the lower window";
        }

        {
          key = "<C-i>";
          mode = "n";
          silent = true;
          action = "<C-w><C-k>";
          noremap = true;
          desc = "Move focus to the upper window";
        }

        {
          key = "<leader>Y";
          mode = "n";
          silent = true;
          action = "gg\"+yG";
          noremap = true;
          desc = "Yank file";
        }

        {
          key = "E";
          mode = "v";
          silent = true;
          action = ":m '>+1<cr>gv=gv";
          noremap = true;
          desc = "Move line up";
        }

        {
          key = "I";
          mode = "v";
          silent = true;
          action = ":m '<-2<cr>gv=gv";
          noremap = true;
          desc = "Move line down";
        }

        {
          key = "<leader>_";
          mode = "n";
          silent = true;
          action = "<C-w>s";
          noremap = true;
          desc = "Split window horizontally";
        }

        {
          key = "<leader>-";
          mode = "n";
          silent = true;
          action = "<C-w>v";
          noremap = true;
          desc = "Split window vertically";
        }
      ];

      statusline.lualine.enable = true;
      telescope.enable = false;
      # fzf-lua = {
      #     enable = true;
      #     profile = "";
      # };

      autocomplete.nvim-cmp.enable = true;
    };
  };
}
