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


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/TurtleUI.lua"))()

local OwO = library:Window("bao ♥️ dat")

OwO:Toggle("Auto Chest", false, function(bool)
    _G.AutoChest = bool
    SaveSettings()
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoChest then
                for _, v in ipairs(Workspace.World.Chests:GetChildren()) do
                    if v:FindFirstChild("TouchInterest") then
                        firetouchinterest(plr.Character.HumanoidRootPart, v, 0)
                        wait()
                        firetouchinterest(plr.Character.HumanoidRootPart, v, 1)
                    end
                end
            end
        end)
    end
end)

OwO:Toggle("Auto Farm Mastery", false, function(bool)
    _G.FarmMas = bool
    SaveSettings()
end)

spawn(function()
    while wait(1) do
        pcall(function()
            if _G.FarmMas then
                local args = {
                    [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
                    [2] = "GiveMasteryEXPTO__Smthh",
                    [3] = {
                        [1] = plr,
                        [2] = plr.PlayerStats.UsingBloxFruit.Value,
                        [3] = 9e9,
                        [4] = true
                    }
                }

                game:GetService("ReplicatedStorage"):WaitForChild("ALLREMBINDS"):WaitForChild("MainRemoteEvent"):FireServer(unpack(args))
            end
        end)
    end
end)

OwO:Toggle("Kill Other Players", false, function(bool)
    _G.KillAll = bool
    SaveSettings()
end)

spawn(function()
    while wait(1) do
        pcall(function()
            if _G.KillAll then
                for _, v in ipairs(workspace.Characters:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if v.Name ~= plr.Name and not string.find(v.Name, "dummey") and v.Team ~= plr.Team then
                            local maxHealth = v.Humanoid.MaxHealth
                            for i = 1, 2 do
                                local args = {
                                    [1] = "EMMFOSS__!ZCNSJNXCSDWQSANBX",
                                    [2] = "Main_DamgeR___",
                                    [3] = {
                                        [1] = v,
                                        [2] = {
                                            ["Using"] = _G.Settings.Main["NameWeapon"],
                                            ["Damge"] = maxHealth,
                                            ["FromPlayer"] = plr
                                        }
                                    }
                                }

                                game:GetService("ReplicatedStorage"):WaitForChild("ALLREMBINDS"):WaitForChild("MainRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end)
    end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Text = "Elgato Hub"
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.Parent = frame

local description = Instance.new("TextLabel")
description.Text = "Pls join my Discord"
description.Size = UDim2.new(1, 0, 0.4, 0)
description.Position = UDim2.new(0, 0, 0.4, 0)
description.BackgroundTransparency = 1
description.TextScaled = true
description.TextColor3 = Color3.new(1, 1, 1)
description.Parent = frame

local button = Instance.new("TextButton")
button.Text = "Yes"
button.Size = UDim2.new(0.4, 0, 0.2, 0)
button.Position = UDim2.new(0.3, 0, 0.8, 0)
button.BackgroundColor3 = Color3.new(0.3, 0.6, 1)
button.TextScaled = true
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = frame

button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/BUZwDbH47z")
    print("Discord link copied to clipboard!")
    screenGui:Destroy()
end)
