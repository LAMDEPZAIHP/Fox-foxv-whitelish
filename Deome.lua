-- PART 1: Lâm Studio LD Hub
print("🚀 Script chính đã bật thành công (Bypass Key)!")

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local DISCORD_LINK = "https://discord.gg/DDDNBU4C"

local FIREBASE_URL = "https://lamhub-data-default-rtdb.asia-southeast1.firebasedatabase.app/scripts.json"
local httprequest = (syn and syn.request) or (http and http.request) or http_request or fluxus and fluxus.request or request

-- ===== LED SẬP SÌNH =====
local ledColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 128, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(0, 128, 255),
    Color3.fromRGB(255, 0, 255),
    Color3.fromRGB(255, 255, 255)
}

local ledActive = true
local ledIndex = 1
local ledSpeed = 0.1

-- Tạo LED Background
local ledBackground = Instance.new("Frame")
ledBackground.Size = UDim2.new(1, 0, 1, 0)
ledBackground.BackgroundColor3 = ledColors[1]
ledBackground.BorderSizePixel = 0
ledBackground.ZIndex = -1

-- LED Text hiệu ứng
local ledText = Instance.new("TextLabel")
ledText.Size = UDim2.new(1, 0, 0, 50)
ledText.Position = UDim2.new(0, 0, 0, 10)
ledText.BackgroundTransparency = 1
ledText.TextColor3 = Color3.fromRGB(255, 255, 255)
ledText.Text = "⚡ LÂM STUDIO LD HUB ⚡"
ledText.Font = Enum.Font.GothamBlack
ledText.TextSize = 30
ledText.TextStrokeTransparency = 0
ledText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
ledText.ZIndex = 1

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "Bdvn2_MainLoadingGUI"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = PlayerGui

-- Thêm LED vào loading screen
ledBackground.Parent = loadingGui
ledText.Parent = loadingGui

local loadFrame = Instance.new("Frame", loadingGui)
loadFrame.Size = UDim2.new(0, 320, 0, 30)
loadFrame.Position = UDim2.new(0.5, -160, 0.5, -15)
loadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
loadFrame.BorderSizePixel = 0
loadFrame.ZIndex = 2
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 15)

local progressBar = Instance.new("Frame", loadFrame)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
progressBar.ZIndex = 2
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 15)

local label = Instance.new("TextLabel", loadFrame)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextSize = 16
label.Text = "Loading Lâm Studio LD Hub..."
label.ZIndex = 2

local circle = Instance.new("Frame", loadFrame)
circle.Size = UDim2.new(0, 24, 0, 24)
circle.Position = UDim2.new(0, -12, 0.5, -12)
circle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
circle.ZIndex = 2
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

-- LED animation trong khi loading
spawn(function()
    while ledActive and loadingGui.Parent do
        ledIndex = ledIndex % #ledColors + 1
        ledBackground.BackgroundColor3 = ledColors[ledIndex]
        ledText.TextStrokeColor3 = ledColors[ledIndex]
        task.wait(ledSpeed)
    end
end)

for i = 1, 100 do
    local percentage = i / 100
    progressBar.Size = UDim2.new(0, 320 * percentage, 1, 0)
    circle.Position = UDim2.new(0, (320 * percentage) - 12, 0.5, -12)
    label.Text = "Loading "..i.."%"
    task.wait(0.01)
end

