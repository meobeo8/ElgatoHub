repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui

if game.Players.LocalPlayer.PlayerGui.LoadingGui.Enabled == true then
    for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.PlayBackground.Play.Activated)) do
        v.Function()
    end
end

local plr = game.Players.LocalPlayer
local pli = plr.Items.ItemStorage
local hmr = plr.Character:FindFirstChild("HumanoidRootPart")

function Notify(va, va1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Elgato Hub",
        Text = va,
        Icon = "",
        Duration = va1,
        Button1 = "Okay",
    })
end

function Notify(va)
Notify1("Elgato Hub Notification", va, 5)
end


local function load1()

_G.Settings = {
    Main = {
        ["AutoFarm"] = false,
        ["NameMon"] = "N/A",
        ["FarmNear"] = false,
        ["AutoLava"] = false,
        ["AutoPopCat"] = false,
        ["AutoRaceV2"] = false,
    },
    Boss = {
        ["RaidFarm"] = false,
        ["SelectBoss"] = "Lord Sus",
        ["SelectMonOrb"] = "N/A",
        ["UpdateInfo"] = false,
        ["UpdateInfoBoss"] = false,
        ["AutoMemeBeast"] = false,
        ["FarmBoss"] = false,
    },
    Player = {
        ["AutoBounty"] = false,
        ["AutoSafe"] = false,
        ["AutoRejoin"] = false,
        ["UpdateInfo"] = false,
        ["FarmPlayer"] = false,
        ["SelectPlayer1"] = "N/A",
    },
    Shop = {
        ["StoreFruitAll"] = false,
        ["UnStoreFruitAll"] = false,
        ["DropFruitAll"] = false,
        ["DropFruit"] = false,
        ["UnStoreFruit"] = false,
        ["SelectM"] = "Gem",
        ["TPFruit"] = false,
        ["RollHaki"] = false,
        ["RamdomFruit"] = false,
        ["Uncommon"] = false,
        ["Common"] = false,
        ["Rare"] = false,
        ["Legendary"] = false,
    },
    Teleport = {
        ["SelectMap"] = "N/A",
        ["AutoMelee"] = false,
        ["AutoDefense"] = false,
        ["AutoSword"] = false,
        ["AutoPower"] = false,
    },
    Config = {
        ["RDWP"] = false,
        ["Melee"] = false,
        ["Sword"] = false,
        ["Power"] = false,
        ["DeleteSkill"] = false,
        ["BusoHaki"] = true,
        ["KenHaki"] = true,
        ["AutoSkill"] = true,
        ["AutoRace"] = true,
        ["BringMob"] = true,
        ["Z"] = false,
        ["X"] = false,
        ["C"] = false,
        ["V"] = false,
        ["SelectWeapon"] = "Melee",
        ["SelectMethod"] = "Upper",
        ["DistanceMon"] = 9,
    },
}

local NG = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

function LoadSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("ELGATO HUB") then
            makefolder("ELGATO HUB")
        end
        if not isfolder("ELGATO HUB/".. NG.. "/") then
            makefolder("ELGATO HUB/".. NG.. "/")
        end
        if not isfile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json") then
            writefile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json"))
            for i,v in pairs(Decode) do
                _G.Settings[i] = v
            end
        end
    else
        return warn("Status : Undetected Executor")
    end
end


function SaveSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json") then
            LoadSettings()
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json"))
            local Array = {}
            for i,v in pairs(_G.Settings) do
                Array[i] = v
            end
            writefile("ELGATO HUB/".. NG.. "/".. plr.Name.. ".json", game:GetService("HttpService"):JSONEncode(Array))
        end
    else
        return warn("Status : Undetected Executor")
    end
end

LoadSettings()

function CheckLv()
    MyLevel = plr.PlayerData.Level.Value
    if MyLevel == 1 or MyLevel <= 49 then
        Mon = "Floppa"
        Quest = "Floppa Quest 1"

    elseif MyLevel == 50 or MyLevel <= 99 then
        Mon = "Golden Floppa"
        Quest = "Floppa Quest 2"

    elseif MyLevel == 100 or MyLevel <= 149 then
        Mon = "Big Floppa"
        Quest = "Floppa Quest 3"

    elseif MyLevel == 150 or MyLevel <= 199 then
        Mon = "Doge"
        Quest = "Floppa Quest 4"

    elseif MyLevel == 200 or MyLevel <= 249 then
        Mon = "Cheems"
        Quest = "Floppa Quest 5"

    elseif MyLevel == 250 or MyLevel <= 299 then
        Mon = "Walter Dog"
        Quest = "Floppa Quest 6"

    elseif MyLevel == 300 or MyLevel <= 349 then
        Mon = "Staring Fish"
        Quest = "Floppa Quest 7"

    elseif MyLevel == 350 or MyLevel <= 399 then
        Mon = "Hamster"
        Quest = "Floppa Quest 8"

    elseif MyLevel == 400 or MyLevel <= 449 then
        Mon = "Snow Tree"
        Quest = "Floppa Quest 9"

    elseif MyLevel == 450 or MyLevel <= 499 then
        Mon = "The Rock"
        Quest = "Floppa Quest 10"

    elseif MyLevel == 500 or MyLevel <= 549 then
        Mon = "Banana Cat"
        Quest = "Floppa Quest 11"

    elseif MyLevel == 550 or MyLevel <= 599 then
        Mon = "Sus Face"
        Quest = "Floppa Quest 12"

    elseif MyLevel == 600 or MyLevel <= 649 then
        Mon = "Egg Dog"
        Quest = "Floppa Quest 13"

    elseif MyLevel == 650 or MyLevel <= 699 then
        Mon = "Popcat"
        Quest = "Floppa Quest 14"

    elseif MyLevel == 700 or MyLevel <= 749 then
        Mon = "Gorilla King"
        Quest = "Floppa Quest 15"

    elseif MyLevel == 750 or MyLevel <= 799 then
        Mon = "Smiling Cat"
        Quest = "Floppa Quest 16"

    elseif MyLevel == 800 or MyLevel <= 849 then
        Mon = "Killerfish"
        Quest = "Floppa Quest 17"

    elseif MyLevel == 850 or MyLevel <= 899 then
        Mon = "Bingus"
        Quest = "Floppa Quest 18"

    elseif MyLevel == 900 or MyLevel <= 949 then
        Mon = "Obamid"
        Quest = "Floppa Quest 19"

    elseif MyLevel == 950 or MyLevel <= 999 then
        Mon = "Floppy"
        Quest = "Floppa Quest 20"

    elseif MyLevel == 1000 or MyLevel <= 1049 then
        Mon = "Creepy Head"
        Quest = "Floppa Quest 21"

    elseif MyLevel == 1050 or MyLevel <= 1149 then
        Mon = "Scary Skull"
        Quest = "Floppa Quest 22"

    elseif MyLevel == 1150 or MyLevel <= 1199 then
        Mon = "Pink Absorber"
        Quest = "Floppa Quest 24"

    elseif MyLevel == 1200 or MyLevel <= 1249 then
        Mon = "Troll Face"
        Quest = "Floppa Quest 25"

    elseif MyLevel == 1250 or MyLevel <= 1299 then
        Mon = "Uncanny Cat"
        Quest = "Floppa Quest 26"

    elseif MyLevel == 1300 or MyLevel <= 1349 then
        Mon = "Quandale Dingle"
        Quest = "Floppa Quest 27"

    elseif MyLevel == 1350 or MyLevel <= 1449 then
        Mon = "Moai"
        Quest = "Floppa Quest 28"

    elseif MyLevel == 1450 or MyLevel <= 1499 then
        Mon = "Red Sus"
        Quest = "Floppa Quest 30"

    elseif MyLevel == 1500 or MyLevel <= 1699 then
        Mon = "Sus Duck"
        Quest = "Floppa Quest 31"

    elseif MyLevel == 1700 or MyLevel <= 1749 then
        Mon = "Sigma Man"
        Quest = "Floppa Quest 33"

    elseif MyLevel == 1750 or MyLevel <= 1799 then
        Mon = "Dancing Cat"
        Quest = "Floppa Quest 34"

    elseif MyLevel == 1800 or MyLevel <= 1849 then
        Mon = "Toothless Dragon"
        Quest = "Floppa Quest 35"

    elseif MyLevel == 1850 or MyLevel <= 1899 then
        Mon = "Manly Nugget"
        Quest = "Floppa Quest 36"

    elseif MyLevel == 1900 or MyLevel <= 1949 then
        Mon = "Huh Cat"
        Quest = "Floppa Quest 37"

    elseif MyLevel == 1950 or MyLevel <= 1999 then
        Mon = "Mystical Tree"
        Quest = "Floppa Quest 38"

    elseif MyLevel == 2000 or MyLevel <= 2049 then
        Mon = "Old Man"
        Quest = "Floppa Quest 39"

    elseif MyLevel == 2050 or MyLevel <= 2099 then
        Mon = "Nyan Cat"
        Quest = "Floppa Quest 40"

    elseif MyLevel == 2100 or MyLevel <= 2149 then
        Mon = "Baller"
        Quest = "Floppa Quest 41"

    elseif MyLevel == 2150 or MyLevel <= 2199 then
        Mon = "Slicer"
        Quest = "Floppa Quest 42"

    elseif MyLevel == 2200 or MyLevel <= 2249 then
        Mon = "Rick Roller"
        Quest = "Floppa Quest 43"

    elseif MyLevel == 2250 or MyLevel <= 2299 then
        Mon = "Gigachad"
        Quest = "Floppa Quest 44"

    elseif MyLevel == 2300 or MyLevel <= 2349 then
        Mon = "MrBeast"
        Quest = "Floppa Quest 45"

    elseif MyLevel >= 2350 then
        Mon = "Handsome Man"
        Quest = "Floppa Quest 46"
    end
