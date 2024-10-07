local Place = game.PlaceId
local Game = game.GameId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(Place).Name

if Place == 16448761503 then
    print(GameName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/RungSea.lua"))()
elseif Place == 18688206652 then
    print(GameName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/LjulPiece2.lua"))()
elseif Place == 75972208642796 then
    print(GameName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/JoodPiece2.lua"))()
elseif Place == 86639052909924 then
    print(GameName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/VersePiece2.lua"))()
elseif Place == 10260193230 then
    print(GameName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/refs/heads/main/MemeSea.lua"))()
else
    game.Players.LocalPlayer:Kick("This game is not supported or has been removed.")
end
