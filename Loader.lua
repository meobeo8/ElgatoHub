game.StarterGui:SetCore("SendNotification", {
    Title = "elgato key system",
    Text = "Wait a minute",
    Icon = "rbxassetid://137811068969636",
    Duration = 5
})

local Place = game.PlaceId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name

local baseURL = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/"

local placeScripts = {
    [78681874345659] = "ErrorZone.lua",
    [10260193230] = "MemeSea.lua",
    [18901165922] = "PetGo.lua",
    [86639052909924] = "VersePiece2.lua"
}

local scriptName = placeScripts[Place]
if scriptName then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/LogPrivate.lua"))()
    loadstring(game:HttpGet(baseURL .. scriptName))()
else
    game.Players.LocalPlayer:Kick("This game is not supported or has been removed.")
end
