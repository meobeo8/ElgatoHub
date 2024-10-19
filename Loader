local a = 0
a = a + 1
wait(1)

if a == 1 or a == 2 then
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
        loadstring(game:HttpGet(baseURL .. scriptName))()
    else
        game.Players.LocalPlayer:Kick("This game is not supported or has been removed")
    end
else
    game.Players.LocalPlayer:Kick("Need rejoin if you want to execute again")
end