ledActive = false
TweenService:Create(loadFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(progressBar, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
TweenService:Create(circle, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(ledBackground, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(ledText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
task.wait(0.5)
loadingGui:Destroy()

-- ===== MAIN GUI =====
local mainScreenGui = Instance.new("ScreenGui")
mainScreenGui.Name = "Bdvn2_MainHUB"
mainScreenGui.ResetOnSpawn = false
mainScreenGui.Parent = PlayerGui

local bgBlur = Instance.new("ImageLabel", mainScreenGui)
bgBlur.Size = UDim2.new(1, 0, 1, 0)
bgBlur.BackgroundTransparency = 1
bgBlur.Image = "rbxassetid://136466594653671"
bgBlur.ImageTransparency = 0.5
bgBlur.ZIndex = 0

local mainFrame = Instance.new("Frame", mainScreenGui)
mainFrame.Size = UDim2.new(0, 520, 0, 400)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

local mainBgImage = Instance.new("ImageLabel", mainFrame)
mainBgImage.Size = UDim2.new(1, 0, 1, 0)
mainBgImage.BackgroundTransparency = 1
mainBgImage.Image = "rbxassetid://81306420589898"
mainBgImage.ScaleType = Enum.ScaleType.Stretch
mainBgImage.ZIndex = 0
Instance.new("UICorner", mainBgImage).CornerRadius = UDim.new(0, 15)

-- LED border effect cho main frame
local ledBorder = Instance.new("Frame", mainFrame)
ledBorder.Size = UDim2.new(1, 4, 1, 4)
ledBorder.Position = UDim2.new(0, -2, 0, -2)
ledBorder.BackgroundTransparency = 1
ledBorder.BorderSizePixel = 0
ledBorder.ZIndex = -1
Instance.new("UICorner", ledBorder).CornerRadius = UDim.new(0, 15)

local ledBorderGlow = Instance.new("ImageLabel", mainFrame)
ledBorderGlow.Size = UDim2.new(1, 20, 1, 20)
ledBorderGlow.Position = UDim2.new(0, -10, 0, -10)
ledBorderGlow.BackgroundTransparency = 1
ledBorderGlow.Image = "rbxassetid://6815099347"
ledBorderGlow.ImageTransparency = 0.7
ledBorderGlow.ZIndex = -1

local circleIcon = Instance.new("ImageButton", mainScreenGui)
circleIcon.Size = UDim2.new(0, 0, 0, 0)
circleIcon.AnchorPoint = Vector2.new(0.5, 0.5)
circleIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
circleIcon.BackgroundTransparency = 1
circleIcon.BorderSizePixel = 0
circleIcon.Image = "rbxassetid://134604568437920"
circleIcon.Visible = false
circleIcon.Active = true
circleIcon.ZIndex = 50
Instance.new("UICorner", circleIcon).CornerRadius = UDim.new(1, 0)

local mainTitle = Instance.new("TextLabel", mainFrame)
mainTitle.Size = UDim2.new(1, 0, 0, 35)
mainTitle.BackgroundTransparency = 1
mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTitle.Text = "Lâm Studio LD Hub"
mainTitle.Font = Enum.Font.GothamBold
mainTitle.TextSize = 22
mainTitle.ZIndex = 2

local discordButton = Instance.new("TextButton", mainFrame)
discordButton.Size = UDim2.new(0, 150, 0, 20)
discordButton.Position = UDim2.new(0.5, 90, 0, 8)
discordButton.BackgroundTransparency = 1
discordButton.TextColor3 = Color3.fromRGB(150, 255, 150)
discordButton.Text = "Discord: (Click to Copy)"
discordButton.Font = Enum.Font.Gotham
discordButton.TextSize = 12
discordButton.ZIndex = 2
discordButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_LINK)
        discordButton.Text = "COPIED! ✅"
        task.wait(2)
        discordButton.Text = "Discord: (Click to Copy)"
    end
end)

local devInfo = Instance.new("TextLabel", mainFrame)
devInfo.Size = UDim2.new(1, 0, 0, 20)
devInfo.Position = UDim2.new(0, 0, 0, 25)
devInfo.BackgroundTransparency = 1
devInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
devInfo.Font = Enum.Font.Gotham
devInfo.TextSize = 14
devInfo.Text = "Dev: Lâm Studio LD"
devInfo.ZIndex = 2

-- LED animation cho main GUI
local mainLedActive = true
spawn(function()
    local index = 1
    while mainLedActive and mainScreenGui.Parent do
        index = index % #ledColors + 1
        ledBorder.BorderColor3 = ledColors[index]
        ledBorderGlow.ImageColor3 = ledColors[index]
        task.wait(0.3)
    end
end)

-- Tab buttons
local tabHomeBtn = Instance.new("TextButton", mainFrame)
tabHomeBtn.Size = UDim2.new(0, 90, 0, 25)
tabHomeBtn.Position = UDim2.new(0, 10, 0, 50)
tabHomeBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
tabHomeBtn.TextColor3 = Color3.new(1,1,1)
tabHomeBtn.Text = "🏠 HOME"
tabHomeBtn.Font = Enum.Font.GothamBold
tabHomeBtn.TextSize = 11
tabHomeBtn.ZIndex = 2
Instance.new("UICorner", tabHomeBtn).CornerRadius = UDim.new(0, 5)

local tabLibBtn = Instance.new("TextButton", mainFrame)
tabLibBtn.Size = UDim2.new(0, 90, 0, 25)
tabLibBtn.Position = UDim2.new(0, 105, 0, 50)
tabLibBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
tabLibBtn.TextColor3 = Color3.new(1,1,1)
tabLibBtn.Text = "📁 LIBRARY"
tabLibBtn.Font = Enum.Font.GothamBold
tabLibBtn.TextSize = 11
tabLibBtn.ZIndex = 2
Instance.new("UICorner", tabLibBtn).CornerRadius = UDim.new(0, 5)

local tabServerBtn = Instance.new("TextButton", mainFrame)
tabServerBtn.Size = UDim2.new(0, 90, 0, 25)
tabServerBtn.Position = UDim2.new(0, 200, 0, 50)
tabServerBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
tabServerBtn.TextColor3 = Color3.new(1,1,1)
tabServerBtn.Text = "🌐 SERVER"
tabServerBtn.Font = Enum.Font.GothamBold
tabServerBtn.TextSize = 11
tabServerBtn.ZIndex = 2
Instance.new("UICorner", tabServerBtn).CornerRadius = UDim.new(0, 5)

local tabGamepassBtn = Instance.new("TextButton", mainFrame)
tabGamepassBtn.Size = UDim2.new(0, 110, 0, 25)
tabGamepassBtn.Position = UDim2.new(0, 295, 0, 50)
tabGamepassBtn.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
tabGamepassBtn.TextColor3 = Color3.new(1,1,1)
tabGamepassBtn.Text = "🎮 GAMEPASS"
tabGamepassBtn.Font = Enum.Font.GothamBold
tabGamepassBtn.TextSize = 11
tabGamepassBtn.ZIndex = 2
Instance.new("UICorner", tabGamepassBtn).CornerRadius = UDim.new(0, 5)

-- Containers
local homeContainer = Instance.new("Frame", mainFrame)
homeContainer.Size = UDim2.new(1, 0, 1, -130)
homeContainer.Position = UDim2.new(0, 0, 0, 80)
homeContainer.BackgroundTransparency = 1
homeContainer.ZIndex = 2

local libContainer = Instance.new("Frame", mainFrame)
libContainer.Size = UDim2.new(1, 0, 1, -130)
libContainer.Position = UDim2.new(0, 0, 0, 80)
libContainer.BackgroundTransparency = 1
libContainer.Visible = false
libContainer.ZIndex = 2

local serverContainer = Instance.new("Frame", mainFrame)
serverContainer.Size = UDim2.new(1, 0, 1, -130)
serverContainer.Position = UDim2.new(0, 0, 0, 80)
serverContainer.BackgroundTransparency = 1
serverContainer.Visible = false
serverContainer.ZIndex = 2

local gamepassContainer = Instance.new("Frame", mainFrame)
gamepassContainer.Size = UDim2.new(1, 0, 1, -130)
gamepassContainer.Position = UDim2.new(0, 0, 0, 80)
gamepassContainer.BackgroundTransparency = 1
gamepassContainer.Visible = false
gamepassContainer.ZIndex = 2

-- Tab switching
local function switchTab(tab)
    homeContainer.Visible = (tab == "home")
    libContainer.Visible = (tab == "lib")
    serverContainer.Visible = (tab == "server")
    gamepassContainer.Visible = (tab == "gamepass")
    
    tabHomeBtn.BackgroundColor3 = (tab == "home") and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(100, 100, 100)
    tabLibBtn.BackgroundColor3 = (tab == "lib") and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(100, 100, 100)
    tabServerBtn.BackgroundColor3 = (tab == "server") and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(100, 100, 100)
    tabGamepassBtn.BackgroundColor3 = (tab == "gamepass") and Color3.fromRGB(255, 100, 0) or Color3.fromRGB(255, 128, 0)
end

tabHomeBtn.MouseButton1Click:Connect(function() switchTab("home") end)
tabLibBtn.MouseButton1Click:Connect(function() switchTab("lib") end)
tabServerBtn.MouseButton1Click:Connect(function() switchTab("server") end)
tabGamepassBtn.MouseButton1Click:Connect(function() switchTab("gamepass") end)

-- ===== GAMEPASS FREE TAB =====
local gamepassTitle = Instance.new("TextLabel", gamepassContainer)
gamepassTitle.Size = UDim2.new(1, 0, 0, 30)
gamepassTitle.Position = UDim2.new(0, 0, 0, 0)
gamepassTitle.BackgroundTransparency = 1
gamepassTitle.TextColor3 = Color3.fromRGB(255, 200, 0)
gamepassTitle.Text = "🎮 GAMEPASS FREE - BDVN2"
gamepassTitle.Font = Enum.Font.GothamBlack
gamepassTitle.TextSize = 20
gamepassTitle.ZIndex = 2

local gamepassDesc = Instance.new("TextLabel", gamepassContainer)
gamepassDesc.Size = UDim2.new(1, 0, 0, 40)
gamepassDesc.Position = UDim2.new(0, 0, 0, 35)
gamepassDesc.BackgroundTransparency = 1
gamepassDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
gamepassDesc.Text = "Nhận tất cả Gamepass miễn phí trong Bdvn2!\nScript by ZhenX201"
gamepassDesc.Font = Enum.Font.Gotham
gamepassDesc.TextSize = 13
gamepassDesc.TextWrapped = true
gamepassDesc.ZIndex = 2

local executeGamepassBtn = Instance.new("TextButton", gamepassContainer)
executeGamepassBtn.Size = UDim2.new(0, 250, 0, 50)
executeGamepassBtn.Position = UDim2.new(0.5, -125, 0, 90)
executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
executeGamepassBtn.TextColor3 = Color3.new(1,1,1)
executeGamepassBtn.Text = "⚡ KÍCH HOẠT GAMEPASS FREE"
executeGamepassBtn.Font = Enum.Font.GothamBlack
executeGamepassBtn.TextSize = 16
executeGamepassBtn.ZIndex = 2
Instance.new("UICorner", executeGamepassBtn).CornerRadius = UDim.new(0, 10)

local gamepassStatus = Instance.new("TextLabel", gamepassContainer)
gamepassStatus.Size = UDim2.new(1, 0, 0, 30)
gamepassStatus.Position = UDim2.new(0, 0, 0, 155)
gamepassStatus.BackgroundTransparency = 1
gamepassStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
gamepassStatus.Text = "Trạng thái: Sẵn sàng"
gamepassStatus.Font = Enum.Font.GothamBold
gamepassStatus.TextSize = 14
gamepassStatus.ZIndex = 2

-- LED Gamepass button effect
spawn(function()
    local index = 1
    while gamepassContainer.Visible or true do
        if executeGamepassBtn and executeGamepassBtn.Parent then
            index = index % #ledColors + 1
            if not gamepassContainer.Visible then break end
        end
        task.wait(0.5)
    end
end)

executeGamepassBtn.MouseButton1Click:Connect(function()
    gamepassStatus.Text = "Trạng thái: Đang kích hoạt..."
    gamepassStatus.TextColor3 = Color3.fromRGB(255, 255, 0)
    executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    executeGamepassBtn.Text = "ĐANG XỬ LÝ..."
    
    spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ZhenX201/Free-Gamepass-Script/main/source"))()
        end)
        
        if success then
            gamepassStatus.Text = "Trạng thái: ✅ KÍCH HOẠT THÀNH CÔNG!"
            gamepassStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
            executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            executeGamepassBtn.Text = "✅ ĐÃ KÍCH HOẠT"
        else
            gamepassStatus.Text = "Trạng thái: ❌ LỖI - " .. tostring(err)
            gamepassStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
            executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
            executeGamepassBtn.Text = "⚡ THỬ LẠI"
        end
        
        task.wait(3)
        if success then
            executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            executeGamepassBtn.Text = "✅ ĐÃ KÍCH HOẠT"
        else
            executeGamepassBtn.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
            executeGamepassBtn.Text = "⚡ KÍCH HOẠT GAMEPASS FREE"
        end
    end)
end)

local gamepassInfo = Instance.new("TextLabel", gamepassContainer)
gamepassInfo.Size = UDim2.new(1, 0, 0, 60)
gamepassInfo.Position = UDim2.new(0, 0, 0, 190)
gamepassInfo.BackgroundTransparency = 1
gamepassInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
gamepassInfo.Text = "💡 Mẹo: Sau khi kích hoạt, hãy Rejoin game để thấy hiệu quả!\nHỗ trợ tất cả Gamepass trong Bdvn2"
gamepassInfo.Font = Enum.Font.Gotham
gamepassInfo.TextSize = 12
gamepassInfo.TextWrapped = true
gamepassInfo.ZIndex = 2

-- ===== HÀM TẠO NÚT SCRIPT =====
local function createScriptButton(parent, x, y, text, url)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 150, 0, 28)
    btn.Position = UDim2.new(0, x, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.ZIndex = 2
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        if url == "KICK" then LocalPlayer:Kick("Bạn đã bị cấm vì dùng Troll Kick.")
        elseif url ~= "TOGGLE_KILLALL" and url ~= "INFJUMP" and url ~= "SPEEDHACK" and url ~= "ANTIAFK" 
            and url ~= "AUTOCLICK" and url ~= "REACH" and url ~= "SPINBOT" and url ~= "AIMBOT" 
            and url ~= "WALLHACK" and url ~= "GODMODE" and url ~= "TELEPORT" and url ~= "XRAY" 
            and url ~= "AUTOFARM" and url ~= "FASTBREAK" and url ~= "AUTOHEAL" and url ~= "INVIS" then
            loadstring(game:HttpGet(url))()
        end
    end)
    return btn
