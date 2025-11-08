{lib ? import <nixpkgs/lib> {}}: let
  mkArgs = args:
    if args == null || args == []
    then ""
    else
      "("
      + lib.concatStringsSep ", " (map (
          x:
            if builtins.isString x
            then "'${x}'"
            else builtins.toString x
        )
        args)
      + ")";
in {
  # For modules like: require('oil').open()
  mkLuaCmd = module: fn: "<cmd>lua(require '${module}').${fn}()<cr>";
  mkLuaCmdArgs = module: fn: args:
    "<cmd>lua(require '${module}').${fn}" + mkArgs args + "<cr>";
  mkLuaFnRaw = module: fn: "function() require('${module}').${fn}() end";

  # For globals like: Snacks.picker.smart()
  mkLuaGlobalCmd = funPath: "<cmd>lua " + funPath + "()<cr>";
  mkLuaGlobalFnRaw = funPath: "function() " + funPath + "() end";
  mkLuaGlobalArgs = funPath: args:
    "<cmd>lua " + funPath + "(" + (lib.concatStringsSep ", " args) + ")<cr>";
}
