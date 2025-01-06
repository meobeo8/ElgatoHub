repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local hmr = plr.Character:FindFirstChild("HumanoidRootPart")
local PlayerGUI = plr:FindFirstChildOfClass("PlayerGui")

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local OwO = library:Window("bao ♥️ dat")

local OwO1 = library:Window("elgato ♥️ appealscat")

OwO1:Label("Get Fruit", Color3.fromRGB(127, 143, 166))

local FruitNames = {}

for _, v in pairs(game:GetService("ReplicatedStorage").AllAnims.NotToPllAnims:GetChildren()) do
    if string.find(v.Name, "Fruit") then
        table.insert(FruitNames, v.Name)
    end
end

local dropdown = OwO1:Dropdown("Select Fruit", FruitNames, function(name)
    local args = {
        [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
        [2] = "AddToolToBackpackKKK",
        [3] = {
            [1] = name,
            [2] = plr.Backpack,
            [3] = true,
            [4] = true
        }
    }

    game:GetService("ReplicatedStorage").ALLREMBINDS:WaitForChild("MainRemoteEvent"):FireServer(unpack(args))
end)

OwO1:Button("Coppy Discord", function()
    setclipboard("https://discord.gg/BUZwDbH47z")
    print("Discord link copied to clipboard!")
end)

OwO:Label("Auto Chest", Color3.fromRGB(127, 143, 166))

OwO:Toggle("Auto Chest", false, function(bool)
    _G.AutoChest = bool
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoChest then
                for _, v in ipairs(Workspace.World.Chests:GetChildren()) do
                    if v:FindFirstChild("TouchInterest") then
                        firetouchinterest(plr.Character.HumanoidRootPart, v, 0)
                        wait(1)
                        firetouchinterest(plr.Character.HumanoidRootPart, v, 1)
                    end
                end
            end
        end)
    end
end)

OwO:Label("Farm Mastery", Color3.fromRGB(127, 143, 166))

OwO:Slider("Custom Mastery", 0, 100000, 1000, function(value)
    _G.Mas = value
end)

OwO:Button("Add Mastery", function()
    local args = {
        [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
        [2] = "GiveMasteryEXPTO__Smthh",
        [3] = {
            [1] = plr,
            [2] = plr.PlayerStats.UsingBloxFruit.Value,
            [3] = _G.Mas,
            [4] = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ALLREMBINDS"):WaitForChild("MainRemoteEvent"):FireServer(unpack(args))
end)
