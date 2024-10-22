local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local plr = game.Players.LocalPlayer

local Tab = Library:NewWindow("elgato Manager")

local Section1 = Tab:NewSection("Manager Config")

local SelectConfig

Section1:CreateDropdown("Select Game", {"Verse Piece", "Meme Sea", "Error Zone", "Second Piece"}, 1, function(va)
    SelectConfig = va
end)

Section1:CreateButton("Delete Config", function()
    if SelectConfig then
        local MainFile = "ELGATO HUB/".. SelectConfig.. "/".. plr.Name.. ".json"
        if isfile(MainFile) then
            delfile(MainFile)
            game.Players.LocalPlayer:Kick("Deleted successfully")
        else
            print("config file not found")
        end
    else
        print("Please select a game first.")
    end
end)

local Section2 = Tab:NewSection("Misc Options")

Section2:CreateButton("Boost FPS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/elgato/a/BoostFPS.lua"))()
end)

Section2:CreateButton("Hop SV", function()
    httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    PlaceId, JobId = game.PlaceId, game.JobId
    HttpService = cloneref(game:GetService("HttpService"))
    TeleportService = cloneref(game:GetService("TeleportService"))  -- Add this line to define TeleportService

    if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        else
            return Notify("Serverhop Couldn't find a server.")
        end
    else
        warn("Incompatible Exploit Your exploit does not support this command (missing request)")
    end
end)

Section2:CreateButton("Rejoin", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

Section2:CreateButton("Infinity Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
