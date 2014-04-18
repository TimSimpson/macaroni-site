import("Macaroni", "ProjectTemplates", "1")
require "SimpleProject"

SimpleProject{
  group="Macaroni.Examples",
  project="Calculator",
  version="DEV",
  libShortName = "Calculator",
  src="src",
  target="target",
  dependencies = {
    load("Macaroni", "CppStd", "2003"):Target("lib"),
  },
};