end

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Settings.Main["AutoFarm"] or _G.Settings.Boss["FarmBoss"] or _G.Settings.Main["AutoLava"] or _G.Settings.Main["AutoRaceV2"] or _G.Settings.Boss["RaidFarm"] or _G.Settings.Main["FarmMon"] or _G.Settings.Player["FarmPlayer"] or _G.FarmBoss or _G.FarmOrb or _G.FarmOrb1 or _G.Settings.Player["AutoBounty"] then
                local character = plr.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    if not humanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = humanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            else
                _G.AutoSkill = false
                _G.AutoBounty = false
            end
        end)
    end)
end)


--taopart
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.Settings.Main["AutoFarm"] or _G.Settings.Boss["FarmBoss"] or _G.Settings.Main["AutoLava"] or _G.Settings.Main["AutoRaceV2"] or _G.Settings.Boss["RaidFarm"] or _G.Settings.Main["FarmMon"] or _G.Settings.Player["FarmPlayer"] or _G.FarmBoss or _G.FarmOrb or _G.FarmOrb1 or _G.Settings.Player["AutoBounty"] then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

--stoptween
function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        local character = game:GetService("Players").LocalPlayer.Character
        _G.StopTween = false
        _G.Clip = false
    end
end

--method farm
spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Config["SelectMethod"] == "Behind" then
                MethodFarm = CFrame.new(0,0,_G.Settings.Config["DistanceMon"])
            elseif _G.Settings.Config["SelectMethod"] == "Below" then
                MethodFarm = CFrame.new(0,-_G.Settings.Config["DistanceMon"],0)  * CFrame.Angles(math.rad(90),0,0)
            elseif _G.Settings.Config["SelectMethod"] == "Upper" then
                MethodFarm = CFrame.new(0,_G.Settings.Config["DistanceMon"],0)  * CFrame.Angles(math.rad(-90),0,0)
            else
                MethodFarm = CFrame.new(0,0,0)
            end
        end)
    end
end)

function SkillDown(va)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, va, false, game)
end


function SkillUp(va)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, va, false, game)
end

local function useSkill(key)
    SkillDown(key)
    wait(.1)
    SkillUp(key)
end

spawn(function()
    while wait() do
        local playerData = plr.PlayerData
        local CacLo1 = _G.Settings.Config["SelectWeapon"]
        if CacLo1 == "Melee" then
            WeaponFarm = playerData.CombatEquip.Value
            WeaponSkillFarm = "FightingStyle_"
        elseif CacLo1 == "Sword" then
            WeaponFarm = playerData.SwordEquip.Value
            WeaponSkillFarm = "Weapon_"
        elseif CacLo1 == "Power" then
            WeaponFarm = playerData.PowerEquip.Value
            WeaponSkillFarm = "Power_"
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local playerData = plr.PlayerData
            WeaponRamdom = "playerData.SwordEquip.Value"  -- Set your default weapon or value here
            WeaponSkill = "Weapon_"    -- Set your default skill or value here

            if RDWP == 1 then
                if _G.Settings.Config["Melee"] then
                    WeaponRamdom = playerData.CombatEquip.Value
                    WeaponSkill = "FightingStyle_"
                else
                    WeaponRamdom = WeaponFarm
                end
                wait(2)
                RDWP = RDWP + 1
            elseif RDWP == 2 then
                if _G.Settings.Config["Sword"] then
                    WeaponRamdom = playerData.SwordEquip.Value
                    WeaponSkill = "Weapon_"
                else
                    WeaponRamdom = WeaponFarm
                end
                wait(2)
                RDWP = RDWP + 1
            elseif RDWP == 3 then
                if _G.Settings.Config["Power"] then
                    WeaponRamdom = playerData.PowerEquip.Value
                    WeaponSkill = "Power_"
                else
                    WeaponRamdom = WeaponFarm
                end
                wait(2)
                RDWP = RDWP + 1
            else
                RDWP = 1
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.Settings.Config["RDWP"] then
            Weapon1 = WeaponSkill
        else
            Weapon1 = WeaponSkillFarm
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoSkill then
            if Weapon1 == "FightingStyle_" or Weapon1 == "Power_" then
                -- Use Z, X, C, V skills
                if _G.Settings.Config["Z"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "Z") then
                        useSkill("Z")
                    end
                end
                if _G.Settings.Config["X"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "X") then
                        useSkill("X")
                    end
                end
                if _G.Settings.Config["C"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "C") then
                        useSkill("C")
                    end
                end
                if _G.Settings.Config["V"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "V") then
                        useSkill("V")
                    end
                end
            elseif Weapon1 == "Weapon_" then
                -- Use only Z and X skills
                if _G.Settings.Config["Z"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "Z") then
                        useSkill("Z")
                    end
                end
                if _G.Settings.Config["X"] then
                    if not plr.Cooldown:FindFirstChild(Weapon1 .. "X") then
                        useSkill("X")
                    end
                end
            end
        end
    end
end)

function EpWp()
    if _G.Settings.Config["RDWP"] then
        EquipWeapon(WeaponRamdom)
    else
        EquipWeapon(WeaponFarm)
    end
end

--eqwp
function UnEquipWeapon(Weapon)
    if hmr then
        local char = plr.Character
        if char:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            char[Weapon].Parent = plr.Backpack
            wait(0.1)
            _G.NotAutoEquip = false
        end
    end
end

function EquipWeapon(ToolSe)
    if hmr then
        if not _G.NotAutoEquip then
            local backpack = plr.Backpack
            if backpack:FindFirstChild(ToolSe) then
                local tool = backpack:FindFirstChild(ToolSe)
                plr.Character.Humanoid:EquipTool(tool)
            end
        end
    end
end

function TP(Pos)
    if plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
        plr.Character.HumanoidRootPart.CFrame = Pos
    end
end

local PopCatClick = game:GetService("Workspace").Island.FloppaIsland.Popcat_Clickable.Part

spawn(function()
    while wait() do
        if _G.Settings.Main["AutoPopCat"] then
            pcall(function()
                fireclickdetector(PopCatClick.ClickDetector)
            end)
        end
    end
end)

function Notify(va)
Notify1("Elgato Hub Notification", va, 5)
end

function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1e4, 1e4))
    if _G.Settings.Config["AutoSkill"] then
        _G.AutoSkill = true
    else
        _G.AutoSkill = false
    end
end

function TPCheck(Pos)
    local Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
    if Distance > 200 then
        if plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
            plr.Character.HumanoidRootPart.CFrame = Pos
        end
    end
end

function XoaQ()
    local ohTable2 = {
        ["QuestSlot"] = "QuestSlot1"
    }
    game:GetService("ReplicatedStorage").OtherEvent.QuestEvents.Quest:FireServer("Abandon_Quest", ohTable2)
end

function ClickNPC(NameNPC)
    local QuestGui = plr.PlayerGui.QuestGui.Holder.QuestSlot1
    if QuestGui.Visible == true and plr.QuestFolder.QuestSlot1.QuestGiver.Value ~= NameNPC then
        XoaQ()
    end
    if plr.QuestFolder.QuestSlot1.QuestGiver.Value == "None" then
        for i, v in pairs(game:GetService("Workspace").NPCs.Quests_Npc[NameNPC]:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                task.wait(.1)
                fireproximityprompt(v)
            end
        end
    end
end

httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
PlaceId, JobId = game.PlaceId, game.JobId
HttpService = cloneref(game:GetService("HttpService"))
TeleportService = cloneref(game:GetService("TeleportService"))  -- Add this line to define TeleportService

function serverhop()
    Notify("Hop after 3 seconds")
    wait(2.5)
    if httprequest then
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
        else
            return Notify("Serverhop Couldn't find a server.")
        end
    else
        Notify("Incompatible Exploit Your exploit does not support this command (missing request)")
    end
end


spawn(function()
    while wait() do
        pcall(function()
            local PLGUI = plr.PlayerGui.MainGui.PlayerName.Text
            if PLGUI == plr.Name.. " • Lv. " ..plr.PlayerData.Level.Value.. " (Max)" or PLGUI == plr.Name.. " • Lv. " ..plr.PlayerData.Level.Value then
                plr.PlayerGui.MainGui.PlayerName.Text = "Elgato • Lv. " ..plr.PlayerData.Level.Value
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] then
                for _, v in pairs(game.Workspace.Monster:GetDescendants()) do
                    if v:IsA('Part') and v:IsA('MeshPart') then
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                    end
                end
            end
        end)
    end
end)

function Auto_Kill(Monster, BringPos)
    for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
        if v.Name == Monster and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            BringPos[v.Name] = v.HumanoidRootPart.CFrame
            TP(v.HumanoidRootPart.CFrame * MethodFarm)
            EpWp()
            Click()
        end
    end
end

function Bring_Mob(Monster, BringPos)
    for _, v in pairs(game.Workspace.Monster:GetChildren()) do
        if BringPos[v.Name] and v.Name == Monster then
            v.HumanoidRootPart.CFrame = BringPos[v.Name]
            v.HumanoidRootPart.CanCollide = false
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(plr, "SimulationRadius", math.huge)
            v.HumanoidRootPart.Size = Vector3.new(30, 30, 30)
            v.Humanoid.JumpPower = 0
            v.Humanoid.WalkSpeed = 0
        end
    end
