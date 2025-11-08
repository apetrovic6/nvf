{...}: {
  flake.nixosModules.lsp = {
    config,
    lib,
    pkgs,
    ...
  }: {
    vim.languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;

      bash.enable = true;
      clang.enable = true;

      csharp.enable = true;

      fsharp.enable = true;
      ocaml.enable = true;
      haskell.enable = true;
      elixir.enable = true;

      html.enable = true;
      css.enable = true;
      tailwind.enable = true;
      ts.enable = true;
      sql.enable = true;

      nix.enable = true;
      rust.enable = true;
      markdown.enable = true;
      go.enable = true;
      lua.enable = true;

      helm.enable = true;
      yaml.enable = true;

      java.enable = true;
      kotlin.enable = true;
    };
  };
}
