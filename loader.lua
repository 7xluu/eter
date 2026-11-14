-- zluu hub · loader.lua
local base    = "https://eternoz.netlify.app/games/"
local placeId = tostring(game.PlaceId)

local games = {
    ["135856908115931"] = "duels/main.lua",
    ["142823291"]       = "mm2/main.lua",
    ["2753915549"]      = "bloxfruits/main.lua",
    ["286090429"]       = "arsenal/main.lua",
    ["4894619553"]      = "aimblox/main.lua",
}

-- notificacion en pantalla
local function notify(title, msg, duration)
    local ok = pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title    = title,
            Text     = msg,
            Duration = duration or 5,
        })
    end)
    if not ok then
        warn("[zluu] " .. title .. ": " .. msg)
    end
end

-- sumar +1 al contador
local function trackExecution()
    pcall(function()
        game:GetService("HttpService"):GetAsync(
            "https://api.countapi.xyz/hit/eternoz-hub/executions"
        )
    end)
end

local path = games[placeId]

if path then
    trackExecution()
    notify("zluu hub", "Cargando script...", 3)
    local ok, err = pcall(function()
        loadstring(game:HttpGet(base .. path))()
    end)
    if ok then
        notify("zluu hub", "Script cargado ✓", 4)
    else
        notify("zluu hub", "Error al cargar: " .. tostring(err), 6)
        warn("[zluu] error: " .. tostring(err))
    end
else
    notify("zluu hub", "Juego no soportado aún.", 5)
    warn("[zluu] juego no soportado | PlaceId: " .. placeId)
end