import("Macaroni", "ProjectTemplates", "1")
require "SimpleProject"

SimpleProject{
  group="Macaroni.Examples",
  project="TicTacToe",
  version="DEV",
  libShortName = "TicTacToeLib",
  src="src",
  target="target",
  dependencies = {
    load("Macaroni", "Boost-headers", "1.55"):Target("lib"),
    load("Macaroni", "CppStd", "2003"):Target("lib"),
  },
};