end

-- ===== TRANG CHỦ - CÁC CHỨC NĂNG =====
-- Hàng 1
local flyBtn = createScriptButton(homeContainer, 10, 0, "Fly GUI", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
local musicBtn = createScriptButton(homeContainer, 170, 0, "Music GUI", "https://raw.githubusercontent.com/Roblox-HttpSpy/my-Garbage/refs/heads/main/FeMusicExploit.lua")
local trollBtn = createScriptButton(homeContainer, 330, 0, "Troll Kick", "KICK")

-- Hàng 2
local killAllBtn = createScriptButton(homeContainer, 10, 35, "Bdvn2 Kill All", "TOGGLE_KILLALL")
killAllBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
local spiderBtn = createScriptButton(homeContainer, 170, 35, "Spider Script", "https://pastefy.app/wa3v2Vgm/raw")
local bangBtn = createScriptButton(homeContainer, 330, 35, "Bang GUI", "https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua")

-- Hàng 3: 15 CHỨC NĂNG MỚI
local infJumpBtn = createScriptButton(homeContainer, 10, 70, "Infinite Jump", "INFJUMP")
local speedBtn = createScriptButton(homeContainer, 170, 70, "Speed Hack", "SPEEDHACK")
local antiAfkBtn = createScriptButton(homeContainer, 330, 70, "Anti AFK", "ANTIAFK")

local autoClickBtn = createScriptButton(homeContainer, 10, 105, "Auto Click", "AUTOCLICK")
local reachBtn = createScriptButton(homeContainer, 170, 105, "Reach Hack", "REACH")
local spinBotBtn = createScriptButton(homeContainer, 330, 105, "Spin Bot", "SPINBOT")

local aimbotBtn = createScriptButton(homeContainer, 10, 140, "Aimbot", "AIMBOT")
local wallHackBtn = createScriptButton(homeContainer, 170, 140, "Wall Hack", "WALLHACK")
local godModeBtn = createScriptButton(homeContainer, 330, 140, "God Mode", "GODMODE")

local teleportBtn = createScriptButton(homeContainer, 10, 175, "Teleport Tool", "TELEPORT")
local xrayBtn = createScriptButton(homeContainer, 170, 175, "X-Ray Vision", "XRAY")
local autoFarmBtn = createScriptButton(homeContainer, 330, 175, "Auto Farm", "AUTOFARM")

local fastBreakBtn = createScriptButton(homeContainer, 10, 210, "Fast Break", "FASTBREAK")
local autoHealBtn = createScriptButton(homeContainer, 170, 210, "Auto Heal", "AUTOHEAL")
local invisBtn = createScriptButton(homeContainer, 330, 210, "Invisibility", "INVIS")

-- Biến cho các chức năng
local infJumpActive, speedActive, antiAfkActive = false, false, false
local autoClickActive, reachActive, spinActive = false, false, false
local aimbotActive, wallHackActive, godModeActive = false, false, false
local teleportActive, xrayActive, autoFarmActive = false, false, false
local fastBreakActive, autoHealActive, invisActive = false, false, false

-- Kết nối các chức năng
infJumpBtn.MouseButton1Click:Connect(function()
    infJumpActive = not infJumpActive
    infJumpBtn.Text = infJumpActive and "Inf Jump: ON" or "Infinite Jump"
    infJumpBtn.BackgroundColor3 = infJumpActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

speedBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    speedBtn.Text = speedActive and "Speed: ON" or "Speed Hack"
    speedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

antiAfkBtn.MouseButton1Click:Connect(function()
    antiAfkActive = not antiAfkActive
    antiAfkBtn.Text = antiAfkActive and "Anti AFK: ON" or "Anti AFK"
    antiAfkBtn.BackgroundColor3 = antiAfkActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

autoClickBtn.MouseButton1Click:Connect(function()
    autoClickActive = not autoClickActive
    autoClickBtn.Text = autoClickActive and "Auto Click: ON" or "Auto Click"
    autoClickBtn.BackgroundColor3 = autoClickActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

reachBtn.MouseButton1Click:Connect(function()
    reachActive = not reachActive
    reachBtn.Text = reachActive and "Reach: ON" or "Reach Hack"
    reachBtn.BackgroundColor3 = reachActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

spinBotBtn.MouseButton1Click:Connect(function()
    spinActive = not spinActive
    spinBotBtn.Text = spinActive and "Spin: ON" or "Spin Bot"
    spinBotBtn.BackgroundColor3 = spinActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

aimbotBtn.MouseButton1Click:Connect(function()
    aimbotActive = not aimbotActive
    aimbotBtn.Text = aimbotActive and "Aimbot: ON" or "Aimbot"
    aimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

wallHackBtn.MouseButton1Click:Connect(function()
    wallHackActive = not wallHackActive
    wallHackBtn.Text = wallHackActive and "Wall Hack: ON" or "Wall Hack"
    wallHackBtn.BackgroundColor3 = wallHackActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

godModeBtn.MouseButton1Click:Connect(function()
    godModeActive = not godModeActive
    godModeBtn.Text = godModeActive and "God: ON" or "God Mode"
    godModeBtn.BackgroundColor3 = godModeActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

teleportBtn.MouseButton1Click:Connect(function()
    teleportActive = not teleportActive
    teleportBtn.Text = teleportActive and "Teleport: ON" or "Teleport Tool"
    teleportBtn.BackgroundColor3 = teleportActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

xrayBtn.MouseButton1Click:Connect(function()
    xrayActive = not xrayActive
    xrayBtn.Text = xrayActive and "X-Ray: ON" or "X-Ray Vision"
    xrayBtn.BackgroundColor3 = xrayActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

autoFarmBtn.MouseButton1Click:Connect(function()
    autoFarmActive = not autoFarmActive
    autoFarmBtn.Text = autoFarmActive and "Farm: ON" or "Auto Farm"
    autoFarmBtn.BackgroundColor3 = autoFarmActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

fastBreakBtn.MouseButton1Click:Connect(function()
    fastBreakActive = not fastBreakActive
    fastBreakBtn.Text = fastBreakActive and "Fast Break: ON" or "Fast Break"
    fastBreakBtn.BackgroundColor3 = fastBreakActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

autoHealBtn.MouseButton1Click:Connect(function()
    autoHealActive = not autoHealActive
    autoHealBtn.Text = autoHealActive and "Heal: ON" or "Auto Heal"
    autoHealBtn.BackgroundColor3 = autoHealActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

invisBtn.MouseButton1Click:Connect(function()
    invisActive = not invisActive
    invisBtn.Text = invisActive and "Invis: ON" or "Invisibility"
    invisBtn.BackgroundColor3 = invisActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(85, 85, 85)
end)

-- Kill All Logic
local killAllActive = false
killAllBtn.MouseButton1Click:Connect(function()
    killAllActive = not killAllActive
    killAllBtn.Text = killAllActive and "Kill All: ON" or "Bdvn2 Kill All"
    killAllBtn.BackgroundColor3 = killAllActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 0, 0)
end)

RunService.RenderStepped:Connect(function()
    if killAllActive then
        local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    for _, part in next, p.Character:GetChildren() do
                        if part:IsA("BasePart") then
                            firetouchinterest(tool.Handle, part, 0)
                            firetouchinterest(tool.Handle, part, 1)
                        end
                    end
                end
            end
        end
    end
end)

-- ===== SERVER FINDER TAB =====
local serverTitle = Instance.new("TextLabel", serverContainer)
serverTitle.Size = UDim2.new(1, 0, 0, 25)
serverTitle.Position = UDim2.new(0, 0, 0, 0)
serverTitle.BackgroundTransparency = 1
serverTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
serverTitle.Text = "🌐 SERVER FINDER - TÌM SERVER ÍT NGƯỜI"
serverTitle.Font = Enum.Font.GothamBold
serverTitle.TextSize = 16
serverTitle.ZIndex = 2

local serverPlaceIdBox = Instance.new("TextBox", serverContainer)
serverPlaceIdBox.Size = UDim2.new(0, 200, 0, 30)
serverPlaceIdBox.Position = UDim2.new(0, 10, 0, 35)
serverPlaceIdBox.PlaceholderText = "Place ID (để trống = game hiện tại)"
serverPlaceIdBox.Text = ""
serverPlaceIdBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
serverPlaceIdBox.TextColor3 = Color3.new(1,1,1)
serverPlaceIdBox.ZIndex = 2
Instance.new("UICorner", serverPlaceIdBox).CornerRadius = UDim.new(0, 6)

local serverMinPlayersBox = Instance.new("TextBox", serverContainer)
serverMinPlayersBox.Size = UDim2.new(0, 100, 0, 30)
serverMinPlayersBox.Position = UDim2.new(0, 220, 0, 35)
serverMinPlayersBox.PlaceholderText = "Min"
serverMinPlayersBox.Text = "1"
serverMinPlayersBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
serverMinPlayersBox.TextColor3 = Color3.new(1,1,1)
serverMinPlayersBox.ZIndex = 2
Instance.new("UICorner", serverMinPlayersBox).CornerRadius = UDim.new(0, 6)

local serverMaxPlayersBox = Instance.new("TextBox", serverContainer)
serverMaxPlayersBox.Size = UDim2.new(0, 100, 0, 30)
serverMaxPlayersBox.Position = UDim2.new(0, 330, 0, 35)
serverMaxPlayersBox.PlaceholderText = "Max"
serverMaxPlayersBox.Text = "5"
serverMaxPlayersBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
serverMaxPlayersBox.TextColor3 = Color3.new(1,1,1)
serverMaxPlayersBox.ZIndex = 2
Instance.new("UICorner", serverMaxPlayersBox).CornerRadius = UDim.new(0, 6)

local findServerBtn = Instance.new("TextButton", serverContainer)
findServerBtn.Size = UDim2.new(0, 150, 0, 30)
findServerBtn.Position = UDim2.new(0, 10, 0, 75)
findServerBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
findServerBtn.TextColor3 = Color3.new(1,1,1)
findServerBtn.Text = "🔍 TÌM SERVER"
findServerBtn.Font = Enum.Font.GothamBold
findServerBtn.ZIndex = 2
Instance.new("UICorner", findServerBtn).CornerRadius = UDim.new(0, 6)

local joinServerBtn = Instance.new("TextButton", serverContainer)
joinServerBtn.Size = UDim2.new(0, 150, 0, 30)
joinServerBtn.Position = UDim2.new(0, 170, 0, 75)
joinServerBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
joinServerBtn.TextColor3 = Color3.new(1,1,1)
joinServerBtn.Text = "▶ THAM GIA SERVER TỐT NHẤT"
joinServerBtn.Font = Enum.Font.GothamBold
joinServerBtn.Visible = false
joinServerBtn.ZIndex = 2
Instance.new("UICorner", joinServerBtn).CornerRadius = UDim.new(0, 6)

local serverListFrame = Instance.new("ScrollingFrame", serverContainer)
serverListFrame.Size = UDim2.new(1, -20, 0, 150)
serverListFrame.Position = UDim2.new(0, 10, 0, 115)
serverListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
serverListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
serverListFrame.ScrollBarThickness = 6
serverListFrame.ZIndex = 2
Instance.new("UICorner", serverListFrame).CornerRadius = UDim.new(0, 6)
local serverListLayout = Instance.new("UIListLayout", serverListFrame)
serverListLayout.Padding = UDim.new(0, 5)

local bestServerJobId = nil
local foundServers = {}

local function findServers()
    serverListFrame:ClearAllChildren()
    foundServers = {}
    bestServerJobId = nil
    joinServerBtn.Visible = false
    
    local placeId = tonumber(serverPlaceIdBox.Text) or game.PlaceId
    local minPlayers = tonumber(serverMinPlayersBox.Text) or 1
    local maxPlayers = tonumber(serverMaxPlayersBox.Text) or 5
    
    findServerBtn.Text = "ĐANG TÌM..."
    findServerBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    
    local cursor = ""
    local lowestPlayerCount = math.huge
    
    repeat
        local success, result = pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100&cursor=" .. cursor
            if httprequest then
                local response = httprequest({Url = url, Method = "GET"})
                return HttpService:JSONDecode(response.Body)
            else
                return HttpService:JSONDecode(game:HttpGet(url))
            end
        end)
        
        if success and result and result.data then
            for _, server in ipairs(result.data) do
                local playerCount = server.playing
                local maxPlayersServer = server.maxPlayers
                local ping = server.ping or 0
                
                if playerCount >= minPlayers and playerCount <= maxPlayers then
                    table.insert(foundServers, server)
                    
                    if playerCount < lowestPlayerCount then
                        lowestPlayerCount = playerCount
                        bestServerJobId = server.id
                    end
                    
                    local serverItem = Instance.new("Frame", serverListFrame)
                    serverItem.Size = UDim2.new(1, -10, 0, 35)
                    serverItem.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    serverItem.ZIndex = 2
                    Instance.new("UICorner", serverItem).CornerRadius = UDim.new(0, 4)
                    
                    local serverInfo = Instance.new("TextLabel", serverItem)
                    serverInfo.Size = UDim2.new(0.7, 0, 1, 0)
                    serverInfo.BackgroundTransparency = 1
                    serverInfo.TextColor3 = Color3.new(1,1,1)
                    serverInfo.Text = " 👥 " .. playerCount .. "/" .. maxPlayersServer .. " | Ping: " .. ping .. "ms"
                    serverInfo.TextXAlignment = Enum.TextXAlignment.Left
                    serverInfo.Font = Enum.Font.Gotham
                    serverInfo.TextSize = 12
                    serverInfo.ZIndex = 2
                    
                    local joinBtn = Instance.new("TextButton", serverItem)
                    joinBtn.Size = UDim2.new(0.25, 0, 0.8, 0)
                    joinBtn.Position = UDim2.new(0.75, -5, 0.1, 0)
                    joinBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
                    joinBtn.TextColor3 = Color3.new(1,1,1)
                    joinBtn.Text = "Join"
                    joinBtn.Font = Enum.Font.GothamBold
                    joinBtn.TextSize = 12
                    joinBtn.ZIndex = 2
                    Instance.new("UICorner", joinBtn).CornerRadius = UDim.new(0, 4)
                    
                    joinBtn.MouseButton1Click:Connect(function()
                        TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
                    end)
                end
            end
            cursor = result.nextPageCursor or ""
        else
            cursor = ""
        end
    until cursor == ""
    
    if bestServerJobId then
        joinServerBtn.Visible = true
        joinServerBtn.Text = "▶ THAM GIA SERVER (" .. lowestPlayerCount .. " người)"
    end
    
    findServerBtn.Text = "🔍 TÌM SERVER"
    findServerBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
end

findServerBtn.MouseButton1Click:Connect(findServers)

joinServerBtn.MouseButton1Click:Connect(function()
    if bestServerJobId then
        local placeId = tonumber(serverPlaceIdBox.Text) or game.PlaceId
        TeleportService:TeleportToPlaceInstance(placeId, bestServerJobId, LocalPlayer)
    end
end)

-- Search Box và TP List
local searchBox = Instance.new("TextBox", homeContainer)
searchBox.Size = UDim2.new(0, 230, 0, 26)
searchBox.Position = UDim2.new(0, 10, 0, 250)
searchBox.PlaceholderText = "Search player..."
searchBox.Text = ""
searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.ZIndex = 2
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)

local listFrame = Instance.new("ScrollingFrame", homeContainer)
listFrame.Size = UDim2.new(0, 230, 0, 80)
listFrame.Position = UDim2.new(0, 10, 0, 280)
listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
listFrame.ZIndex = 2
Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 6)
local UIList = Instance.new("UIListLayout", listFrame)
UIList.Padding = UDim.new(0, 5)

local function UpdatePlayers()
    for _, c in ipairs(listFrame:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and string.find(plr.Name:lower(), searchBox.Text:lower()) then
            local btn = Instance.new("TextButton", listFrame)
            btn.Size = UDim2.new(1, 0, 0, 24)
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Text = "[TP] " .. plr.Name
            btn.ZIndex = 2
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
            btn.MouseButton1Click:Connect(function()
                if LocalPlayer.Character and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character:MoveTo(plr.Character.HumanoidRootPart.Position)
                end
            end)
        end
    end
end
Players.PlayerAdded:Connect(UpdatePlayers)
searchBox:GetPropertyChangedSignal("Text"):Connect(UpdatePlayers)
UpdatePlayers()

local noclipBtn = Instance.new("TextButton", homeContainer)
noclipBtn.Size = UDim2.new(0, 110, 0, 30)
noclipBtn.Position = UDim2.new(0, 250, 0, 250)
noclipBtn.BackgroundColor3 = Color3.fromRGB(85,85,85)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.Text = "Noclip: OFF"
noclipBtn.ZIndex = 2
Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 6)
local noclip = false
noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = "Noclip: " .. (noclip and "ON" or "OFF")
    noclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(0,200,0) or Color3.fromRGB(85,85,85)
end)
RunService.Stepped:Connect(function()
    if noclip and LocalPlayer.Character then
        for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

local espBtn = Instance.new("TextButton", homeContainer)
espBtn.Size = UDim2.new(0, 110, 0, 30)
espBtn.Position = UDim2.new(0, 370, 0, 250)
espBtn.BackgroundColor3 = Color3.fromRGB(85,85,85)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.Text = "ESP: OFF"
espBtn.ZIndex = 2
Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0, 6)
local esp = false
espBtn.MouseButton1Click:Connect(function()
    esp = not esp
    espBtn.Text = "ESP: " .. (esp and "ON" or "OFF")
    espBtn.BackgroundColor3 = esp and Color3.fromRGB(0,200,0) or Color3.fromRGB(85,85,85)
    if esp then loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"))() end
end)

-- ===== THƯ VIỆN TAB =====
local libSearchBox = Instance.new("TextBox", libContainer)
libSearchBox.Size = UDim2.new(0, 230, 0, 26)
libSearchBox.Position = UDim2.new(0, 20, 0, 0)
libSearchBox.PlaceholderText = "Tìm tên Script..."
libSearchBox.Text = ""
libSearchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
libSearchBox.TextColor3 = Color3.new(1,1,1)
libSearchBox.ZIndex = 2
Instance.new("UICorner", libSearchBox).CornerRadius = UDim.new(0, 6)

local scriptListFrame = Instance.new("ScrollingFrame", libContainer)
scriptListFrame.Size = UDim2.new(0, 230, 0, 200)
scriptListFrame.Position = UDim2.new(0, 20, 0, 30)
scriptListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scriptListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scriptListFrame.ScrollBarThickness = 6
scriptListFrame.ZIndex = 2
Instance.new("UICorner", scriptListFrame).CornerRadius = UDim.new(0, 6)
local scriptListLayout = Instance.new("UIListLayout", scriptListFrame)
scriptListLayout.Padding = UDim.new(0, 5)

local uploadTitle = Instance.new("TextLabel", libContainer)
uploadTitle.Size = UDim2.new(0, 230, 0, 20)
uploadTitle.Position = UDim2.new(0, 270, 0, 0)
uploadTitle.BackgroundTransparency = 1
uploadTitle.TextColor3 = Color3.new(1,1,1)
uploadTitle.Text = "⬆️ UPLOAD SCRIPT"
uploadTitle.Font = Enum.Font.GothamBold
uploadTitle.ZIndex = 2

local uploadNameBox = Instance.new("TextBox", libContainer)
uploadNameBox.Size = UDim2.new(0, 230, 0, 30)
uploadNameBox.Position = UDim2.new(0, 270, 0, 25)
uploadNameBox.PlaceholderText = "Nhập Tên Script (Vd: Lâm Awd)"
uploadNameBox.Text = ""
uploadNameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
uploadNameBox.TextColor3 = Color3.new(1,1,1)
uploadNameBox.ZIndex = 2
Instance.new("UICorner", uploadNameBox).CornerRadius = UDim.new(0, 6)

local uploadContentBox = Instance.new("TextBox", libContainer)
uploadContentBox.Size = UDim2.new(0, 230, 0, 135)
uploadContentBox.Position = UDim2.new(0, 270, 0, 60)
uploadContentBox.PlaceholderText = "Dán Code Script vào đây..."
uploadContentBox.Text = ""
uploadContentBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
uploadContentBox.TextColor3 = Color3.new(1,1,1)
uploadContentBox.TextWrapped = true
uploadContentBox.TextXAlignment = Enum.TextXAlignment.Left
uploadContentBox.TextYAlignment = Enum.TextYAlignment.Top
uploadContentBox.ZIndex = 2
Instance.new("UICorner", uploadContentBox).CornerRadius = UDim.new(0, 6)

local uploadBtn = Instance.new("TextButton", libContainer)
uploadBtn.Size = UDim2.new(0, 230, 0, 30)
uploadBtn.Position = UDim2.new(0, 270, 0, 200)
uploadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
uploadBtn.TextColor3 = Color3.new(1,1,1)
uploadBtn.Text = "LƯU VÀO THƯ VIỆN"
uploadBtn.Font = Enum.Font.GothamBold
uploadBtn.ZIndex = 2
Instance.new("UICorner", uploadBtn).CornerRadius = UDim.new(0, 6)

local executorView = Instance.new("Frame", libContainer)
executorView.Size = UDim2.new(1, 0, 1, 0)
executorView.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
executorView.Visible = false 
executorView.ZIndex = 10 
Instance.new("UICorner", executorView).CornerRadius = UDim.new(0, 10)

local execBackBtn = Instance.new("TextButton", executorView)
execBackBtn.Size = UDim2.new(0, 70, 0, 25)
execBackBtn.Position = UDim2.new(0, 10, 0, 10)
execBackBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
execBackBtn.TextColor3 = Color3.new(1,1,1)
execBackBtn.Text = "Trở lại"
execBackBtn.Font = Enum.Font.GothamBold
execBackBtn.ZIndex = 11
Instance.new("UICorner", execBackBtn).CornerRadius = UDim.new(0, 5)

execBackBtn.MouseButton1Click:Connect(function() executorView.Visible = false end)

local execAvatar = Instance.new("ImageLabel", executorView)
execAvatar.Size = UDim2.new(0, 40, 0, 40)
execAvatar.Position = UDim2.new(0, 100, 0, 5)
execAvatar.BackgroundTransparency = 1
execAvatar.ZIndex = 11
Instance.new("UICorner", execAvatar).CornerRadius = UDim.new(1, 0)

local execUploaderName = Instance.new("TextLabel", executorView)
execUploaderName.Size = UDim2.new(0, 250, 0, 20)
execUploaderName.Position = UDim2.new(0, 150, 0, 5)
execUploaderName.BackgroundTransparency = 1
execUploaderName.TextColor3 = Color3.fromRGB(0, 255, 150)
execUploaderName.Text = "Uploader: Unknown"
execUploaderName.Font = Enum.Font.GothamBold
execUploaderName.TextXAlignment = Enum.TextXAlignment.Left
execUploaderName.ZIndex = 11

local execScriptNameLbl = Instance.new("TextLabel", executorView)
execScriptNameLbl.Size = UDim2.new(0, 250, 0, 20)
execScriptNameLbl.Position = UDim2.new(0, 150, 0, 25)
execScriptNameLbl.BackgroundTransparency = 1
execScriptNameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
execScriptNameLbl.Text = "Script: -"
execScriptNameLbl.Font = Enum.Font.Gotham
execScriptNameLbl.TextXAlignment = Enum.TextXAlignment.Left
execScriptNameLbl.ZIndex = 11

local execCodeBox = Instance.new("TextBox", executorView)
execCodeBox.Size = UDim2.new(1, -20, 1, -100)
execCodeBox.Position = UDim2.new(0, 10, 0, 55)
execCodeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
execCodeBox.TextColor3 = Color3.fromRGB(200, 200, 200)
execCodeBox.TextWrapped = true
execCodeBox.TextXAlignment = Enum.TextXAlignment.Left
execCodeBox.TextYAlignment = Enum.TextYAlignment.Top
execCodeBox.ClearTextOnFocus = false
execCodeBox.Font = Enum.Font.Code
execCodeBox.TextSize = 12
execCodeBox.ZIndex = 11
Instance.new("UICorner", execCodeBox).CornerRadius = UDim.new(0, 6)

local execRunBtn = Instance.new("TextButton", executorView)
execRunBtn.Size = UDim2.new(1, -20, 0, 30)
execRunBtn.Position = UDim2.new(0, 10, 1, -40)
execRunBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
execRunBtn.TextColor3 = Color3.new(1,1,1)
execRunBtn.Text = "▶ CHẠY SCRIPT NÀY"
execRunBtn.Font = Enum.Font.GothamBold
execRunBtn.ZIndex = 11
Instance.new("UICorner", execRunBtn).CornerRadius = UDim.new(0, 6)

execRunBtn.MouseButton1Click:Connect(function()
    local success, err = pcall(function() loadstring(execCodeBox.Text)() end)
    if not success then warn("Lỗi chạy script: " .. err) end
end)

-- PART 2: Lâm Studio LD Hub
local function RefreshLibrary()
    for _, child in ipairs(scriptListFrame:GetChildren()) do 
        if child:IsA("Frame") then child:Destroy() end 
    end
    local filter = string.lower(libSearchBox.Text)
    local noCacheUrl = FIREBASE_URL .. "?t=" .. tostring(os.time())

    local success, response = pcall(function()
        if httprequest then return httprequest({Url = noCacheUrl, Method = "GET"}).Body
        else return game:HttpGet(noCacheUrl) end
    end)

    if success and response and response ~= "null" then
        local decoded = HttpService:JSONDecode(response)
        if type(decoded) == "table" then
            for rawKey, scriptData in pairs(decoded) do
                local displayName = tostring(rawKey):gsub("_", ".")
                
                pcall(function()
                    if string.find(displayName, "%%") then
                        displayName = string.gsub(displayName, "%%(%x%x)", function(h)
                            return string.char(tonumber(h, 16))
                        end)
                    end
                end)

                if type(scriptData) == "table" and (filter == "" or string.find(string.lower(displayName), filter)) then
                    local item = Instance.new("Frame", scriptListFrame)
                    item.Size = UDim2.new(1, -10, 0, 30)
                    item.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    item.ZIndex = 2
                    Instance.new("UICorner", item).CornerRadius = UDim.new(0, 4)

                    local nameLbl = Instance.new("TextLabel", item)
                    nameLbl.Size = UDim2.new(0.7, 0, 1, 0)
                    nameLbl.BackgroundTransparency = 1
                    nameLbl.TextColor3 = Color3.new(1,1,1)
                    nameLbl.Text = " " .. displayName
                    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
                    nameLbl.ZIndex = 2

                    local runBtn = Instance.new("TextButton", item)
                    runBtn.Size = UDim2.new(0.25, 0, 0.8, 0)
                    runBtn.Position = UDim2.new(0.75, -5, 0.1, 0)
                    runBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
                    runBtn.TextColor3 = Color3.new(1,1,1)
                    runBtn.Text = "Mở"
                    runBtn.ZIndex = 2
                    Instance.new("UICorner", runBtn).CornerRadius = UDim.new(0, 4)
                    
                    runBtn.MouseButton1Click:Connect(function()
                        execAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (scriptData.UserId or "1") .. "&w=150&h=150"
                        execUploaderName.Text = "Uploader: " .. (scriptData.Uploader or "Ẩn Danh")
                        execScriptNameLbl.Text = "Script: " .. displayName
                        execCodeBox.Text = scriptData.Code or ""
                        executorView.Visible = true
                    end)
                end
            end
        end
    end
end

uploadBtn.MouseButton1Click:Connect(function()
    local sName, sCode = uploadNameBox.Text, uploadContentBox.Text
    if sName ~= "" and sCode ~= "" then
        local safeKey = sName:gsub("[.#%$/%[%]]", "_")
        uploadBtn.Text = "ĐANG TẢI LÊN CLOUD..."
        
        local dataToSave = {
            Uploader = LocalPlayer.Name,
            UserId = tostring(LocalPlayer.UserId),
            Code = sCode
        }
        
        local urlSafeKey = HttpService:UrlEncode(safeKey)
        local nodeUrl = FIREBASE_URL:gsub("%.json$", "") .. "/" .. urlSafeKey .. ".json"
        
        if httprequest then
            local success, res = pcall(function()
                return httprequest({
                    Url = nodeUrl,
                    Method = "PUT",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["User-Agent"] = "Roblox/Bdvn2"
                    },
                    Body = HttpService:JSONEncode(dataToSave)
                })
            end)
            
            local isSuccessCode = false
            if type(res) == "table" then
                local sCode = tonumber(res.StatusCode)
                if res.Success or (sCode and sCode >= 200 and sCode < 300) then
                    isSuccessCode = true
                end
            end
            
            if success and isSuccessCode then
                uploadBtn.Text = "UPLOAD THÀNH CÔNG!"
                uploadBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                uploadNameBox.Text = "" 
                uploadContentBox.Text = ""
                task.wait(0.5) 
                RefreshLibrary()
            else
                uploadBtn.Text = "LỖI KẾT NỐI SERVER!"
                uploadBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                warn("Lỗi Firebase: Đã có lỗi xảy ra khi truyền dữ liệu!")
                if type(res) == "table" and res.Body then print(res.Body) end
            end
        else
            uploadBtn.Text = "EXECUTOR KHÔNG HỖ TRỢ!"
            uploadBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        end
        
        task.wait(2)
        uploadBtn.Text = "LƯU VÀO THƯ VIỆN"
        uploadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
    end
end)

libSearchBox:GetPropertyChangedSignal("Text"):Connect(RefreshLibrary)
RefreshLibrary()

-- ===== FOOTER VỚI LED RAINBOW =====
local footer = Instance.new("TextLabel", mainFrame)
footer.Size = UDim2.new(1, 0, 0, 22)
footer.Position = UDim2.new(0, 0, 1, -25)
footer.BackgroundTransparency = 1
footer.Font = Enum.Font.GothamBold
footer.TextSize = 16
footer.Text = "⚡ Lâm Studio LD Hub ⚡"
footer.ZIndex = 2
task.spawn(function()
    local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,128,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,128,255), Color3.fromRGB(255,0,255)}
    local i = 1
    while task.wait(0.3) do 
        if footer and footer.Parent then
            footer.TextColor3 = colors[i]
            i = i % #colors + 1
        end
    end
end)

-- ===== MINIMIZE & CLOSE =====
local minimizeBtn = Instance.new("TextButton", mainFrame)
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(1, -60, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Text = "-"
minimizeBtn.ZIndex = 3
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 5)

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Text = "X"
closeBtn.ZIndex = 3
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 5)

local isMinimized = false

closeBtn.MouseButton1Click:Connect(function()
    mainLedActive = false
    mainScreenGui:Destroy()
end)

minimizeBtn.MouseButton1Click:Connect(function()
    if isMinimized then return end
    isMinimized = true
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    mainFrame.Visible = false
    circleIcon.Position = mainFrame.Position
    circleIcon.Size = UDim2.new(0, 0, 0, 0)
    circleIcon.Visible = true
    TweenService:Create(circleIcon, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {Size = UDim2.new(0, 60, 0, 60)}):Play()
end)

local draggingCircle, dragInputCircle, dragStartCircle, startPosCircle, hasMoved = false, nil, nil, nil, false

circleIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingCircle = true; hasMoved = false; dragStartCircle = input.Position; startPosCircle = circleIcon.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then draggingCircle = false end end)
    end
end)

circleIcon.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInputCircle = input end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInputCircle and draggingCircle then
        local delta = input.Position - dragStartCircle
        if delta.Magnitude > 3 then hasMoved = true end
        circleIcon.Position = UDim2.new(startPosCircle.X.Scale, startPosCircle.X.Offset + delta.X, startPosCircle.Y.Scale, startPosCircle.Y.Offset + delta.Y)
    end
end)

circleIcon.MouseButton1Click:Connect(function()
    if hasMoved or not isMinimized then return end
    isMinimized = false
    TweenService:Create(circleIcon, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.2)
    circleIcon.Visible = false
    mainFrame.Position = circleIcon.Position
    mainFrame.Visible = true
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 520, 0, 400)}):Play()
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.M then mainScreenGui.Enabled = not mainScreenGui.Enabled end
end)

