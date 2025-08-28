local mp = require "mp"
local basename_pattern = "([^/]+)%.glsl$"
local names = {}

local function basename(path)
    return path:match(basename_pattern)
end

local function show_shaders()
    local shaders = mp.get_property_native("glsl-shaders")
    if not shaders or #shaders == 0 then
        mp.osd_message("No shaders loaded")
        return
    end
    
    for i = 1, #names do
        names[i] = nil
    end
    
    for i, shader in ipairs(shaders) do
        names[i] = basename(shader) or shader
    end
    
    mp.osd_message("Shaders: " .. table.concat(names, "; "))
end

mp.add_key_binding(nil, "lshaders", show_shaders)