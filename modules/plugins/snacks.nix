{self, ...}: {
  flake.nixosModules.snacks = {
    config,
    lib,
    pkgs,
    ...
 }: {
        
      vim.utility.snacks-nvim.enable = true;

};
}
