-- ═══════════════════════════════════════════════════════════
--   TRÌNH DỊCH TIẾNG VIỆT - ROBLOX UI
--   Đặt trong: StarterPlayer > StarterPlayerScripts
--   Yêu cầu: Bật "Allow HTTP Requests" trong Game Settings
-- ═══════════════════════════════════════════════════════════

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════ MÀU SẮC ═══════════
local MAU = {
    Nen        = Color3.fromRGB(24, 24, 32),
    Panel      = Color3.fromRGB(34, 34, 45),
    O_Nhap     = Color3.fromRGB(45, 45, 60),
    Chinh      = Color3.fromRGB(88, 101, 242),
    ChinhHover = Color3.fromRGB(108, 121, 255),
    ThanhCong  = Color3.fromRGB(87, 242, 135),
    Chu        = Color3.fromRGB(255, 255, 255),
    ChuMo      = Color3.fromRGB(160, 160, 175),
    CanhBao    = Color3.fromRGB(255, 200, 100),
    Loi        = Color3.fromRGB(255, 100, 100),
}

-- ═══════════ HÀM DỊCH ═══════════
local cache = {}

local function dichSangTiengViet(text, ngonNguGoc)
    ngonNguGoc = ngonNguGoc or "auto"
    if not text or text == "" then return "" end
    if cache[text] then return cache[text] end
    
    local url = string.format(
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=vi&dt=t&q=%s",
        ngonNguGoc,
        HttpService:UrlEncode(text)
    )
    
    local ok, phanHoi = pcall(function()
        return HttpService:GetAsync(url)
    end)
    
    if not ok then return nil, "Không kết nối được API" end
    
    local ok2, duLieu = pcall(function()
        return HttpService:JSONDecode(phanHoi)
    end)
    
    if not ok2 or not duLieu or not duLieu[1] then
        return nil, "Lỗi dữ liệu"
    end
    
    local banDich = ""
    for _, phan in ipairs(duLieu[1]) do
        if phan[1] then
            banDich = banDich .. phan[1]
        end
    end
    
    if banDich == "" then return nil, "Không dịch được" end
    
    cache[text] = banDich
    return banDich
end

-- ═══════════ TẠO UI ═══════════
local oldGui = playerGui:FindFirstChild("TrinhDichVN")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrinhDichVN"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ─────── NÚT MỞ (🌐) ───────
local nutMo = Instance.new("TextButton")
nutMo.Name = "NutMo"
nutMo.Size = UDim2.new(0, 55, 0, 55)
nutMo.Position = UDim2.new(0, 20, 0.5, -27)
nutMo.BackgroundColor3 = MAU.Chinh
nutMo.Text = "🌐"
nutMo.TextSize = 28
nutMo.Font = Enum.Font.GothamBold
nutMo.TextColor3 = MAU.Chu
nutMo.AutoButtonColor = false
nutMo.Parent = screenGui

local nutMoCorner = Instance.new("UICorner")
nutMoCorner.CornerRadius = UDim.new(1, 0)
nutMoCorner.Parent = nutMo

local nutMoStroke = Instance.new("UIStroke")
nutMoStroke.Color = MAU.ChinhHover
nutMoStroke.Thickness = 2
nutMoStroke.Parent = nutMo

-- ─────── KHUNG CHÍNH ───────
local khungChinh = Instance.new("Frame")
khungChinh.Name = "KhungChinh"
khungChinh.Size = UDim2.new(0, 480, 0, 420)
khungChinh.Position = UDim2.new(0.5, -240, 0.5, -210)
khungChinh.BackgroundColor3 = MAU.Nen
khungChinh.BorderSizePixel = 0
khungChinh.Visible = false
khungChinh.Active = true
khungChinh.Draggable = true
khungChinh.Parent = screenGui

local khungCorner = Instance.new("UICorner")
khungCorner.CornerRadius = UDim.new(0, 14)
khungCorner.Parent = khungChinh

local khungStroke = Instance.new("UIStroke")
khungStroke.Color = MAU.Chinh
khungStroke.Thickness = 1.5
khungStroke.Transparency = 0.3
khungStroke.Parent = khungChinh

-- ─────── HEADER ───────
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = MAU.Panel
header.BorderSizePixel = 0
header.Parent = khungChinh

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0, 15)
headerFix.Position = UDim2.new(0, 0, 1, -15)
headerFix.BackgroundColor3 = MAU.Panel
headerFix.BorderSizePixel = 0
headerFix.Parent = header

local tieuDe = Instance.new("TextLabel")
tieuDe.Size = UDim2.new(1, -60, 1, 0)
tieuDe.Position = UDim2.new(0, 20, 0, 0)
tieuDe.BackgroundTransparency = 1
tieuDe.Text = "🌐  Dịch Sang Tiếng Việt"
tieuDe.TextColor3 = MAU.Chu
tieuDe.Font = Enum.Font.GothamBold
tieuDe.TextSize = 18
tieuDe.TextXAlignment = Enum.TextXAlignment.Left
tieuDe.Parent = header

