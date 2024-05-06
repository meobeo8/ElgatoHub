local a = game
local b = a.Workspace
local c = a.Lighting
local d = b.Terrain
d.WaterWaveSize = 0
d.WaterWaveSpeed = 0
d.WaterReflectance = 0
d.WaterTransparency = 0
c.GlobalShadows = 0
c.FogEnd = 555
c.Brightness = 0
c.GlobalShadows = false
local f = true
for g, h in pairs(game.Workspace.Map:GetDescendants()) do
    if
        h.Name == "Tavern" or h.Name == "SmileFactory" or h.Name == "Tree" or h.Name == "Rocks" or h.Name == "PartHouse" or
            h.Name == "Hotel" or
            h.Name == "WallPiece" or
            h.Name == "MiddlePillars" or
            h.Name == "Cloud" or
            h.Name == "PluginGrass" or
            h.Name == "BigHouse" or
            h.Name == "SmallHouse" or
            h.Name == "Detail"
     then
        h:Destroy()
    end
end
for g, h in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
    if
        h.Name == "Tavern" or h.Name == "SmileFactory" or h.Name == "Tree" or h.Name == "Rocks" or h.Name == "PartHouse" or
            h.Name == "Hotel" or
            h.Name == "WallPiece" or
            h.Name == "MiddlePillars" or
            h.Name == "Cloud" or
            h.Name == "PluginGrass" or
            h.Name == "BigHouse" or
            h.Name == "SmallHouse" or
            h.Name == "Detail"
     then
        h:Destroy()
    end
end
settings().Rendering.QualityLevel = "Level01"
for g, h in pairs(a:GetDescendants()) do
    if h:IsA("Part") or h:IsA("Union") or h:IsA("CornerWedgePart") or h:IsA("TrussPart") then
        h.Material = "Plastic"
        h.Reflectance = 0
    elseif h:IsA("Decal") or h:IsA("Texture") and f then
        h.Transparency = 1
    elseif h:IsA("ParticleEmitter") or h:IsA("Trail") then
        h.Lifetime = NumberRange.new(0)
    elseif h:IsA("Explosion") then
        h.BlastPressure = 1
        h.BlastRadius = 1
    elseif h:IsA("Fire") or h:IsA("SpotLight") or h:IsA("Smoke") or h:IsA("Sparkles") then
        h.Enabled = false
    elseif h:IsA("MeshPart") then
        h.Material = "Plastic"
        h.Reflectance = 0
        h.TextureID = 10385902758728957
    end
end
for g, e in pairs(c:GetChildren()) do
    if
        e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or
            e:IsA("DepthOfFieldEffect")
     then
        e.Enabled = false
    end
end
sethiddenproperty(c, "Technology", 2)
sethiddenproperty(d, "Decoration", false)
settings().Rendering.QualityLevel = "Level01"
for g, h in pairs(b:GetDescendants()) do
    if h:IsA("BasePart") and not h:IsA("MeshPart") then
        h.Material = "Plastic"
        h.Reflectance = 0
    elseif (h:IsA("Decal") or h:IsA("Texture")) and f then
        h.Transparency = 1
    elseif h:IsA("ParticleEmitter") or h:IsA("Trail") then
        h.Lifetime = NumberRange.new(0)
    elseif h:IsA("Explosion") then
        h.BlastPressure = 1
        h.BlastRadius = 1
    elseif h:IsA("Fire") or h:IsA("SpotLight") or h:IsA("Smoke") or h:IsA("Sparkles") then
        h.Enabled = false
    elseif h:IsA("MeshPart") and f then
        h.Material = "Plastic"
        h.Reflectance = 0
        h.TextureID = 10385902758728957
    elseif h:IsA("SpecialMesh") and f then
        h.TextureId = 0
    elseif h:IsA("ShirtGraphic") and f then
        h.Graphic = 0
    elseif (h:IsA("Shirt") or h:IsA("Pants")) and f then
        h[h.ClassName .. "Template"] = 0
    end
end
for g = 1, #c:GetChildren() do
    e = c:GetChildren()[g]
    if
        e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or
            e:IsA("DepthOfFieldEffect")
     then
        e.Enabled = false
    end
end
b.DescendantAdded:Connect(
    function(h)
        wait()
        if h:IsA("BasePart") and not h:IsA("MeshPart") then
            h.Material = "Plastic"
            h.Reflectance = 0
        elseif h:IsA("Decal") or h:IsA("Texture") and f then
            h.Transparency = 1
        elseif h:IsA("ParticleEmitter") or h:IsA("Trail") then
            h.Lifetime = NumberRange.new(0)
        elseif h:IsA("Explosion") then
            h.BlastPressure = 1
            h.BlastRadius = 1
        elseif h:IsA("Fire") or h:IsA("SpotLight") or h:IsA("Smoke") or h:IsA("Sparkles") then
            h.Enabled = false
        elseif h:IsA("MeshPart") and f then
            h.Material = "Plastic"
            h.Reflectance = 0
            h.TextureID = 10385902758728957
        elseif h:IsA("SpecialMesh") and f then
            h.TextureId = 0
        elseif h:IsA("ShirtGraphic") and f then
            h.ShirtGraphic = 0
        elseif (h:IsA("Shirt") or h:IsA("Pants")) and f then
            h[h.ClassName .. "Template"] = 0
        end
    end
)
local i = {Textures = true, VisualEffects = true, Parts = true, Particles = true, Sky = true}
local j = {FullBright = true}
local k = {}
for l, m in next, game:GetDescendants() do
    if i.Parts then
        if m:IsA("Part") or m:IsA("Union") or m:IsA("BasePart") then
            m.Material = Enum.Material.SmoothPlastic
            table.insert(k, 1, m)
        end
    end
    if i.Particles then
        if m:IsA("ParticleEmitter") or m:IsA("Smoke") or m:IsA("Explosion") or m:IsA("Sparkles") or m:IsA("Fire") then
            m.Enabled = false
            table.insert(k, 1, m)
        end
    end
    if i.VisualEffects then
        if m:IsA("BloomEffect") or m:IsA("BlurEffect") or m:IsA("DepthOfFieldEffect") or m:IsA("SunRaysEffect") then
            m.Enabled = false
            table.insert(k, 1, m)
        end
    end
    if i.Textures then
        if m:IsA("Decal") or m:IsA("Texture") then
            m.Texture = ""
            table.insert(k, 1, m)
        end
    end
    if i.Sky then
        if m:IsA("Sky") then
            m.Parent = nil
            table.insert(k, 1, m)
        end
    end
end
game:GetService("TestService"):Message(
    "Effects Disabler Script : Successfully disabled " .. #k .. " assets / effects. Settings :"
)
for n, m in next, i do
    print(tostring(n) .. ": " .. tostring(m))
end
if j.FullBright then
    local o = game:GetService("Lighting")
    o.FogColor = Color3.fromRGB(255, 255, 255)
    o.FogEnd = math.huge
    o.FogStart = math.huge
    o.Ambient = Color3.fromRGB(255, 255, 255)
    o.Brightness = 5
    o.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    o.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    o.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    o.Outlines = true
end
