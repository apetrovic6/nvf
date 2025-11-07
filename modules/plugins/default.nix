{inputs, ...}: {
  flake.nixosModules.plugins = {
    config,
    lib,
    pkgs,
    ...
  }: {
    whichKey = {
      enable = true;
      preset = "modern";
    };

    neo-tree = {
        enable = true;
        enable_modified_markers = true;
        enable_git_status = true;
      };
  };
}
