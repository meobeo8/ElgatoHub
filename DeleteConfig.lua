local MainFile = "ELGATO HUB/".. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.. "/".. game.Players.LocalPlayer.Name.. ".json"
if isfile(MainFile) then
    delfile(MainFile)
end
