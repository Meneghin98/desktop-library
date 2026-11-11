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

-- Patches applied to Steam's own JS files when they are loaded.
-- #{{self}} expands to this plugin's frontend exports (see frontend/index.tsx).
local function get_patches()
    return {
        -- Library dropdown in the top navigation bar (component titled "Library Supernav").
        -- Its items are a static array: Home, Collections, Separator, Downloads.
        -- We spread the frontend's `libraryMenuItems` right after "Collections".
        {
            find = [[\{name:"#Menu_Collections",route:\w+\.\w+\.Library\.AllCollections\(\)\}]],
            file = [[sp\.js]],
            transforms = {
                {
                    match = [[(\{name:"#Menu_Collections",route:\w+\.\w+\.Library\.AllCollections\(\)\})]],
                    replace = [[\1,...(#{{self}}?.libraryMenuItems??[])]],
                }
            }
        },
        -- Library inner router (the library page component, with the games list on the left).
        -- Its routes are a static <Switch>: Home, App, Collection, AllCollections, then an
        -- "Unknown Route" fallback. We insert our route right before AllCollections, wrapped
        -- in the same container the other library pages use. Captures:
        --   \1 whole AllCollections route prefix, \2 jsx runtime module, \3 route component,
        --   \4 page wrapper component.
        -- The path must match DESKTOP_ROUTE in frontend/index.tsx.
        {
            find = [[\(0,\w+\.jsx\)\(\w+\.\w+,\{path:\w+\.\w+\.Library\.AllCollections\(\),children:\(0,\w+\.jsx\)\(\w+,]],
            file = [[sp\.js]],
            transforms = {
                {
                    match = [[(\(0,(\w+)\.jsx\)\((\w+\.\w+),\{path:\w+\.\w+\.Library\.AllCollections\(\),children:\(0,\w+\.jsx\)\((\w+),)]],
                    replace = [[(0,\2.jsx)(\3,{path:"/library/desktop",children:(0,\2.jsx)(\4,{children:(0,\2.jsx)(#{{self}}?.LibraryDesktopView??(()=>null),{})})}),\1]],
                }
            }
        }
    }
end

return {
    on_load = on_load,
    on_unload = on_unload,
    on_frontend_loaded = on_frontend_loaded,
    patches = get_patches(),
}
