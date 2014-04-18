require "os"
local Path = require "Macaroni.IO.Path"
local latestVersion = "0.2.2"
import("Macaroni", "Macaroni.Release", latestVersion)


sources = { "source/examples", "source/www" }
outputPath = "target"

project = context:Group("Macaroni")
                 :Project("Macaroni.Site")
                 :Version("DEV")

local lib = project:Library{
    name="lib",
    shortName = "site-examples",
    headers=pathList{ "source/examples" },
    sources=pathList{ "source/examples" },
    dependencies = { load("Macaroni", "CppStd", "2003"):Target("lib"),
                     load("Macaroni", "Boost-headers", "1.55"):Target("lib") }
}



local dir = Path.New(getWorkingDirectory())

function newPath(suffix)
    return dir:NewPathForceSlash(suffix):CreateWithCurrentAsRoot();
end



function buildExamples()
    local porg = plugins:Get("Porg")
    local cpp = plugins:Get("Cpp")

    porg:Run("Generate", {target=lib});

    result, msg = pcall(function()
        cpp:Run("Generate", { projectVersion=project,
                              path=filePath(outputPath)})
    end)
    if not result then
        output:ErrorLine(msg)
        error(msg)
    end
end

function buildWebSite()
    local site = plugins:Get("Site")
    site:Run("build", {
        project=project,
        outputPath=newPath("target"),
        sources={newPath("source/www")},
        output=output,
        context=context
    });
end

function generate()
end

built = false

function build()
    if built then return end
    built = true
    buildExamples()
    buildWebSite()
end

function install()
    build()
end
