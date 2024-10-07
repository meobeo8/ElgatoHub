local Place = game.PlaceId
local Game = game.GameId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name

local scripts = {
    [16448761503] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/RungSea.lua",
    [18688206652] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/LjulPiece2.lua",
    [18968803452] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/MuyongPiece.lua",
    [75972208642796] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/JoodPiece2.lua",
    [86639052909924] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/VersePiece2.lua",
    [10260193230] = "https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/MemeSea.lua"
}

local scriptURL = scripts[Place] or scripts[Game]

if scriptURL then
    print(GameName)
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("This game is not supported or has been removed.")
end
