local Place = game.PlaceId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name

local baseURL = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/"

local placeScripts = {
    [16448761503] = "RungSea.lua",
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
