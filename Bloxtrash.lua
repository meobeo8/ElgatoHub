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
