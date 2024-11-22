local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/TurtleUI.lua"))()
local plr = game.Players.LocalPlayer

-- Create the main window
local Window = library:Window("check your console")

-- Configuration management section
Window:Label("Manager Config", Color3.fromRGB(127, 143, 166))

-- Dropdown for game selection
local SelectConfig
local dropdown = Window:Dropdown("Select Game", {"Rock Fruit", "Error Zone", "Anime Shadow"}, function(value)
    SelectConfig = value
end)

-- Button to delete configuration file
Window:Button("Delete Config", function()
    if SelectConfig then
        local MainFile = "ELGATO HUB/" .. SelectConfig .. "/" .. plr.Name .. ".json"
        if isfile(MainFile) then
            delfile(MainFile)
            game.Players.LocalPlayer:Kick("Deleted successfully")
        else
            warn("Config file not found")
        end
    else
        warn("Please select a game first.")
    end
end)

-- Button to destroy the UI
Window:Button("Destroy UI", function()
    library:Destroy()
end)

-- Miscellaneous options section
Window:Label("Misc Options", Color3.fromRGB(127, 143, 166))

-- Button for FPS boost
Window:Button("Boost FPS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/elgato/a/BoostFPS.lua"))()
end)

-- Button to hop servers
Window:Button("Hop SV", function()
    local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    local PlaceId, JobId = game.PlaceId, game.JobId
    local HttpService = cloneref(game:GetService("HttpService"))
    local TeleportService = cloneref(game:GetService("TeleportService"))

    if httprequest then
        local servers = {}
        local req = httprequest({
            Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)
        })
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for _, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        else
            warn("Serverhop couldn't find a server.")
        end
    else
        warn("Incompatible exploit. Your exploit does not support this command (missing request).")
    end
end)

-- Button to rejoin the current server
Window:Button("Rejoin", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

-- Button to load Infinity Yield
Window:Button("Infinity Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
