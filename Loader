local a = 0
local Place = game.PlaceId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name
local baseURL = "https://raw.githubusercontent.com/meobeo8/elgato/a/"
local placeScripts = {
    [78681874345659] = "ErrorZone.lua",
    [86639052909924] = "VersePiece.lua",
    [89438510123061] = "AnimeShadow.lua",
    [92998083931728] = "VersePieceRaid.lua"
}
local scriptName = placeScripts[Place]

if scriptName then
    loadstring(game:HttpGet(baseURL .. scriptName))()
    a = a + 1
    if a > 2 then
        game.Players.LocalPlayer:Kick("Executed too many times")
    end
else
    game.Players.LocalPlayer:Kick("This game is not supported or has been removed")
end

spawn(function()
    while wait(1) do
        pcall(function()
            for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
                if v.Name == "Blur" then
                    v:Destroy()
                end
            end
        end)
    end
end)

for _, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable()
end
