-- UI Modern by Luminaprojects with Aimbot Tab
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LuminaprojectsUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 320, 0, 280)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", mainFrame)
title.Text = "Luminaprojects Hub"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local tabHolder = Instance.new("Frame", mainFrame)
tabHolder.Size = UDim2.new(0, 90, 1, -30)
tabHolder.Position = UDim2.new(0, 0, 0, 30)
tabHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", tabHolder).CornerRadius = UDim.new(0, 4)

local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -100, 1, -30)
contentFrame.Position = UDim2.new(0, 100, 0, 30)
contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 4)

local hitboxEnabled = false
local espEnabled = false

function createButton(text, parent, callback)
    local button = Instance.new("TextButton", parent)
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, #parent:GetChildren() * 35)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
    button.MouseButton1Click:Connect(callback)
    return button
end

function switchTab(name)
    for _, frame in pairs(contentFrame:GetChildren()) do
        if frame:IsA("Frame") then
            frame.Visible = frame.Name == name
        end
    end
end

-- Create Tabs
local tabs = {"ESP", "Hitbox", "Aimbot", "Credit"}

for _, name in ipairs(tabs) do
    createButton(name, tabHolder, function()
        switchTab(name)
    end)

    local tabFrame = Instance.new("Frame", contentFrame)
    tabFrame.Name = name
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
end

-- ESP tab
local espTab = contentFrame:FindFirstChild("ESP")
createButton("Toggle ESP", espTab, function()
    espEnabled = not espEnabled
end)

-- Hitbox tab
local hitboxTab = contentFrame:FindFirstChild("Hitbox")
createButton("Toggle Hitbox", hitboxTab, function()
    hitboxEnabled = not hitboxEnabled
end)

-- Credit tab
local creditTab = contentFrame:FindFirstChild("Credit")
local creditLabel = Instance.new("TextLabel", creditTab)
creditLabel.Size = UDim2.new(1, -20, 0, 30)
creditLabel.Position = UDim2.new(0, 10, 0, 10)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Owner: Luminaprojects\nYouTube: Luminaprojects"
creditLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextSize = 14
creditLabel.TextWrapped = true
creditLabel.TextYAlignment = Enum.TextYAlignment.Top

-- Aimbot Tab
local aimbotTab = contentFrame:FindFirstChild("Aimbot")
local scroll = Instance.new("ScrollingFrame", aimbotTab)
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 300)

function createAimbotEntry(name, loadstringURL)
    local frame = Instance.new("Frame", scroll)
    frame.Size = UDim2.new(1, -10, 0, 30)
    frame.Position = UDim2.new(0, 5, 0, #scroll:GetChildren() * 35)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", frame)
    label.Text = name
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0, 10, 0, 0)

    local btn = Instance.new("TextButton", frame)
    btn.Text = "Execute"
    btn.Size = UDim2.new(0.3, 0, 1, -6)
    btn.Position = UDim2.new(0.65, 0, 0, 3)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(loadstringURL))()
    end)
end

-- Aimbot entries
createAimbotEntry("Aimbot Beta", "https://raw.githubusercontent.com/Luminaxhub/A1MB0T-RBLX/main/Aimbot.lua")
createAimbotEntry("AirHubV2", "https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua")
createAimbotEntry("ExunysV3", "https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua")

-- Default tab
switchTab("ESP")

-- ESP & Hitbox logic
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head

            if hitboxEnabled then
                head.Size = Vector3.new(15, 15, 15)
                head.Transparency = 0.6
                head.BrickColor = BrickColor.new(player.Team == LocalPlayer.Team and "Bright blue" or "Bright red")
                head.Material = Enum.Material.Neon
                head.CanCollide = false
            end

            if espEnabled then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") and not part:FindFirstChild("ESPBox") then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Name = "ESPBox"
                        box.Size = part.Size
                        box.Adornee = part
                        box.AlwaysOnTop = true
                        box.ZIndex = 5
                        box.Transparency = 0.4
                        box.Color3 = (player.Team == LocalPlayer.Team and Color3.fromRGB(0, 0, 255) or Color3.fromRGB(255, 0, 0))
                        box.Parent = part
                    elseif part:FindFirstChild("ESPBox") then
                        part.ESPBox.Color3 = (player.Team == LocalPlayer.Team and Color3.fromRGB(0, 0, 255) or Color3.fromRGB(255, 0, 0))
                        part.ESPBox.Visible = true
                    end
                end
            else
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") and part:FindFirstChild("ESPBox") then
                        part.ESPBox.Visible = false
                    end
                end
            end
        end
    end
end)
