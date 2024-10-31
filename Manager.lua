local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/TurtleUI.lua"))()
local plr = game.Players.LocalPlayer

local Window = library:Window("check your console")

-- Manager Config Section (Label)
Window:Label("Manager Config", Color3.fromRGB(127, 143, 166))

-- Game Selection Dropdown
local SelectConfig
local dropdown = Window:Dropdown("Select Game", {"Verse Piece", "Error Zone", "Second Piece"}, function(va)
    SelectConfig = va
end)

-- Delete Config Button
Window:Button("Delete Config", function()
    if SelectConfig then
        local MainFile = "ELGATO HUB/".. SelectConfig.. "/".. plr.Name.. ".json"
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

-- Boost FPS Button
Window:Button("Destroy UI", function()
    library:Destroy()
end)

-- Misc Options Section (Label)
Window:Label("Misc Options", Color3.fromRGB(127, 143, 166))

-- Boost FPS Button
Window:Button("Boost FPS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/elgato/a/BoostFPS.lua"))()
end)

-- Hop Server Button
Window:Button("Hop SV", function()
    httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    PlaceId, JobId = game.PlaceId, game.JobId
    HttpService = cloneref(game:GetService("HttpService"))
    TeleportService = cloneref(game:GetService("TeleportService"))

    if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
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
            return warn("Serverhop couldn't find a server.")
        end
    else
        warn("Incompatible exploit. Your exploit does not support this command (missing request).")
    end
end)

-- Rejoin Button
Window:Button("Rejoin", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

-- Infinity Yield Button
Window:Button("Infinity Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
