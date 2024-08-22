do  local ui =  game:GetService("CoreGui"):FindFirstChild("UILibrary")  if ui then ui:Destroy() end end

do  local ui =  game:GetService("Lighting"):FindFirstChild("Blur")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")

local function tablefound(ta, object)
    for i,v in pairs(ta) do
        if v == object then
            return true
        end
    end
    return false
end

local ActualTypes = {
    RoundFrame = "ImageLabel",
    Shadow = "ImageLabel",
    Circle = "ImageLabel",
    CircleButton = "ImageButton",
    Frame = "Frame",
    Label = "TextLabel",
    Button = "TextButton",
    SmoothButton = "ImageButton",
    Box = "TextBox",
    ScrollingFrame = "ScrollingFrame",
    Menu = "ImageButton",
    NavBar = "ImageButton"
}
--DestCommunity
--https://discord.gg/mWyKB9GPbE

local Properties = {
    RoundFrame = {
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5554237731",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(3,3,297,297)
    },
    SmoothButton = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5554237731",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(3,3,297,297)
    },
    Shadow = {
        Name = "Shadow",
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5554236805",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(23,23,277,277),
        Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
        Position = UDim2.fromOffset(-15,-15)
    },
    Circle = {
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5554831670"
    },
    CircleButton = {
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Image = "http://www.roblox.com/asset/?id=5554831670"
    },
    Frame = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1,1)
    },
    Label = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5,0),
        Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    Button = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5,0),
        Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    Box = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5,0),
        Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    ScrollingFrame = {
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.fromScale(0,0),
        Size = UDim2.fromScale(1,1)
    },
    Menu = {
        Name = "More",
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5555108481",
        Size = UDim2.fromOffset(20,20),
        Position = UDim2.fromScale(1,0.5) - UDim2.fromOffset(25,10)
    },
    NavBar = {
        Name = "SheetToggle",
        Image = "http://www.roblox.com/asset/?id=5576439039",
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(20,20),
        Position = UDim2.fromOffset(5,5),
        AutoButtonColor = false
    }
}

local Types = {
    "RoundFrame",
    "Shadow",
    "Circle",
    "CircleButton",
    "Frame",
    "Label",
    "Button",
    "SmoothButton",
    "Box",
    "ScrollingFrame",
    "Menu",
    "NavBar"
}
--DestCommunity
--https://discord.gg/mWyKB9GPbE

function FindType(String)
    for _, Type in next, Types do
        if Type:sub(1, #String):lower() == String:lower() then
            return Type
        end
    end
    return false
end

local Objects = {}

function Objects.new(Type)
    local TargetType = FindType(Type)
    if TargetType then
        local NewImage = Instance.new(ActualTypes[TargetType])
        if Properties[TargetType] then
            for Property, Value in next, Properties[TargetType] do
                NewImage[Property] = Value
            end
        end
        return NewImage
    else
        return Instance.new(Type)
    end
end

local function GetXY(GuiObject)
    local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
    local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
    return Px/Max, Py/May
end

local function CircleAnim(GuiObject, EndColour, StartColour)
    local PX, PY = GetXY(GuiObject)
    local Circle = Objects.new("Shadow")
    Circle.Size = UDim2.fromScale(0,0)
    Circle.Position = UDim2.fromScale(PX,PY)
    Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
    Circle.ZIndex = 200
    Circle.Parent = GuiObject
    local Size = GuiObject.AbsoluteSize.X
    TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
    spawn(function()
        wait(0.5)
        Circle:Destroy()
    end)
end

local UILibrary = Instance.new("ScreenGui")
local Load = Instance.new("Frame")
local UICornerLoad = Instance.new("UICorner")
local LoadButton = Instance.new("ImageButton")

UILibrary.Name = "UILibrary"
UILibrary.Parent = game:GetService("CoreGui")
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Load.Name = "Load"
Load.Parent = UILibrary
Load.Active = true
Load.AnchorPoint = Vector2.new(0.5, 0.5)
Load.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Load.BackgroundTransparency = 1
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.5, 0, 1, 0)
Load.Size = UDim2.new(0, 100, 0, 100)
Load.BackgroundTransparency = 1

local uitoggled = false
UserInputService.InputBegan:Connect(
    function(io, p)
        if io.KeyCode == Enum.KeyCode.P then
            if uitoggled == false then
                uitoggled = true
                UILibrary.Enabled = false
            else
                UILibrary.Enabled = true
                uitoggled = false
            end
        end
    end
)

UICornerLoad.CornerRadius = UDim.new(0, 30)
UICornerLoad.Name = "UICornerLoad"
UICornerLoad.Parent = Load

LoadButton.Name = "LoadButton"
LoadButton.Parent = Load
LoadButton.AnchorPoint = Vector2.new(0.5, 0.5)
LoadButton.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.BackgroundTransparency = 1.000
LoadButton.Size = UDim2.new(0, 70, 0, 70)
LoadButton.Image = "rbxassetid://15034250264"
LoadButton.ImageTransparency = 1

local ClickFrame = Instance.new("Frame")

ClickFrame.Name = "ClickFrame"
ClickFrame.Parent = Load
ClickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickFrame.BackgroundTransparency = 1.000
ClickFrame.Position = UDim2.new(0, 0, 7.62939436e-08, 0)
ClickFrame.Size = UDim2.new(0, 0, 0, 0)

