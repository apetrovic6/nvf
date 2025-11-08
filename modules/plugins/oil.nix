{inputs, ...}: {
  flake.nixosModules.oil = {
    config,
    lib,
    pkgs,
    ...
  }: 
let

in
    {
    vim.utility.oil-nvim = {
      enable = true;
      setupOpts = {
        columns = ["icon"];
        watch_for_changes = true;
        default_file_explorer = true;
          use_default_keymaps = true;
      };
    };

    vim.keymaps = [
      {
        key = "-";
        mode = "n";
        silent = true;
        action = "<CMD>Oil --float<CR>";
        noremap = true;
        desc = "Open floating parent directory";
      }
      
    ];
  };
}