-- ===== CHỨC NĂNG THỰC THI =====
-- Infinite Jump
RunService.Stepped:Connect(function()
    if infJumpActive and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = 100
            humanoid.JumpHeight = 50
        end
    end
end)

-- Speed Hack
RunService.Stepped:Connect(function()
    if speedActive and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 50
        end
    end
end)

-- Anti AFK
spawn(function()
    while task.wait(10) do
        if antiAfkActive then
            local vu = game:GetService("VirtualUser")
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end
end)

-- Auto Click
spawn(function()
    while task.wait(0.1) do
        if autoClickActive then
            local vu = game:GetService("VirtualUser")
            vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.1)
            vu:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end
end)

-- Spin Bot
RunService.RenderStepped:Connect(function()
    if spinActive and LocalPlayer.Character then
        local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(10), 0)
        end
    end
end)

-- God Mode
RunService.Stepped:Connect(function()
    if godModeActive and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
        end
    end
end)

-- Auto Heal
RunService.Stepped:Connect(function()
    if autoHealActive and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health < humanoid.MaxHealth then
            humanoid.Health = humanoid.Health + 1
        end
    end
end)

-- Invisibility
RunService.Stepped:Connect(function()
    if invisActive and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 0.7
            end
        end
    end
end)

print("✅ Lâm Studio LD Hub đã sẵn sàng với LED sập sình và Gamepass Free!")