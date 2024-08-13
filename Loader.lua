if game.PlaceId == 6897167394 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/FruitSea.lua"))()
elseif game.PlaceId == 10260193230 then

spawn(function()
    while wait() do
        pcall(function()
            if game.Players.LocalPlayer.PlayerGui.LoadingGui.Enabled == true then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.PlayBackground.Play.Activated)) do
                    v.Function()
                end
            end
        end)
    end
end)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/MemeSea.lua"))()
elseif game.PlaceId == 17610616912 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/AnimePowerEvolutionSimulator.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ScriptLinhTinh/main/Scare.lua"))()
end
