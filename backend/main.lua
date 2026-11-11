local logger     = require("logger")
local millennium = require("millennium")

-- Register the RPC functions callable from the frontend
require("rpc_functions")

-- Called when the plugin backend is loaded.
local function on_load()
    logger:info("Loaded with Millennium version " .. millennium.version())
    millennium.ready()
end

-- Called when the plugin is unloaded (plugin disabled or Steam shutting down).
-- NOTE: not called if Steam crashes or is force closed, so don't rely on it for critical cleanup.
local function on_unload()
    logger:info("Plugin unloaded")
end

-- Called when the Steam UI has fully loaded; from here on frontend methods can be called.
local function on_frontend_loaded()
    logger:info("Frontend loaded")
end

return {
    on_load = on_load,
    on_unload = on_unload,
    on_frontend_loaded = on_frontend_loaded,
}