-- Nút đóng
local nutDong = Instance.new("TextButton")
nutDong.Size = UDim2.new(0, 32, 0, 32)
nutDong.Position = UDim2.new(1, -42, 0.5, -16)
nutDong.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
nutDong.Text = "✕"
nutDong.TextColor3 = MAU.Chu
nutDong.Font = Enum.Font.GothamBold
nutDong.TextSize = 14
nutDong.AutoButtonColor = false
nutDong.Parent = header

local nutDongCorner = Instance.new("UICorner")
nutDongCorner.CornerRadius = UDim.new(1, 0)
nutDongCorner.Parent = nutDong

-- ─────── NHÃN GỐC ───────
local nhanGoc = Instance.new("TextLabel")
nhanGoc.Size = UDim2.new(1, -40, 0, 20)
nhanGoc.Position = UDim2.new(0, 20, 0, 65)
nhanGoc.BackgroundTransparency = 1
nhanGoc.Text = "📝  Văn bản gốc"
nhanGoc.TextColor3 = MAU.ChuMo
nhanGoc.Font = Enum.Font.GothamMedium
nhanGoc.TextSize = 13
nhanGoc.TextXAlignment = Enum.TextXAlignment.Left
nhanGoc.Parent = khungChinh

-- ─────── Ô NHẬP ───────
local oNhapFrame = Instance.new("Frame")
oNhapFrame.Size = UDim2.new(1, -40, 0, 90)
oNhapFrame.Position = UDim2.new(0, 20, 0, 90)
oNhapFrame.BackgroundColor3 = MAU.O_Nhap
oNhapFrame.BorderSizePixel = 0
oNhapFrame.Parent = khungChinh

local oNhapCorner = Instance.new("UICorner")
oNhapCorner.CornerRadius = UDim.new(0, 10)
oNhapCorner.Parent = oNhapFrame

local oNhapStroke = Instance.new("UIStroke")
oNhapStroke.Color = MAU.Chinh
oNhapStroke.Thickness = 1
oNhapStroke.Transparency = 0.6
oNhapStroke.Parent = oNhapFrame

local oNhap = Instance.new("TextBox")
oNhap.Size = UDim2.new(1, -20, 1, -20)
oNhap.Position = UDim2.new(0, 10, 0, 10)
oNhap.BackgroundTransparency = 1
oNhap.Text = ""
oNhap.PlaceholderText = "Nhập văn bản cần dịch ở đây..."
oNhap.PlaceholderColor3 = MAU.ChuMo
oNhap.TextColor3 = MAU.Chu
oNhap.Font = Enum.Font.Gotham
oNhap.TextSize = 14
oNhap.TextXAlignment = Enum.TextXAlignment.Left
oNhap.TextYAlignment = Enum.TextYAlignment.Top
oNhap.TextWrapped = true
oNhap.MultiLine = true
oNhap.ClearTextOnFocus = false
oNhap.Parent = oNhapFrame

-- ─────── HÀNG NÚT ───────
local hangNut = Instance.new("Frame")
hangNut.Size = UDim2.new(1, -40, 0, 44)
hangNut.Position = UDim2.new(0, 20, 0, 190)
hangNut.BackgroundTransparency = 1
hangNut.Parent = khungChinh

-- Nút DỊCH
local nutDich = Instance.new("TextButton")
nutDich.Size = UDim2.new(0.6, -5, 1, 0)
nutDich.BackgroundColor3 = MAU.Chinh
nutDich.Text = "🔤  DỊCH"
nutDich.TextColor3 = MAU.Chu
nutDich.Font = Enum.Font.GothamBold
nutDich.TextSize = 15
nutDich.AutoButtonColor = false
nutDich.Parent = hangNut

local nutDichCorner = Instance.new("UICorner")
nutDichCorner.CornerRadius = UDim.new(0, 10)
nutDichCorner.Parent = nutDich

-- Nút XÓA
local nutXoa = Instance.new("TextButton")
nutXoa.Size = UDim2.new(0.4, -5, 1, 0)
nutXoa.Position = UDim2.new(0.6, 5, 0, 0)
nutXoa.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
nutXoa.Text = "🗑  XÓA"
nutXoa.TextColor3 = MAU.Chu
nutXoa.Font = Enum.Font.GothamBold
nutXoa.TextSize = 15
nutXoa.AutoButtonColor = false
nutXoa.Parent = hangNut

local nutXoaCorner = Instance.new("UICorner")
nutXoaCorner.CornerRadius = UDim.new(0, 10)
nutXoaCorner.Parent = nutXoa

