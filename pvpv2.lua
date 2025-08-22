--// Script PvP Crack By Zeus TopTop : lionelronado17
--// Thêm TAB FixLag / Treo / TrốngApk
--// Giao diện đẹp + Toggle 👻 + Viền nhấp nháy Rainbow

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZeusPvPGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Nút 👻 Toggle
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(1, -60, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleButton.Text = "👻"
ToggleButton.TextSize = 26
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 127)
ToggleButton.Parent = ScreenGui
ToggleButton.BorderSizePixel = 0
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
ToggleButton.Active = true
ToggleButton.Draggable = true

-- Khung menu
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 220)
MainFrame.Position = UDim2.new(1, -270, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- Viền nhấp nháy
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame
RunService.RenderStepped:Connect(function()
    local t = tick() * 2
    local r = math.sin(t) * 127 + 128
    local g = math.sin(t + 2) * 127 + 128
    local b = math.sin(t + 4) * 127 + 128
    UIStroke.Color = Color3.fromRGB(r, g, b)
end)

-- Thanh tab chọn
local TabBar = Instance.new("Frame", MainFrame)
TabBar.Size = UDim2.new(1, 0, 0, 30)
TabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 8)

local PvPTabBtn = Instance.new("TextButton", TabBar)
PvPTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
PvPTabBtn.Text = "⚔ PvP"
PvPTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PvPTabBtn.TextColor3 = Color3.fromRGB(255,255,255)
PvPTabBtn.Font = Enum.Font.GothamBold
PvPTabBtn.TextSize = 14

local FixTabBtn = Instance.new("TextButton", TabBar)
FixTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
FixTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
FixTabBtn.Text = "🛠 FixLag"
FixTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FixTabBtn.TextColor3 = Color3.fromRGB(255,255,255)
FixTabBtn.Font = Enum.Font.GothamBold
FixTabBtn.TextSize = 14

-- Container nội dung
local PvPContainer = Instance.new("Frame", MainFrame)
PvPContainer.Size = UDim2.new(1, -20, 1, -40)
PvPContainer.Position = UDim2.new(0, 10, 0, 35)
PvPContainer.BackgroundTransparency = 1

local FixContainer = Instance.new("Frame", MainFrame)
FixContainer.Size = UDim2.new(1, -20, 1, -40)
FixContainer.Position = UDim2.new(0, 10, 0, 35)
FixContainer.BackgroundTransparency = 1
FixContainer.Visible = false

-- Hàm tạo nút
local function createButton(parent, name, emoji)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = emoji .. " " .. name .. ": OFF"
    btn.TextSize = 14
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

-- Layout
local PvPLayout = Instance.new("UIListLayout", PvPContainer)
PvPLayout.Padding = UDim.new(0, 10)
PvPLayout.SortOrder = Enum.SortOrder.LayoutOrder

local FixLayout = Instance.new("UIListLayout", FixContainer)
FixLayout.Padding = UDim.new(0, 10)
FixLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Nút PvP
local AutoClickBtn = createButton(PvPContainer, "Click", "⚔")
local SpinBtn      = createButton(PvPContainer, "Xoay", "🔄")
local SpeedBtn     = createButton(PvPContainer, "Tốc độ", "🏃‍♂️")

-- Nút Fix
local FixLagBtn    = createButton(FixContainer, "Fix Lag", "⚡")
local AFKBtn       = createButton(FixContainer, "Treo Game", "⏳")
local AntiKickBtn  = createButton(FixContainer, "Trống Apk", "🛡")

-- Chuyển tab
PvPTabBtn.MouseButton1Click:Connect(function()
    PvPTabBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    FixTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    PvPContainer.Visible = true
    FixContainer.Visible = false
end)
FixTabBtn.MouseButton1Click:Connect(function()
    FixTabBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    PvPTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    PvPContainer.Visible = false
    FixContainer.Visible = true
end)

-- ===== Chức năng PvP =====
local autoClick, spinActive, speedBoost = false, false, false
local spinSpeed, attackDelay = 2500, 0.08
local normalSpeed, boostedSpeed = 16, 32

AutoClickBtn.MouseButton1Click:Connect(function()
    autoClick = not autoClick
    AutoClickBtn.Text = "⚔ Click: " .. (autoClick and "ON" or "OFF")
end)
task.spawn(function()
    while true do
        if autoClick then VirtualUser:ClickButton1(Vector2.new()) end
        task.wait(attackDelay)
    end
end)

SpinBtn.MouseButton1Click:Connect(function()
    spinActive = not spinActive
    SpinBtn.Text = "🔄 Xoay: " .. (spinActive and "ON" or "OFF")
end)
RunService.RenderStepped:Connect(function(dt)
    if spinActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(spinSpeed * dt), 0)
    end
end)

SpeedBtn.MouseButton1Click:Connect(function()
    speedBoost = not speedBoost
    SpeedBtn.Text = "🏃‍♂️ Tốc độ: " .. (speedBoost and "ON" or "OFF")
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.WalkSpeed = speedBoost and boostedSpeed or normalSpeed end
end)
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid").WalkSpeed = speedBoost and boostedSpeed or normalSpeed
end)

-- ===== Chức năng Fix =====
FixLagBtn.MouseButton1Click:Connect(function()
    -- xóa hiệu ứng, giảm lag
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Explosion") then
            v:Destroy()
        end
    end
    FixLagBtn.Text = "⚡ Fix Lag: DONE"
end)

AFKBtn.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    AFKBtn.Text = "⏳ Treo Game: ON"
end)

AntiKickBtn.MouseButton1Click:Connect(function()
    for _,c in pairs(getconnections(LocalPlayer.Idled)) do
        c:Disable()
    end
    AntiKickBtn.Text = "🛡 Trống Apk: ON"
end)

-- Toggle Menu 👻
local menuVisible = false
ToggleButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    MainFrame.Visible = menuVisible
end)
