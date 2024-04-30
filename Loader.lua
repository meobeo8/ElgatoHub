local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/TurtleUI.lua"))()

local OwO = library:Window("Mewing Hub")

OwO:Label("Linkvertise/2Check/24Hours", Color3.fromRGB(127, 143, 166))

OwO:Label("LootLinks/5Check/12Hours", Color3.fromRGB(127, 143, 166))

OwO:Button("Linkvertise", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/MewingHub/main/LV.lua"))()
   library:Destroy()
end)

OwO:Button("LootLinks", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/MewingHub/main/LL.lua"))()
   library:Destroy()
end)