local SoundClick = Instance.new("Sound")

SoundClick.Name = "Sound Effect"
SoundClick.Parent = Load
SoundClick.SoundId = "rbxassetid://5044897021"
SoundClick.Volume = 1

local Blur = Instance.new("BlurEffect")

Blur.Size = 0
Blur.Parent = game.Lighting

if game.Workspace.Camera.FieldOfView == 50 then
    return game.Workspace.Camera.FieldOfView == 70
end

local LoadText = Instance.new("Frame")
local UIListLayoutLoadText = Instance.new("UIListLayout")
local TitleLoad = Instance.new("TextLabel")

LoadText.Name = "LoadText"
LoadText.Parent = Load
LoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadText.BackgroundTransparency = 1.000
LoadText.Size = UDim2.new(0, 500, 0, 50)
LoadText.ClipsDescendants = true

UIListLayoutLoadText.Name = "UIListLayoutLoadText"
UIListLayoutLoadText.Parent = LoadText
UIListLayoutLoadText.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutLoadText.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutLoadText.SortOrder = Enum.SortOrder.LayoutOrder

TitleLoad.Name = "TitleLoad"
TitleLoad.Parent = LoadText
TitleLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.BackgroundTransparency = 1.000
TitleLoad.Size = UDim2.new(0, 200, 0, 50)
TitleLoad.Font = Enum.Font.Gotham
TitleLoad.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.TextSize = 14.000
TitleLoad.TextTransparency = 1

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

function LoadFunction()

    TweenService:Create(
        game.Workspace.Camera,
        TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
        {FieldOfView = 50}
    ):Play()

    TweenService:Create(
        Blur,
        TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
        {Size = 20}
    ):Play()

    TweenService:Create(
        Load,
        TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
        {Position = UDim2.new(0.5, 0, 0.5, 0)}
    ):Play()
    TweenService:Create(
        Load,
        TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
        {BackgroundTransparency = 0}
    ):Play()
    wait(.5)
    TweenService:Create(
        LoadButton,
        TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
        {ImageTransparency = 0}
    ):Play()

    LoadButton.MouseEnter:Connect(function()
        TweenService:Create(
            LoadButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 80, 0, 80)}
        ):Play()
    end)

    LoadButton.MouseLeave:Connect(function()
        TweenService:Create(
            LoadButton,
            TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 70, 0, 70)}
        ):Play()
    end)

    local LoadFocus = false

    LoadButton.MouseButton1Down:Connect(function()
        if LoadFocus == false then
            LoadFocus = true
            TweenService:Create(
                LoadButton,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Rotation = 180}
            ):Play()
            SoundClick:Play()
            TweenService:Create(
                LoadButton,
                TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {ImageTransparency = 1}
            ):Play()
            wait(.5)
            LoadButton:Destroy()
            wait(.5)
            TweenService:Create(
                Load,
                TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Position = UDim2.new(0.5, 0, 0.025, 0)}
            ):Play()
            TweenService:Create(
                Blur,
                TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Size = 0}
            ):Play()
            TweenService:Create(
                game.Workspace.Camera,
                TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {FieldOfView = 70}
            ):Play()
            wait(.5)
            TweenService:Create(
                Load,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 500, 0, 50)}
            ):Play()
            repeat wait()
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 0.2}
                ):Play()
                TitleLoad.Text = "Loading . . ."
                wait(1)
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 1}
                ):Play()
                wait(1)
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 0.2}
                ):Play()
                TitleLoad.Text = "Made By tranvanbao"
                wait(0.35)
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 1}
                ):Play()
                wait(1)
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 0.2}
                ):Play()
                local id = game.PlaceId
                if id == 17610616912 or id == 10260193230 or id == 6897167394 then
                    TitleLoad.Text = "Games Found: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
                    if game.PlaceId == 6897167394 then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/FruitSea.lua"))()
                    elseif game.PlaceId == 10260193230 then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/MemeSea.lua"))()
                    elseif game.PlaceId == 17610616912 then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ElgatoHub/main/AnimePowerEvolutionSimulator.lua"))()
                    end
                else
                    TitleLoad.Text = "Game Not Found or Not Supported"
                    wait(3)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/ScriptLinhTinh/main/Scare.lua"))()
                    wait(2)
                    game.Players.LocalPlayer:Kick("Not Support Game Please Check Status!")
                end
                TitleLoad.Font = Enum.Font.GothamBold
                TitleLoad.TextTransparency = 0
                wait(3)
                UILibrary:Destroy()
                wait(3)
                TweenService:Create(
                    TitleLoad,
                    TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
                    {TextTransparency = 1}
                ):Play()
            until Load.Size == UDim2.new(0, 500, 0, 50)
            TweenService:Create(
                ClickFrame,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 500, 0, 50)}
            ):Play()
            TweenService:Create(
                Load,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {BackgroundTransparency = 0.05}
            ):Play()

            LoadScrollbar.Visible = true
            wait(.5)

            TweenService:Create(
                LoadScrollbar,
                TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {ImageTransparency = 0}
            ):Play()
            repeat wait() until LoadScrollbar.ImageTransparency == 0
            wait(.5)
            TweenService:Create(
                osday,
                TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {TextTransparency = 0}
            ):Play()
            wait(.5)
            TweenService:Create(
                Title,
                TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {TextTransparency = 0}
            ):Play()
        end
    end)
end

LoadFunction()
