-- ═══════════════════════════════════════════════════════════
--   TỰ ĐỘNG DỊCH SANG TIẾNG VIỆT - ROBLOX
--   Đặt trong: ServerScriptService (Script thường)
--   Yêu cầu: Bật "Allow HTTP Requests" trong Game Settings
-- ═══════════════════════════════════════════════════════════

local HttpService = game:GetService("HttpService")

-- Bộ nhớ đệm - tránh dịch trùng
local cache = {}

-- ═══════════ HÀM DỊCH ═══════════
local function dichSangTiengViet(text)
    if not text or text == "" then return text end
    if cache[text] then return cache[text] end
    
    local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=vi&dt=t&q="
        .. HttpService:UrlEncode(text)
    
    local thanhCong, phanHoi = pcall(function()
        return HttpService:GetAsync(url)
    end)
    
    if not thanhCong then
        warn("❌ Lỗi kết nối API")
        return text
    end
    
    local ok, duLieu = pcall(function()
        return HttpService:JSONDecode(phanHoi)
    end)
    
    if not ok or not duLieu or not duLieu[1] then
        return text
    end
    
    local banDich = ""
    for _, phan in ipairs(duLieu[1]) do
        if phan[1] then
            banDich = banDich .. phan[1]
        end
    end
    
    banDich = (banDich ~= "" and banDich) or text
    cache[text] = banDich
    return banDich
end

-- ═══════════ DỊCH 1 OBJECT ═══════════
local function dichObject(obj)
    if obj:IsA("TextLabel") 
    or obj:IsA("TextButton") 
    or obj:IsA("TextBox") 
    or obj:IsA("Text") then
        
        local vanBanGoc = obj.Text
        if vanBanGoc and vanBanGoc ~= "" then
            task.spawn(function()
                local banDich = dichSangTiengViet(vanBanGoc)
                if obj and obj.Parent then
                    obj.Text = banDich
                end
            end)
        end
    end
end

-- ═══════════ DỊCH TOÀN BỘ GAME ═══════════
local function dichTatCa(root)
    for _, obj in ipairs(root:GetDescendants()) do
        dichObject(obj)
    end
end

-- ═══════════ CHẠY ═══════════
print("🇻🇳 Bắt đầu dịch toàn bộ game sang tiếng Việt...")

dichTatCa(game)

-- Theo dõi object mới xuất hiện (UI, NPC, tool...)
game.DescendantAdded:Connect(function(obj)
    task.wait(0.2)
    dichObject(obj)
end)

print("✅ Đã dịch xong! Đang theo dõi các object mới...")