-- ─────── NHÃN KẾT QUẢ ───────
local nhanKQ = Instance.new("TextLabel")
nhanKQ.Size = UDim2.new(1, -40, 0, 20)
nhanKQ.Position = UDim2.new(0, 20, 0, 245)
nhanKQ.BackgroundTransparency = 1
nhanKQ.Text = "🇻🇳  Bản dịch tiếng Việt"
nhanKQ.TextColor3 = MAU.ChuMo
nhanKQ.Font = Enum.Font.GothamMedium
nhanKQ.TextSize = 13
nhanKQ.TextXAlignment = Enum.TextXAlignment.Left
nhanKQ.Parent = khungChinh

-- ─────── Ô KẾT QUẢ ───────
local oKQFrame = Instance.new("Frame")
oKQFrame.Size = UDim2.new(1, -40, 0, 130)
oKQFrame.Position = UDim2.new(0, 20, 0, 270)
oKQFrame.BackgroundColor3 = MAU.Panel
oKQFrame.BorderSizePixel = 0
oKQFrame.Parent = khungChinh

local oKQCorner = Instance.new("UICorner")
oKQCorner.CornerRadius = UDim.new(0, 10)
oKQCorner.Parent = oKQFrame

local oKQStroke = Instance.new("UIStroke")
oKQStroke.Color = MAU.ThanhCong
oKQStroke.Thickness = 1
oKQStroke.Transparency = 0.6
oKQStroke.Parent = oKQFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 12)
padding.PaddingRight = UDim.new(0, 12)
padding.Parent = oKQFrame

local chuKQ = Instance.new("TextLabel")
chuKQ.Size = UDim2.new(1, 0, 1, 0)
chuKQ.BackgroundTransparency = 1
chuKQ.Text = "Kết quả sẽ hiện ở đây..."
chuKQ.TextColor3 = MAU.ChuMo
chuKQ.Font = Enum.Font.Gotham
chuKQ.TextSize = 14
chuKQ.TextXAlignment = Enum.TextXAlignment.Left
chuKQ.TextYAlignment = Enum.TextYAlignment.Top
chuKQ.TextWrapped = true
chuKQ.Parent = oKQFrame

-- ═══════════ HIỆU ỨNG HOVER ═══════════
local function themHover(nut, mauThuong, mauHover)
    nut.MouseEnter:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {
            BackgroundColor3 = mauHover
        }):Play()
    end)
    nut.MouseLeave:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {
            BackgroundColor3 = mauThuong
        }):Play()
    end)
end

themHover(nutMo, MAU.Chinh, MAU.ChinhHover)
themHover(nutDich, MAU.Chinh, MAU.ChinhHover)
themHover(nutXoa, Color3.fromRGB(60, 60, 75), Color3.fromRGB(80, 80, 100))
themHover(nutDong, Color3.fromRGB(255, 80, 80), Color3.fromRGB(255, 110, 110))

-- ═══════════ MỞ/ĐÓNG UI ═══════════
local dangMo = false

local function batTatUI()
    dangMo = not dangMo
    
    if dangMo then
        khungChinh.Visible = true
        khungChinh.Size = UDim2.new(0, 0, 0, 0)
        khungChinh.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        TweenService:Create(khungChinh, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 480, 0, 420),
            Position = UDim2.new(0.5, -240, 0.5, -210)
        }):Play()
    else
        local tween = TweenService:Create(khungChinh, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            khungChinh.Visible = false
        end)
    end
end

nutMo.MouseButton1Click:Connect(batTatUI)
nutDong.MouseButton1Click:Connect(batTatUI)

-- ═══════════ NÚT DỊCH ═══════════
nutDich.MouseButton1Click:Connect(function()
    local text = oNhap.Text
    
    if text == "" then
        chuKQ.Text = "⚠️  Vui lòng nhập văn bản cần dịch!"
        chuKQ.TextColor3 = MAU.CanhBao
        return
    end
    
    chuKQ.Text = "⏳  Đang dịch..."
    chuKQ.TextColor3 = MAU.CanhBao
    nutDich.Text = "⏳  Đang dịch..."
    nutDich.BackgroundColor3 = MAU.CanhBao
    
    task.spawn(function()
        local ketQua, loi = dichSangTiengViet(text)
        
        if ketQua then
            chuKQ.Text = "➜  " .. ketQua
            chuKQ.TextColor3 = MAU.ThanhCong
        else
            chuKQ.Text = "❌  " .. (loi or "Lỗi không xác định")
            chuKQ.TextColor3 = MAU.Loi
        end
        
        nutDich.Text = "🔤  DỊCH"
        nutDich.BackgroundColor3 = MAU.Chinh
    end)
end)

-- ═══════════ NÚT XÓA ═══════════
nutXoa.MouseButton1Click:Connect(function()
    oNhap.Text = ""
    chuKQ.Text = "Kết quả sẽ hiện ở đây..."
    chuKQ.TextColor3 = MAU.ChuMo
end)

-- ═══════════ PHÍM TẮT: RightCtrl ═══════════
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        batTatUI()
    end
end)

print("✅ [Trình Dịch VN] Đã load thành công!")
print("💡 Nhấn RightCtrl hoặc nút 🌐 để mở/đóng")