end

local AbilityP = plr.Ability

--auto buso
spawn(function()
    while wait() do
        if _G.Settings.Config["BusoHaki"] and AbilityP.Aura.Value == true then
            pcall(function()
                if not plr.Character.AuraColor_Folder:FindFirstChild("RightHand_AuraColor") then
                    if hmr then
                        game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Ability:InvokeServer("Aura")
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(2) do
        if _G.Settings.Config["KenHaki"] and AbilityP.Instinct.Value == true then
            if hmr then
                if not plr.Character:FindFirstChild("Highlight_Player")  then
                    if not plr.Cooldown:FindFirstChild("InstinctCD") then
                        SkillDown("E")
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    if plr.Character:FindFirstChild("Stun") then
        plr.Character.Stun.Changed:connect(function()
            pcall(function()
                if plr.Character:FindFirstChild("Stun") then
                    plr.Character.Stun.Value = 0
                end
            end)
        end)
    end
end)

function RollHaki()
local args = {
    [1] = "Reroll_Color",
    [2] = "Halfed Sorcerer"
}

game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Boss["RaidFarm"] then
                for _, v in pairs(game.Workspace.Raids:GetChildren()) do
                    if v.Joiners:FindFirstChild(plr.Name) then
                        TPCheck(v.Spawn_Location.CFrame)
                        PosRaid_Spawn = v.Spawn_Location.CFrame
                    end
                end
            end
        end)
    end
end)

local PosRaid = {}

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Boss["RaidFarm"] then
                local RaidGui = plr.PlayerGui.RaidGui.RaidFrame
                if RaidGui.Visible then
                    if string.find(RaidGui.Wave.Text, "Intermission") then
                        game:GetService("ReplicatedStorage").OtherEvent.MiscEvents.StartRaid:FireServer("Start")
                    end
                    for _, v in pairs(game.Workspace.Monster:GetChildren()) do
                        if v:GetAttribute("Raid_Enemy") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            local Distance_Raid = (v.HumanoidRootPart.Position - PosRaid_Spawn.Position).Magnitude                  
                            if Distance_Raid <= 300 then
                                local HealthMin = plr.Character.Humanoid.MaxHealth * 35 / 100
                                repeat task.wait()
                                    PosRaid = v.HumanoidRootPart.CFrame
                                    if plr.Character.Humanoid.Health <= HealthMin then
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0))
                                        _G.AutoSkill = false
                                    else
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        EpWp()
                                        Click()
                                    end
                                until not _G.Settings.Boss["RaidFarm"] or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    TP(CFrame.new(Vector3.new(2749, -58, -4524)))
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] and _G.Settings.Boss["RaidFarm"] then
                for _, v in pairs(game.Workspace.Monster:GetChildren()) do
                    if PosRaid and v:GetAttribute("Raid_Enemy") then
                        v.HumanoidRootPart.CFrame = PosRaid
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(plr, "SimulationRadius",  math.huge)
                        v.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.Settings.Config["DeleteSkill"] then
            pcall(function()
                for _, v in ipairs(game.Workspace.Skills:GetDescendants()) do
                    if v:IsA('Part') or v:IsA('MeshPart') then
                        v:Destroy()
                    end
                end
            end)
        end
    end
end)

local PosRace = {}

spawn(function()
    while wait() do
        if _G.Settings.Main["AutoRaceV2"] then
            TPCheck(CFrame.new(Vector3.new(-2622, -78, -2004)))
            pcall(function()
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if plr.QuestFolder.QuestSlot1.Target.Value == "Sogga" then
                        repeat task.wait()
                            Auto_Kill("Sogga", PosRace)
                        until not _G.Settings.Main["AutoRaceV2"] or not v.Parent or v.Humanoid.Health <= 0
                    else
                        TP(game.Workspace.Location.QuestLocaion["Floppa Quest [Race]"].CFrame)
                        ClickNPC("Dancing Banana Quest")
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] and _G.Settings.Main["AutoRaceV2"] then
                Bring_Mob("Sogga", PosRace)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.Settings.Main["AutoLava"] then
            TPCheck(CFrame.new(Vector3.new(793, -31, -442)))
            pcall(function()
                if plr.QuestFolder.QuestSlot1.Target.Value == "Lava Floppa" then
                    TP(CFrame.new(Vector3.new(793, -31, -442)))
                    for i, v in pairs(game:GetService("Workspace").Island.FloppaIsland["Lava Floppa"]:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then
                        repeat task.wait()
                            fireproximityprompt(v)
                            until not _G.Settings.Main["AutoPopCat"] or not v.ProximityPrompt
                        end
                    end
                else
                    TP(CFrame.new(Vector3.new(756,-31,-424)))
                    ClickNPC("Cool Floppa Quest")
                end
            end)
        end
    end
end)

local PosNear = {}

spawn(function()
    while wait() do
        if _G.Settings.Main["FarmMon"] then
            pcall(function()
                TPCheck(game.Workspace.Location.Enemy_Location[_G.Settings.Main["NameMon"]].CFrame)
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    repeat task.wait()
                        Auto_Kill(_G.Settings.Main["NameMon"], PosNear)
                    until not _G.Settings.Main["FarmMon"] or not v.Parent or v.Humanoid.Health <= 0
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] and _G.Settings.Main["FarmMon"] then
                Bring_Mob(_G.Settings.Main["NameMon"], PosNear)
            end
        end)
    end
end)


local PosFarm = {}

spawn(function()
    while wait() do
        if _G.Settings.Main["AutoFarm"] then
            CheckLv()
            TPCheck(game.Workspace.Location.QuestLocaion[Quest].CFrame)
            pcall(function()
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if plr.QuestFolder.QuestSlot1.QuestGiver.Value == Quest then
                        repeat task.wait()
                            Auto_Kill(Mon, PosFarm)
                        until not _G.Settings.Main["AutoFarm"] or not v.Parent or v.Humanoid.Health <= 0
                    else
                        ClickNPC(Quest)
                        TP(game.Workspace.Location.QuestLocaion[Quest].CFrame)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] and _G.Settings.Main["AutoFarm"] then
                CheckLv()
                Bring_Mob(Mon, PosFarm)
            end
        end)
    end
end)

function Summon_Boss()
    if _G.Settings.Boss["SelectBoss"] == "Lord Sus" then
        fireproximityprompt(game.Workspace.Island.ForgottenIsland.Summon3.Summon.SummonPrompt)
    elseif _G.Settings.Boss["SelectBoss"] == "Evil Noob" then
        fireproximityprompt(game.Workspace.Island.MoaiIsland.Summon2.Summon.SummonPrompt)
    elseif _G.Settings.Boss["SelectBoss"] == "Giant Pumpkin" then
        fireproximityprompt(game.Workspace.Island.PumpkinIsland.Summon1.Summon.SummonPrompt)
    end
end

function CheckBoss()
    local SelectBosss = _G.Settings.Boss["SelectBoss"]
    if SelectBosss == "Lord Sus" then
        NameQuest1 = "Floppa Quest 32"
        OrbQuest = "Floppa Quest 31"
        CFrameQuest = CFrame.new(Vector3.new(6564,-95,4794))
        CFrameSum = CFrame.new(Vector3.new(6644,-90,4811))
        NameItem = "Sussy Orb"
        NameOrb1 = "Sus Duck"

    elseif SelectBosss == "Evil Noob" then
        NameQuest1 = "Floppa Quest 29"
        OrbQuest = "Floppa Quest 28"
        CFrameQuest = CFrame.new(Vector3.new(2891,-52,4208))
        CFrameSum = CFrame.new(Vector3.new(-2357,-76,3180))
        NameItem = "Noob Head"
        NameOrb1 = "Moai"

    elseif SelectBosss == "Giant Pumpkin" then
        NameQuest1 = "Floppa Quest 23"
        OrbQuest = "Floppa Quest 22"
        CFrameQuest = CFrame.new(Vector3.new(-1164,-93,1462))
        CFrameSum = CFrame.new(Vector3.new(-1181,-88,1462))
        NameItem = "Flame Orb"
        NameOrb1 = "Scary Skull"
    end
end

-- Kiểm tra và cập nhật trạng thái FindFirstChild_Boss
spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Boss["FarmBoss"] then
                FindFirstChild_Boss = false
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if v.Name == _G.Settings.Boss["SelectBoss"] and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        FindFirstChild_Boss = true
                        break -- Thoát vòng lặp sớm nếu tìm thấy boss
                    end
                end
            end
        end)
    end
end)

-- Farm boss nếu tìm thấy
spawn(function()
    while wait() do
        if _G.Settings.Boss["FarmBoss"] and FindFirstChild_Boss then
            pcall(function()
                CheckBoss()
                TPCheck(CFrameQuest)
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if v.Name == _G.Settings.Boss["SelectBoss"] and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if plr.QuestFolder.QuestSlot1.QuestGiver.Value == NameQuest1 then
                            local HealthMin = plr.Character.Humanoid.MaxHealth * 35 / 100
                            repeat task.wait()
                                if plr.Character.Humanoid.Health <= HealthMin then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0)) -- TP lên cao nếu health thấp
                                    _G.AutoSkill = false
                                else
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm) -- Farm boss
                                    EpWp()
                                    Click()
                                end
                            until not _G.Settings.Boss["FarmBoss"] or not v.Parent or not v.HumanoidRootPart or v.Humanoid.Health <= 0
                        else
                            TP(CFrameQuest)
                            ClickNPC(NameQuest1)
                        end
                    end
                end
            end)
        end
    end
