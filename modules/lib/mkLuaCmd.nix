
{self, ...}: {
  flake.modules.lua = {
    config,
    lib,
    pkgs,
    ...
  }: {

  mkLuaCmd     = module: fn: "<CMD>lua(require '${module}').${fn}()<CR>";
  mkLuaCmdArgs = module: fn: args:
    let
      mkArgs =
        if args == null || args == [] then ""
        else "(" + lib.concatStringsSep ", " (map (x:
          if builtins.isString x then "'${x}'" else builtins.toString x
        ) args) + ")";
    in "<CMD>lua(require '${module}').${fn}" + mkArgs + "<CR>";
  mkLuaFnRaw   = module: fn: "function() require('${module}').${fn}() end";
};
}

