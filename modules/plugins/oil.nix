{inputs, ...}: {
  flake.nixosModules.oil = {
    config,
    lib,
    pkgs,
    ...
  }: {
    vim.utility.oil-nvim = {
        enable = true;
        setup-upts = {
          
        };
    };
  };
}
