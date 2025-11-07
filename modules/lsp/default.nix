{inputs, ...}: {
  flake.nixosModules.lsp = {
    config,
    lib,
    pkgs,
    ...
  }: {
    vim.lsp.enable = true;
    vim.languages = {
      enableTreesitter = true;
      enableDAP = true;
      enableFormat = true;

      nix.enable = true;
      ts.enable = true;

      rust = {
        enable = true;
        crates.enable = true;
      };

      sql.enable = true;
      markdown.enable = true;
      html.enable = true;
      go.enable = true;
      lua.enable = true;
      csharp.enable = true;
      ocaml.enable = true;
      java.enable = true;
      kotlin.enable = true;
    };
  };
}
