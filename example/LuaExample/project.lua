import("Macaroni", "ProjectTemplates", "1")
require "SimpleProject"


local luaGlue = plugins:Get("LuaGlue");


SimpleProject{
  group="Macaroni.Examples",
  project="Calculator",
  version="DEV",
  libShortName = "CalculatorLua",
  src="src",
  target="target",
  dependencies = {
    load("Macaroni", "Boost-headers", "1.55"):Target("lib"),
    load("Macaroni", "CppStd", "2003"):Target("lib"),
    load("Macaroni", "Lua", "5.2.3"):Target("lib"),
  },
  preGenerate = function(outputPath)
    luaGlue:Run("Generate", {target=lib, outputPath=outputPath})
  end,
};
