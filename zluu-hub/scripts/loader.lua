-- ╔══════════════════════════════╗
-- ║     zluu hub · loader.lua    ║
-- ╚══════════════════════════════╝
--

local base    = "https://zluu-scripts.netlify.app/games/"
local placeId = game.PlaceId

-- ══ mapa placeId → archivo ══
-- reemplaza los 0 con el PlaceId real de cada juego
local games = {
    [2414851778] = "duels/main.lua",       -- Roblox Duels
    [142823291]  = "mm2/main.lua",          -- Murder Mystery 2
    [2753915549] = "bloxfruits/main.lua",   -- Blox Fruits
    [286090429]  = "arsenal/main.lua",      -- Arsenal
    [4894619553] = "aimblox/main.lua",      -- Aimblox
    -- agrega mas juegos aqui:
    -- [PLACEID] = "carpeta/main.lua",
}

local path = games[placeId]

if path then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(base .. path))()
    end)
    if not ok then
        warn("[zluu] error cargando script: " .. tostring(err))
    end
else
    warn("[zluu] juego no soportado | PlaceId: " .. tostring(placeId))
end
