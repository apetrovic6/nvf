{self, ...}: {
  flake.nixosModules.default = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.lsp
      self.nixosModules.plugins
    ];

    vim = {
      theme = {
        enable = true;
        name = "gruvbox";
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
      ];


      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };
  };
}