end)

-- Triệu hồi boss nếu không tìm thấy boss và item >= 1
spawn(function()
    while wait() do
        if _G.Settings.Boss["FarmBoss"] and not FindFirstChild_Boss and pli[NameItem].Value >= 1 then
            pcall(function()
                CheckBoss()
                TPCheck(CFrameQuest)
                if not FindFirstChild_Boss then
                    TP(CFrameSum)
                    Summon_Boss() -- Triệu hồi boss
                end
            end)
        end
    end
end)

-- Farm quái để lấy orb nếu không tìm thấy boss và item < 1
local PosOrb = {}
spawn(function()
    while wait() do
        if _G.Settings.Boss["FarmBoss"] and not FindFirstChild_Boss and pli[NameItem].Value < 1 then
            CheckBoss()
            TPCheck(game.Workspace.Location.Enemy_Location[NameOrb1].CFrame)
            pcall(function()
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if v.Name == NameOrb1 and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            Auto_Kill(NameOrb1, PosOrb) -- Farm quái để lấy orb
                        until not _G.Settings.Boss["FarmBoss"] or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- Bring mob nếu setting "BringMob" = true
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Settings.Config["BringMob"] and _G.Settings.Boss["FarmBoss"] and not FindFirstChild_Boss then
                CheckBoss()
                Bring_Mob(NameOrb1, PosOrb) -- Bring mob nếu farm orb
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if _G.Settings.Boss["AutoMemeBeast"] then
            pcall(function()
                for _, v in ipairs(game.Workspace.Monster:GetChildren()) do
                    if v.Name == "Meme Beast" and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            Auto_Kill("Meme Beast", PosMemeBeast)
                        until not _G.Settings.Boss["AutoMemeBeast"] or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Player["FarmPlayer"] then
                local v22 = game.Players[_G.Settings.Player["SelectPlayer1"]]
                if v22.Character:FindFirstChild("HumanoidRootPart") and v22.Character.Humanoid.Health > 0 then
                    repeat task.wait()
                        local HealthMin = plr.Character.Humanoid.MaxHealth * 35/100
                        if plr.Character.Humanoid.Health <= HealthMin then
                            _G.AutoSkill = false
                            TP(v22.Character.HumanoidRootPart.CFrame * CFrame.new(0,600,0))
                        else
                            TP(v22.Character.HumanoidRootPart.CFrame * MethodFarm)
                            EpWp()
                            Click()
                        end
                    until not _G.Settings.Player["FarmPlayer"] or not v22.Character or v22.Character.Humanoid.Health <= 0
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Player["AutoBounty"] and plr.PlayerData.LastTeam.Value == "Floppa" then
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        if v.Character:GetAttribute("Safezone") == false then
                            if not v.Character:FindFirstChild("Party_Mark") then
                                if not v:GetAttribute("PvpDisabled") or v:GetAttribute("PvpDisabled") == nil then
                                    NameBounty = v.Name
                                    if PlayerInRaid == false then
                                        NameTarget = v.Name
                                        local HealthMin = plr.Character.Humanoid.MaxHealth * 40 / 100
                                        repeat task.wait()
                                            if plr.Character.Humanoid.Health <= HealthMin then
                                                _G.AutoSkill = false
                                                TP(v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                            else
                                                TP(v.Character.HumanoidRootPart.CFrame * MethodFarm)
                                                EpWp()
                                                Click()
                                            end
                                        until not _G.Settings.Player["AutoBounty"] or not v.Parent or v.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            local playerInRaid = false  
            for _, v in pairs(game.Workspace.Raids:GetDescendants()) do
                if v:FindFirstChild(NameBounty) then
                    playerInRaid = true
                end
            end
            PlayerInRaid = playerInRaid 
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Player["AutoBounty"] and plr.PlayerData.LastTeam.Value == "Cheems" then
                for _, v in pairs(game.Players:GetChildren()) do
                    if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                        if v.Character:GetAttribute("Safezone") == false then
                            if not v.Character:FindFirstChild("Party_Mark") then
                                if not v:GetAttribute("PvpDisabled") or v:GetAttribute("PvpDisabled") == nil then
                                    NameBounty = v.Name
                                    if plr.PlayerData.LastTeam.Value ~= v.PlayerData.LastTeam.Value then
                                        if PlayerInRaid == false then
                                            NameTarget = v.Name
                                            local HealthMin = plr.Character.Humanoid.MaxHealth * 40 / 100
                                            repeat task.wait()
                                                if plr.Character.Humanoid.Health <= HealthMin then
                                                    _G.AutoSkill = false
                                                    TP(v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                                else
                                                    TP(v.Character.HumanoidRootPart.CFrame * MethodFarm)
                                                    EpWp()
                                                    Click()
                                                end
                                            until not _G.Settings.Player["AutoBounty"] or not v.Parent or v.Character.Humanoid.Health <= 0
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(6) do
        pcall(function()
            if _G.Settings.Player["AutoBounty"] then
                _G.AutoSkill = false
                if _G.Settings.Player["AutoSafe"] then
                    TP(CFrame.new(Vector3.new(666, 7259, -781)))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(10) do
        pcall(function()
            if _G.Settings.Player["AutoSafe"] and _G.Settings.Player["AutoBounty"] then
                if plr.PlayerGui.Menu.SafeFrame.InCombat.Visible == false then
                    plr.Character.Humanoid.Health = 0
                end
            end
        end)
    end
end)

-- Auto store / auto-rejoin functionality
spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Player["AutoRejoin"] and _G.Settings.Player["AutoBounty"] then
                wait(60)
                _G.AutoHop = true
            end
        end)
    end
end)

-- Auto store / auto-rejoin functionality
spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Player["AutoRejoin"] and _G.Settings.Player["AutoBounty"] and _G.AutoHop then
                if plr.PlayerGui.Menu.SafeFrame.InCombat.Visible == false then
                    serverhop()
                end
            end
        end)
    end
end)

function RollHaki()
local args = {
    [1] = "Reroll_Color",
    [2] = "Halfed Sorcerer"
}

game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end

function UnF(va)
    local ohTable2 = {
        ["Action"] = "Unstore",
        ["SelectedItem"] = va
    }

    game:GetService("ReplicatedStorage").OtherEvent.ItemEvents.UpdateInventory:InvokeServer("Power", ohTable2)
end


function BuyFruit(va)
    local args = {
        [1] = "Random_Power",
        [2] = {
            ["Type"] = "Decuple",
            ["NPCName"] = "Floppa Gacha",
            ["GachaType"] = va
        }
    }

    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end

function DropFruit(va)
    EquipWeapon(va)
    local args = {
        [1] = "Eatable_Power",
        [2] = {
            ["Action"] = "Drop",
            ["Tool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(va)
        }
    }

    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end

function StoreFruit(va)
    local args = {
        [1] = "Eatable_Power",
        [2] = {
            ["Action"] = "Store",
            ["Tool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(va)
        }
    }
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end

local FruitPowers = {}

-- Uncommon
FruitPowers.Uncommon = {"Spin Power", "Barrier Power", "Diamond Power"}

-- Common
FruitPowers.Common = {"Bomb Power", "Invisible Power", "Fly Power"}

-- Rare
FruitPowers.Rare = {"Water Power", "Gold Power", "Snow Power", "Paw Power", "Flame Power", "Moai Power", "Sand Power", "Ice Power"}

-- Legendary
FruitPowers.Legendary = {"Floppa Power", "Dark Power", "Dog Power", "Dough Power"}

local FruitPowersValue = {}

spawn(function()
    while wait(1) do
        FruitPowersValue = {}
            if _G.Settings.Shop["Uncommon"] then
                for i, v in pairs(FruitPowers.Uncommon) do
                    table.insert(FruitPowersValue, v)
                end
            end
            if _G.Settings.Shop["Rare"] then
                for i, v in pairs(FruitPowers.Rare) do
                    table.insert(FruitPowersValue, v)
                end
            end
            if _G.Settings.Shop["Common"] then
                for i, v in pairs(FruitPowers.Common) do
                    table.insert(FruitPowersValue, v)
                end
            end
            if _G.Settings.Shop["Legendary"] then
                for i, v in pairs(FruitPowers.Legendary) do
                    table.insert(FruitPowersValue, v)
            end
        end
    end
end)

-- auto store
spawn(function()
    while wait() do
        pcall(function()
            for i, v in pairs(plr.Backpack:GetChildren()) do
                if v:FindFirstChild("Script") then
                    if _G.Settings.Shop["StoreFruitAll"] then
                        for i = 1, 5 do
                            EquipWeapon(v.Name)
                            StoreFruit(v.Name)
                        end
                    elseif _G.Settings.Shop["StoreFruit"] then
                        if table.find(FruitPowersValue, v.Name) then
                            EquipWeapon(v.Name)
                            StoreFruit(v.Name)
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto store
spawn(function()
    while wait() do
        pcall(function()
            for i, v in pairs(plr.Backpack:GetChildren()) do
                if v:FindFirstChild("Script") then
                    if _G.Settings.Shop["DropFruitAll"] then
                        for j = 1, 3 do
                            EquipWeapon(v.Name)
                            DropFruit(v.Name)
                        end
                    elseif _G.Settings.Shop["DropFruit"] then
                        if table.find(FruitPowersValue, v.Name) then
                            EquipWeapon(v.Name)
                            DropFruit(v.Name)
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto store
spawn(function()
    while wait() do
        pcall(function()
            for i, v in pairs(plr.Items.Power:GetChildren()) do
                if v.Value >= 1 then
                    if _G.Settings.Shop["UnStoreFruitAll"] then
                            UnF(v.Name)
                    elseif _G.Settings.Shop["UnStoreFruit"] then
                        if table.find(FruitPowersValue, v.Name) then
                            UnF(v.Name)
                        end
                    end
                end
            end
        end)
    end
end)

--fruit
spawn(function()
    while wait() do
        if _G.Settings.Shop["TPFruit"] then
            pcall(function()
                for i, v in pairs(game.Workspace.Dropped_Items:GetDescendants()) do
                    if v:FindFirstChild("Handle") then
                        if table.find(FruitPowersValue, v.Name) then
                            TP(v.Handle.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(1) do
        pcall(function()
            if _G.Settings.Shop["RamdomFruit"] then
                if plr.PlayerGui.GachaGui.Enabled == false then
                    BuyFruit(_G.Settings.Shop["SelectM"])
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Shop["RollHaki"] then
                if not plr.Items.AuraColor.Spectrum.Value == true then
                    if plr.PlayerData.Gem.Value >= 50 then
                        RollHaki()
                    end
                end
            end
        end)
    end
end)

local ValueS = plr.PlayerData

function Stat(va)
    local ohTable1 = {
        ["Target"] = va,
        ["Action"] = "UpgradeStats",
        ["Amount"] = 1
    }
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.StatsFunction:InvokeServer(ohTable1)
end

spawn(function()
    while wait() do
        if ValueS.SkillPoint.Value > 1 then
            if _G.Settings.Teleport["AutoMelee"] then
                Stat("MeleeLevel")
            end
            if _G.Settings.Teleport["AutoDefense"] then
                Stat("DefenseLevel")
            end
            if _G.Settings.Teleport["AutoSword"] then
                Stat("SwordLevel")
            end
            if _G.Settings.Teleport["AutoPower"] then
                Stat("MemePowerLevel")
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Settings.Config["AutoRace"] then
            if plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
                local healthMin = plr.Character.Humanoid.MaxHealth * 0.7
                if plr.Character.Humanoid.Health <= healthMin then
                    if not plr.Cooldown:FindFirstChild("RaceSkillCD") then
                        if AbilityP.RabbitAwaken.Value or AbilityP.FishAwaken.Value or AbilityP.BirdAwaken.Value then
                            game:GetService("ReplicatedStorage").OtherEvent.SkillEvents.Movement:FireServer("RaceSkill")
                        end
                    end
                end
            end
        end
    end
end)

function BuyHaki(va)
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer("Ability_Teacher", va)
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/XYZUi-obfuscated.lua"))()
local Win = library:sex()

local MainTab = Win:Tab("Farm/Boss️",18718155799)

local MainTab1 = MainTab:CraftPage(1)
local MainTab2 = MainTab:CraftPage(2)

local BossTab = Win:Tab("Raid/Boss️",18717945798)

local BossTab1 = BossTab:CraftPage(1)
local BossTab2 = BossTab:CraftPage(2)

local ShopTab = Win:Tab("Shop/Fruit️",18717934369)

local ShopTab1 = ShopTab:CraftPage(1)
local ShopTab2 = ShopTab:CraftPage(2)

local StatTab = Win:Tab("Stat/Teles️",18718151237)

local StatTab1 = StatTab:CraftPage(1)
local StatTab2 = StatTab:CraftPage(2)

local SetTab = Win:Tab("Settings",18717951749)

local SetTab1 = SetTab:CraftPage(1)
local SetTab2 = SetTab:CraftPage(2)

-- MainTab1
MainTab1:Seperator("Auto Farm Level")

MainTab1:Toggle("Auto Farm Level", _G.Settings.Main["AutoFarm"], function(va)
    _G.Settings.Main["AutoFarm"] = va
    StopTween(va)
    SaveSettings()
end)

MainTab1:Button("TP Location Farm", function()
    CheckLv()
    TP(game.Workspace.Location.QuestLocaion[Quest].CFrame)
end)

MainTab1:Seperator("Auto Farm Monsters")

local MonNames = {}

for _, v in pairs(game.Workspace.Location.Enemy_Location:GetChildren()) do
        table.insert(MonNames, v.Name)
end

MainTab1:Dropdown("Select Monsters", MonNames, _G.Settings.Main["NameMon"], function(va)
    _G.Settings.Main["NameMon"] = va
    SaveSettings()
end)

MainTab1:Toggle("Auto Farm Monster", _G.Settings.Main["FarmMon"], function(va)
    _G.Settings.Main["FarmMon"] = va
    StopTween(va)
    SaveSettings()
end)

MainTab1:Button("TP Location Monster", function()
    TP(game.Workspace.Location.Enemy_Location[_G.Settings.Main["NameMon"]].CFrame)
end)

--MainTab2

MainTab2:Seperator("Auto Quest")

MainTab2:Toggle("Auto Floppa Quest", _G.Settings.Main["AutoLava"], function(va)
    _G.Settings.Main["AutoLava"] = va
    StopTween(va)
    SaveSettings()
end)

MainTab2:Toggle("Auto Awaken Orb", _G.Settings.Main["AutoRaceV2"], function(va)
    _G.Settings.Main["AutoRaceV2"] = va
    StopTween(va)
    SaveSettings()
end)

MainTab2:Seperator("Auto Popcat ")

MainTab2:Toggle("Click Popcat NPC", _G.Settings.Main["AutoPopCat"], function(va)
    _G.Settings.Main["AutoPopCat"] = va
    SaveSettings()
end)

MainTab2:Button("Buy Popcat Weapon", function()
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer("Weapon_Seller", "Ohio Popcat")
end)

MainTab2:Button("TP Location Popcat", function()
    TP(CFrame.new(Vector3.new(399, -37, -588)))
end)

MainTab2:Button("Check Click", function()
    CheckBoss()
    Notify("Your Click: " .. tostring(plr.PlayerData.Pop.Value))
end)

--BossTab1

BossTab1:Seperator("Auto Raid")

BossTab1:Toggle("Auto Fully Raid (Only Private)", _G.Settings.Boss["RaidFarm"], function(va)
    _G.Settings.Boss["RaidFarm"] = va
    StopTween(va)
    SaveSettings()
end)

BossTab1:Button("TP Location Raid", function()
    TP(CFrame.new(Vector3.new(2749, -58, -4524)))
end)

BossTab1:Seperator("Auto Boss")

local Boss_Sum = BossTab1:Label("Wait For Load")

BossTab1:Dropdown("Select Boss", {"Lord Sus", "Evil Noob", "Giant Pumpkin"}, _G.Settings.Boss["SelectBoss"], function(va)
    _G.Settings.Boss["SelectBoss"] = va
    SaveSettings()
end)

BossTab1:Toggle("Fully Farm Boss", _G.Settings.Boss["FarmBoss"], function(va)
    _G.Settings.Boss["FarmBoss"] = va
    StopTween(va)
    SaveSettings()
end)

BossTab1:Seperator("Meme Beast")

local Mm_Bit = BossTab1:Label("Wait For Load")

spawn(function()
    while wait(.5) do
        pcall(function()
        CheckBoss()
            Mm_Bit:Set(game.Workspace.Leaderboard.Time.Model.ScoreBlock.SurfaceGui["Meme Beast"].Text)
            Boss_Sum:Set(game.Workspace.Leaderboard.Time.Model.ScoreBlock.SurfaceGui[_G.Settings.Boss["SelectBoss"]].Text .. "  -  " .. NameItem .. ": " .. tostring(plr.Items.ItemStorage[NameItem].Value))
        end) 
    end
end)  

BossTab1:Toggle("Auto Meme Beast", _G.Settings.Boss["AutoMemeBeast"], function(va)
    _G.Settings.Boss["AutoMemeBeast"] = va
    StopTween(va)
    SaveSettings()
end)

--BossTab2

BossTab2:Seperator("Info Player")

local Info_Player1 = BossTab2:Label("Wait For Load")
local Info_Player2 = BossTab2:Label("Wait For Load")
local Info_Player3 = BossTab2:Label("Wait For Load")

local Playerss = {}
for _, v in pairs(game.Players:GetPlayers()) do
    if v ~= plr then
        table.insert(Playerss, v.Name)
    end
end

spawn(function()
    while wait() do
        pcall(function()
            local Plr_Select = _G.Settings.Player["SelectPlayer1"]
            if game.Players:FindFirstChild(Plr_Select) then
                if game.Players[Plr_Select].Character:FindFirstChild("HumanoidRootPart") then
                    if not game.Players[Plr_Select].Character:GetAttribute("PvpDisabled") or game.Players[Plr_Select].Character:GetAttribute("PvpDisabled") == nil then
                        StatusPVP = "true"
                    else
                        StatusPVP = "false"
                    end
                    Info_Player1:Set(Plr_Select .. " (" .. game.Players[Plr_Select].DisplayName .. ")")
                    Info_Player3:Set("Pvp Disabled: " .. tostring(StatusPVP) .. "  -  " .. "Safe Zone: " .. tostring(game.Players[Plr_Select].Character:GetAttribute("Safezone")))
                    Info_Player2:Set("Team: " .. tostring(game.Players[Plr_Select].PlayerData.LastTeam.Value) .. " - Distance: " .. tostring(math.floor((game.Players[Plr_Select].Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude)))
                    if _G.Settings.Player["SelectPlayer1"] == nil then
                        Info_Player1:Set("Nil")
                        Info_Player2:Set("Nil")
                        Info_Player3:Set("Nil")
                    end
                end
            end
        end)
        wait(0.01)
    end
end)


BossTab2:Seperator("Farm Player")

local Select_Player = BossTab2:Dropdown("Player", Playerss, _G.Settings.Player["SelectPlayer1"], function(va)
    _G.Settings.Player["SelectPlayer1"] = va
    SaveSettings()
end)

BossTab2:Button("Refresh Players", function()
    Select_Player:Clear()
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= plr then
            Select_Player:Add(v.Name)
        end
    end
end)

BossTab2:Toggle("Farm Player Select", _G.Settings.Player["FarmPlayer"], function(va)
    _G.Settings.Player["FarmPlayer"] = va
    StopTween(va)
    SaveSettings()
end)

BossTab2:Button("TP Player Select", function()
    local v22 = game.Players[_G.Settings.Player["SelectPlayer1"]]
    if v22.Character.HumanoidRootPart and v22.Character.Humanoid.Health > 0 then
        TP(v22.Character.HumanoidRootPart.CFrame)
    end
end)

BossTab2:Seperator("Auto Bounty")

BossTab2:Toggle("Farm All Player", _G.Settings.Player["AutoBounty"], function(va)
    _G.Settings.Player["AutoBounty"] = va
    StopTween(va)
    SaveSettings()
end)

BossTab2:Toggle("Auto TP Safe", _G.Settings.Player["AutoSafe"], function(va)
    _G.Settings.Player["AutoSafe"] = va
    SaveSettings()
end)

BossTab2:Toggle("Auto Hop", _G.Settings.Player["AutoRejoin"], function(va)
    _G.Settings.Player["AutoRejoin"] = va
    SaveSettings()
end)

--ShopTab1

-- Config Fruit
ShopTab1:Seperator("Config Fruit")
ShopTab1:Toggle("Fruit Uncommon", _G.Settings.Shop["Uncommon"], function(va)
    _G.Settings.Shop["Uncommon"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Fruit Common", _G.Settings.Shop["Common"], function(va)
    _G.Settings.Shop["Common"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Fruit Rare", _G.Settings.Shop["Rare"], function(va)
    _G.Settings.Shop["Rare"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Fruit Legendary", _G.Settings.Shop["Legendary"], function(va)
    _G.Settings.Shop["Legendary"] = va
    SaveSettings()
end)

ShopTab1:Seperator("Function Fruit")

-- Store/Unstore/Drop Fruit Toggles
ShopTab1:Toggle("Store Fruit All (X5)", _G.Settings.Shop["StoreFruitAll"], function(va)
    _G.Settings.Shop["StoreFruitAll"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Store Fruit Select", _G.Settings.Shop["StoreFruit"], function(va)
    _G.Settings.Shop["StoreFruit"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Un Fruit All (X5)", _G.Settings.Shop["UnStoreFruitAll"], function(va)
    _G.Settings.Shop["UnStoreFruitAll"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Un Fruit Select", _G.Settings.Shop["UnStoreFruit"], function(va)
    _G.Settings.Shop["UnStoreFruit"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Drop Fruit All (X5)", _G.Settings.Shop["DropFruitAll"], function(va)
    _G.Settings.Shop["DropFruitAll"] = va
    SaveSettings()
end)

ShopTab1:Toggle("Drop Fruit Select", _G.Settings.Shop["DropFruit"], function(va)
    _G.Settings.Shop["DropFruit"] = va
    SaveSettings()
end)

-- Auto Ramdom Fruit Toggle
ShopTab1:Toggle("Auto Ramdom Fruit", _G.Settings.Shop["RamdomFruit"], function(va)
    _G.Settings.Shop["RamdomFruit"] = va
    SaveSettings()
end)

-- Bring All Item Toggle
ShopTab1:Toggle("Bring All Item", _G.Settings.Shop["TPFruit"], function(va)
    _G.Settings.Shop["TPFruit"] = va
    StopTween(va)
    SaveSettings()
end)

--ShopTab2

ShopTab2:Seperator("Haki Color")

-- Roll Haki Color Toggle
ShopTab2:Toggle("Roll Haki Color", _G.Settings.Shop["RollHaki"], function(va)
    _G.Settings.Shop["RollHaki"] = va
    if va then
        if plr.Items.AuraColor.Spectrum.Value == true then
            Notify("You have the Rainbow haki")
        end
    end
    SaveSettings()
end)

ShopTab2:Button("Check Color", function()
    Notify("Your Color: " .. plr.PlayerData.AuraColor.Value)
end)

ShopTab2:Button("Roll Color", function()
    RollHaki()
end)

ShopTab2:Seperator("Shop Item")

-- Buy Aura (Buso Haki) Button
ShopTab2:Button("Buy Aura", function()
    BuyHaki("Aura Master")
end)

-- Buy Instinct (Ken Haki) Button
ShopTab2:Button("Buy Instinct", function()
    BuyHaki("Nugget Man")
end)

-- Buy Instinct (Ken Haki) Button
ShopTab2:Button("Buy Flash Step", function()
    BuyHaki("Giga Chad")
end)

-- Buy Quest Scroll Button
ShopTab2:Button("Buy Quest Scroll", function()
    local args = {
        [1] = "Upgrade_Quest",
        [2] = "Popcat"
    }
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(unpack(args))
end)

-- Reroll Race Button
ShopTab2:Button("Reroll Race", function()
    game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer("Reroll_Race", "Watermelon Man")
end)

--StatTab1
StatTab1:Seperator("Auto Stats")

-- Auto Melee Toggle
StatTab1:Toggle("Auto Melee", _G.Settings.Teleport["AutoMelee"], function(va)
    _G.Settings.Teleport["AutoMelee"] = va
    SaveSettings()
end)

-- Auto Defense Toggle
StatTab1:Toggle("Auto Defense", _G.Settings.Teleport["AutoDefense"], function(va)
    _G.Settings.Teleport["AutoDefense"] = va
    SaveSettings()
end)

-- Auto Sword Toggle
StatTab1:Toggle("Auto Sword", _G.Settings.Teleport["AutoSword"], function(va)
    _G.Settings.Teleport["AutoSword"] = va
    SaveSettings()
end)

-- Auto Power Toggle
StatTab1:Toggle("Auto Power", _G.Settings.Teleport["AutoPower"], function(va)
    _G.Settings.Teleport["AutoPower"] = va
    SaveSettings()
end)

StatTab1:Seperator("Teleport Map")

local MapNames = {}

for _, v in pairs(game.Workspace.Location.Teleport:GetChildren()) do
        table.insert(MapNames, v.Name)
end

-- Select Island Dropdown
StatTab1:Dropdown("Select Island", MapNames, _G.Settings.Teleport["SelectIsland"], function(va)
    _G.Settings.Teleport["SelectIsland"] = va
    SaveSettings()
end)

-- Telport Button
StatTab1:Button("Telport", function()
    TP(game.Workspace.Location.Teleport[_G.Settings.Teleport["SelectIsland"]].CFrame)
end)

--StatTab2

StatTab2:Seperator("Boost FPS")

-- Mr Beast Screen Toggle
StatTab2:Toggle("Mr Beast Screen", _G.Settings.Config["Black"], function(va)
    _G.Settings.Config["Black"] = va
    plr.PlayerGui.Jumpscare.Beast.Enabled = va
    SaveSettings()
end)

-- Removes Skill Effects Toggle
StatTab2:Toggle("Removes Skill Effects", _G.Settings.Config["DeleteSkill"], function(va)
    _G.Settings.Config["DeleteSkill"] = va
    SaveSettings()
end)

-- Boost FPS Button
StatTab2:Button("Boost FPS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/SuperFpsBoost.lua"))()
end)

-- Hop Server Button
StatTab2:Button("Hop Server", function()
    serverhop()
end)

-- Rejoin Server Button
StatTab2:Button("Rejoin Server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

-- Copy Discord Server Button
StatTab2:Button("Copy Discord Server", function()
    setclipboard("https://discord.com/invite/UrkE64Mfb7")
end)

StatTab2:Seperator("Fake Values")

-- Fake Values Buttons
StatTab2:Button("Fake All Item 99 Values", function()
    for i, v in pairs(game.Players.LocalPlayer.Items:GetDescendants()) do
        if v:IsA("BoolValue") then
            v.Value = true
        elseif v:IsA("IntValue") then
            v.Value = 99
        end
    end
end)

StatTab2:Button("Fake Level 9999", function()
    plr.PlayerData.Level.Value = 999999999
end)

StatTab2:Button("Fake Gem 9999999", function()
    plr.PlayerData.Gem.Value = 999999999999
end)

StatTab2:Button("Fake Money 9999999", function()
    plr.PlayerData.Money.Value = 999999999999999
end)

--SetTab1

-- Setting Config Farm Section
SetTab1:Seperator("Setting Config Farm")

-- Weapon Dropdown
SetTab1:Dropdown("Weapon", {"Melee", "Sword", "Power"}, _G.Settings.Config["SelectWeapon"], function(va)
    _G.Settings.Config["SelectWeapon"] = va
    SaveSettings()
end)

-- Method Dropdown
SetTab1:Dropdown("Method", {"Behind", "Below", "Upper"}, _G.Settings.Config["SelectMethod"], function(va)
    _G.Settings.Config["SelectMethod"] = va
    SaveSettings()
end)

-- Distance Slider
SetTab1:Slider("Distance", true, 0, 50, _G.Settings.Config["DistanceMon"], function(va)
    _G.Settings.Config["DistanceMon"] = va
    SaveSettings()
end)

-- Setting Multi Equip Weapon Section
SetTab1:Seperator("Setting Multi Weapon")

-- Multi Equip Weapon Toggle
SetTab1:Toggle("Multi Equip Weapon", _G.Settings.Config["RDWP"], function(va)
    _G.Settings.Config["RDWP"] = va
    SaveSettings()
end)

-- Melee Toggle
SetTab1:Toggle("Melee", _G.Settings.Config["Melee"], function(va)
    _G.Settings.Config["Melee"] = va
    SaveSettings()
end)

-- Sword Toggle
SetTab1:Toggle("Sword", _G.Settings.Config["Sword"], function(va)
    _G.Settings.Config["Sword"] = va
    SaveSettings()
end)

-- Power Toggle
SetTab1:Toggle("Power", _G.Settings.Config["Power"], function(va)
    _G.Settings.Config["Power"] = va
    SaveSettings()
end)

--SetTab2

-- Setting Auto Farm Section
SetTab2:Seperator("Setting Auto Farm")

-- Buso Haki Toggle
SetTab2:Toggle("Buso Haki", _G.Settings.Config["BusoHaki"], function(va)
    _G.Settings.Config["BusoHaki"] = va
    SaveSettings()
end)

-- Ken Haki Toggle
SetTab2:Toggle("Ken Haki", _G.Settings.Config["KenHaki"], function(va)
    _G.Settings.Config["KenHaki"] = va
    SaveSettings()
end)

-- Awaken Race Toggle
SetTab2:Toggle("Awaken Race", _G.Settings.Config["AutoRace"], function(va)
    _G.Settings.Config["AutoRace"] = va
    SaveSettings()
end)

-- Bring Mob Toggle
SetTab2:Toggle("Bring Mob", _G.Settings.Config["BringMob"], function(va)
    _G.Settings.Config["BringMob"] = va
    SaveSettings()
end)

-- Auto Skill Section
SetTab2:Seperator("Auto Skill")

-- Auto Skill Toggle
SetTab2:Toggle("Auto Skill", _G.Settings.Config["AutoSkill"], function(va)
    _G.Settings.Config["AutoSkill"] = va
    if va then
        Notify("Skill: Move the cursor over the mob to work")
    end
    SaveSettings()
end)

-- Skill Z Toggle
SetTab2:Toggle("Skill Z", _G.Settings.Config["Z"], function(va)
    _G.Settings.Config["Z"] = va
    SaveSettings()
end)

-- Skill X Toggle
SetTab2:Toggle("Skill X", _G.Settings.Config["X"], function(va)
    _G.Settings.Config["X"] = va
    SaveSettings()
end)

-- Skill C Toggle
SetTab2:Toggle("Skill C", _G.Settings.Config["C"], function(va)
    _G.Settings.Config["C"] = va
    SaveSettings()
end)

-- Skill V Toggle
SetTab2:Toggle("Skill V", _G.Settings.Config["V"], function(va)
    _G.Settings.Config["V"] = va
    SaveSettings()
end)

end

-- share by elgato hub

for i, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "KeyUI" then
        v:Destroy()
    end
end

loadstring([[
	function LPH_NO_VIRTUALIZE(f) return f end;

	function LPH_JIT(f) return f end;

	function LPH_JIT_MAX(f) return f end;
]])();

function Notify1(va, va1)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Elgato Hub",
        Text = va,
        Icon = "",
        Duration = va1,
        Button1 = "Okay",
    })
end

function Notify(va)
    Notify1(va, 5)
end

local ServiceIdentifier = "elgatohub" or "(__YourServiceIdentifier__)"
local ServiceName = "Elgato Hub" or "(__YourServiceName__)"
local APIToken = "ayRrpaNybcnS27F8" or "(__YourAPIToken__)"
local KeyPrefix = "elgato_" or "(__YourKeyPrefix__)"
local KeyFileDirectory = "ELGATO HUB/SavedKey.txt" or "(__YourKeyFileDirectory__)"

local PandaAuth = (function()
    if true then
        local cloneref = cloneref or function(...) return ... end

        local service = setmetatable({}, {
            __index = function(self, key)
                return cloneref(game.GetService(game, key))
            end
        })

        local HttpService = service.HttpService

        local LibraryName = "VAL"

        local CachePath = "VALCache"

        if makefolder then
            makefolder(CachePath)
        end

        local URLSource = "https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL"

        local Source = nil

        local response = game:HttpGet("https://api.github.com/repos/Panda-Repositories/PandaKS_Libraries/contents/library/LuaLib/ROBLOX/VAL")

        local CacheSource = function()
            Source = game:HttpGet(URLSource)

            if writefile then
                writefile(CachePath .. "/" .. LibraryName, HttpService:JSONEncode({
                    Source = Source;
                    Commit = response;
                }))
            end

            return loadstring(Source)()
        end

        if isfile then
            if isfile(CachePath .. "/" .. LibraryName) then
                if HttpService:JSONDecode(readfile(CachePath .. "/" .. LibraryName)).Commit == response then
                    Source = HttpService:JSONDecode(readfile(CachePath .. "/" .. LibraryName)).Source

                    Notify("Loaded Cache", LibraryName)

                    return loadstring(Source)()
                else
                    CacheSource()
                end
            else
                CacheSource()
            end
        else
            CacheSource()
        end
    end

    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL", true))()
end)()

local IndexCount = {}

local InternalValues =  setmetatable({ -- // Change
    Service = ("%s"):format(ServiceIdentifier);
    APIToken = ("%s"):format(APIToken);
    VigenereKey = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    TrueEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    FalseEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32));
    KickWebhook = nil;
    ValidWebhook = nil;
    InvalidWebhook = nil;
    Debug = false;
}, {
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
});

local InternalTable = setmetatable({}, {
    __index = function(self, key)
        IndexCount[key] = IndexCount[key] and IndexCount[key] + 1 or 1

        if IndexCount[key] > 1 then

        end

        return InternalValues[key]
    end;
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
})

local Internal = setmetatable({}, {
    __index = function(self, key)
        return InternalTable[key]
    end;
    __newindex = function(self, key, value)
        while true do end print(debug.traceback()) return
    end;
    __tostring = function(self)
        while true do end print(debug.traceback()) return
    end;
})

local SetInternal = PandaAuth.SetInternal;
PandaAuth:SetInternal(Internal)

local Directory = KeyFileDirectory

local FetchedInternal = PandaAuth:GetInternal()

local Crypt
local SHA256
local SyncTrue

if true then
    Crypt = FetchedInternal.Crypt

    SHA256 = Crypt:SHA256(Internal.TrueEndpoint, Internal.VigenereKey, nil, nil)

    SyncTrue = Crypt:EncryptC(SHA256, Internal.VigenereKey, nil)
end

local IteratedTables = {}

local ValueSpoofed; ValueSpoofed = function(val, tbl)
    local ret = nil

    for i = 1, #tbl do
        local v = tbl[i]

        if v == val then
            ret = true

            break
        elseif (
            pcall(function()
                return v[""]
            end)
            and not pcall(function()
                return v .. v
            end)
            ) and not IteratedTables[v] then
            IteratedTables[v] = true

            ret = ValueSpoofed(val, v)

            break
        end
    end

    IteratedTables = {}

    return ret
end

local function __CheckKey()
    local result = PandaAuth:ValidateKey(readfile(Directory))

    if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
        or ValueSpoofed(result["Encrypted"], {result, SHA256}) then
        while true do end do return end
    end

    local SanityCheck = (function(a1, a2)
        return pcall(function()
            return (
                (
                getmetatable(getfenv(a1)["getrenv\0"])["__newindex"]() == SetInternal
                and a1 ~= SetInternal
                and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal
                and PandaAuth:SetInternal(Internal) == SetInternal
                )
                and (
                getfenv(a2)["getrenv\0"][1] == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][2]() == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][3]() == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][3][1] == getfenv(a2)["getrenv\0"][1]
                and getfenv(a2)["getrenv\0"][4] == getfenv(a2)["getrenv\0"][4]
                and (function()
                    getfenv(a2)["getrenv\0"][3][1] = "nil"

                    return true
                end)()
                and getfenv(a2)["getrenv\0"][5] == getfenv(a2)["getrenv\0"][1]
                and getfenv(getfenv(a2)["getrenv\0"][2])["getrenv\0"] == getmetatable(getfenv(a2)["getrenv\0"][3])
                )
                )
        end)
    end)

    if (function()
        local s, r = SanityCheck(PandaAuth.SetInternal, PandaAuth.ValidateKey)

        return s == true and r == true
    end)()
    and not (function()
        local s, r = SanityCheck(PandaAuth.GetInternal, PandaAuth.ValidateKey)

        return s == true and r == true
    end)() then
        if result
            and (
            (
            result["KEY"]
            and type(result["ENV"]) == type(getfenv(1))
            and result["Raw"] == Internal.TrueEndpoint
            and result["Encrypted"] == SyncTrue
            and result["Unencrypted"] == SHA256
            and type(result["Premium"]) == "boolean"
            and PandaAuth.Validated[1] == Internal.TrueEndpoint
            and PandaAuth.Validated[2] == true
            and (
            (
            getmetatable(result["Sanity"])
            and getfenv(getmetatable(result["Sanity"])(result["Encrypted"], result))[result["Encrypted"]]
            and result["Sanity"][result["Encrypted"]]
            and getfenv(result["Sanity"](result["Encrypted"], result))[result["Encrypted"]]
            and (function()
                local s, r = SanityCheck(result["Sanity"][result["Encrypted"]][1], result["Sanity"][result["Encrypted"]][2])

                return s == true and r == true
            end)()
            )
            )
            )
            or (
            result["Pre"]
            and type(result["ENV"]) == type(getfenv(1))
            and result["Raw"] == Internal.TrueEndpoint
            and PandaAuth.Validated[1] == Internal.TrueEndpoint
            and PandaAuth.Validated[2] == true
            )
            ) then
            writefile(Directory, result["KEY"])
            Notify("Key is Valid  -  " .. "Premium: " .. tostring(result["Premium"]))
            load1()
        elseif result
            and result["Raw"] == Internal.FalseEndpoint
            and PandaAuth.Validated[1] == Internal.FalseEndpoint
            and PandaAuth.Validated[2] == false then
            Notify("Key is Invalid")
            delfile(Directory)
            Load_Ui()
            return false
        else
            while true do end do return end
        end
    else
        while true do end do return end
    end

end

local function Load_Ui()
local everyClipboard = setclipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
local UserInputService = game:GetService("UserInputService")

    pcall(function()
        OldInstance:Destroy()
    end)

    local KeyUI = Instance.new("ScreenGui")
    KeyUI.Name = "KeyUI"
    KeyUI.Parent = game.CoreGui
    KeyUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

    if gethui then
        KeyUI.Parent = gethui()
    elseif syn.protect_gui then
        syn.protect_gui(KeyUI)
        KeyUI.Parent = CoreGui
    else
        KeyUI.Parent = CoreGui
    end

    getgenv().OldInstance = KeyUI

    local function MakeDraggable(gui)
        local dragging
        local dragInput
        local dragStart
        local startPos
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position =
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        gui.InputBegan:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        gui.InputChanged:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end
    

local function RainbowColor(Name, Parent)
    local Name = Instance.new("UIGradient")
    Name.Parent = Parent
    local function rainbowColor(hue)
        return Color3.fromHSV(hue % 1, 1, 1)
    end
    local hue = 0
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        hue = hue - 0.005
        Name.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, rainbowColor(hue)),
            ColorSequenceKeypoint.new(0.2, rainbowColor(hue + 0.1)),
            ColorSequenceKeypoint.new(0.4, rainbowColor(hue + 0.2)),
            ColorSequenceKeypoint.new(0.6, rainbowColor(hue + 0.3)),
            ColorSequenceKeypoint.new(0.8, rainbowColor(hue + 0.4)),
            ColorSequenceKeypoint.new(1, rainbowColor(hue + 0.5))
        }
    end)
end

-- Create the Background Frame
local BackgroundFrame = Instance.new("Frame")
BackgroundFrame.Parent = KeyUI
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Dark background color
BackgroundFrame.Position = UDim2.new(0.5, -120, 0.4, -35) -- Centered with padding
BackgroundFrame.Size = UDim2.new(0, 240, 0, 120) -- Adjust size to cover all elements
--BackgroundFrame.BackgroundTransparency = 0.5 -- Slight transparency
local UICorner = Instance.new("UICorner")
UICorner.Parent = BackgroundFrame

MakeDraggable(BackgroundFrame)

-- Create the TextBox
local TextBox = Instance.new("TextBox")
TextBox.Parent = BackgroundFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.5, -100, 0.2, 0)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Font = Enum.Font.FredokaOne
TextBox.PlaceholderText = "Enter your key here"
TextBox.Text = ""
TextBox.TextSize = 12
TextBox.TextWrapped = true

-- Create the TextLabel
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = BackgroundFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1 -- Make background transparent
TextLabel.Position = UDim2.new(0.5, -100, 0.2, -27) -- Same X as TextBox, higher Y position
TextLabel.Size = UDim2.new(0, 200, 0, 30)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "ELGATO HUB KEY SYSTEM"
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

RainbowColor(TextLabel, TextLabel)

-- Create the Check Key button
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Parent = BackgroundFrame
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
CheckKeyButton.Size = UDim2.new(0, 90, 0, 30)
CheckKeyButton.Font = Enum.Font.FredokaOne
CheckKeyButton.Text = "Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.TextSize = 14
CheckKeyButton.MouseButton1Click:Connect(function()
    local result = PandaAuth:ValidateKey(TextBox.text)

if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
    or ValueSpoofed(result["Encrypted"], {result, SHA256}) then
    while true do end do return end
end

local SanityCheck = (function(a1, a2)
    return pcall(function()
        return (
            (
            getmetatable(getfenv(a1)["getrenv\0"])["__newindex"]() == SetInternal
            and a1 ~= SetInternal
            and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal
            and PandaAuth:SetInternal(Internal) == SetInternal
            )
            and (
            getfenv(a2)["getrenv\0"][1] == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][2]() == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][3]() == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][3][1] == getfenv(a2)["getrenv\0"][1]
            and getfenv(a2)["getrenv\0"][4] == getfenv(a2)["getrenv\0"][4]
            and (function()
                getfenv(a2)["getrenv\0"][3][1] = "nil"

                return true
            end)()
            and getfenv(a2)["getrenv\0"][5] == getfenv(a2)["getrenv\0"][1]
            and getfenv(getfenv(a2)["getrenv\0"][2])["getrenv\0"] == getmetatable(getfenv(a2)["getrenv\0"][3])
            )
            )
    end)
end)

if (function()
    local s, r = SanityCheck(PandaAuth.SetInternal, PandaAuth.ValidateKey)

    return s == true and r == true
end)()
and not (function()
    local s, r = SanityCheck(PandaAuth.GetInternal, PandaAuth.ValidateKey)

    return s == true and r == true
end)() then
    if result
        and (
        (
        result["KEY"]
        and type(result["ENV"]) == type(getfenv(1))
        and result["Raw"] == Internal.TrueEndpoint
        and result["Encrypted"] == SyncTrue
        and result["Unencrypted"] == SHA256
        and type(result["Premium"]) == "boolean"
        and PandaAuth.Validated[1] == Internal.TrueEndpoint
        and PandaAuth.Validated[2] == true
        and (
        (
        getmetatable(result["Sanity"])
        and getfenv(getmetatable(result["Sanity"])(result["Encrypted"], result))[result["Encrypted"]]
        and result["Sanity"][result["Encrypted"]]
        and getfenv(result["Sanity"](result["Encrypted"], result))[result["Encrypted"]]
        and (function()
            local s, r = SanityCheck(result["Sanity"][result["Encrypted"]][1], result["Sanity"][result["Encrypted"]][2])

            return s == true and r == true
        end)()
        )
        )
        )
        or (
        result["Pre"]
        and type(result["ENV"]) == type(getfenv(1))
        and result["Raw"] == Internal.TrueEndpoint
        and PandaAuth.Validated[1] == Internal.TrueEndpoint
        and PandaAuth.Validated[2] == true
        )
        ) then
        writefile(Directory, result["KEY"])
        Notify("Key is Valid  -  " .. "Premium: " .. tostring(result["Premium"]))
        KeyUI:Destroy()
        load1()
    elseif result
        and result["Raw"] == Internal.FalseEndpoint
        and PandaAuth.Validated[1] == Internal.FalseEndpoint
        and PandaAuth.Validated[2] == false then
        Notify("Key is Invalid")
        return false
    else
        while true do end do return end
    end
else
    while true do end do return end
end

end)

-- Create the Get Key button
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Parent = BackgroundFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
GetKeyButton.Size = UDim2.new(0, 90, 0, 30)
GetKeyButton.Font = Enum.Font.FredokaOne
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 14
GetKeyButton.MouseButton1Click:Connect(function()
    everyClipboard(PandaAuth:GetKey())
    TextBox.Text = tostring(PandaAuth:GetKey())
    Notify("Copy successful.")
end)

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = BackgroundFrame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0.5, -12.5, 0.6, -12.5)
ImageButton.Size = UDim2.new(0, 25, 0, 25)
ImageButton.Image = "http://www.roblox.com/asset/?id=137811068969636"
ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
local StarterGui = game:GetService("StarterGui")
local bindable = Instance.new("BindableFunction")

bindable.OnInvoke = function(response)
    if response == "Close Gui" then
        KeyUI:Destroy()
    elseif response == "Discord" then
        Notify("Copy successful.")
        everyClipboard("https://discord.gg/UrkE64Mfb7")
    end
end

ImageButton.MouseButton1Click:Connect(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Elgato Hub",
        Text = "Please choose!",
        Duration = 15,
        Callback = bindable,
        Button1 = "Discord 🙄",
        Button2 = "Close Gui"
    })
end)

local UICorner = Instance.new("UICorner")
UICorner.Parent = GetKeyButton

local UICorner = Instance.new("UICorner")
UICorner.Parent = CheckKeyButton

local UICorner = Instance.new("UICorner")
UICorner.Parent = TextBox

local UICorner = Instance.new("UICorner")
UICorner.Parent = ImageButton

CheckKeyButton.Position = UDim2.new(0.5, 15, 0.6, -15)
GetKeyButton.Position = UDim2.new(0.5, -105, 0.6, -15)
end

if isfile(Directory) then
    __CheckKey()
    else
    Load_Ui()
end