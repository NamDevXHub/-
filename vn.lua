-- ═══════════════════════════════════════════════════════════
--   DỊCH CHỮ ROBLOX SANG TIẾNG VIỆT - FULL
--   Đặt trong: StarterPlayer > StarterPlayerScripts (LocalScript)
--   KHÔNG CẦN HTTP REQUESTS!
-- ═══════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════
--   TỪ ĐIỂN
-- ═══════════════════════════════════════════════════════════
local TD = {
-- UI
["Play"]="Chơi",["Start"]="Bắt đầu",["Stop"]="Dừng",["Pause"]="Tạm dừng",["Resume"]="Tiếp tục",
["Restart"]="Chơi lại",["Exit"]="Thoát",["Quit"]="Thoát",["Close"]="Đóng",["Open"]="Mở",
["Back"]="Quay lại",["Next"]="Tiếp",["Previous"]="Trước",["Continue"]="Tiếp tục",
["Cancel"]="Hủy",["Confirm"]="Xác nhận",["Yes"]="Có",["No"]="Không",["OK"]="Đồng ý",
["Save"]="Lưu",["Load"]="Tải",["Delete"]="Xóa",["Edit"]="Sửa",["Apply"]="Áp dụng",
["Reset"]="Đặt lại",["Submit"]="Gửi",["Send"]="Gửi",["Skip"]="Bỏ qua",["Retry"]="Thử lại",
["Refresh"]="Làm mới",["Update"]="Cập nhật",["Download"]="Tải xuống",["Upload"]="Tải lên",
["Share"]="Chia sẻ",["Copy"]="Sao chép",["Paste"]="Dán",["Cut"]="Cắt",["Select"]="Chọn",
["Search"]="Tìm kiếm",["Filter"]="Lọc",["Sort"]="Sắp xếp",["View"]="Xem",["Hide"]="Ẩn",
["Show"]="Hiện",["New"]="Mới",["Create"]="Tạo",["Add"]="Thêm",["Remove"]="Xóa",
["Insert"]="Chèn",["Rename"]="Đổi tên",["Move"]="Di chuyển",["Equip"]="Trang bị",
["Unequip"]="Tháo",["Use"]="Sử dụng",["Buy"]="Mua",["Sell"]="Bán",["Trade"]="Trao đổi",
["Give"]="Cho",["Take"]="Lấy",["Drop"]="Bỏ",["Craft"]="Chế tạo",["Repair"]="Sửa chữa",
-- Menu
["Menu"]="Menu",["Main Menu"]="Menu chính",["Settings"]="Cài đặt",["Options"]="Tùy chọn",
["Config"]="Cấu hình",["Help"]="Trợ giúp",["Support"]="Hỗ trợ",["About"]="Giới thiệu",
["Contact"]="Liên hệ",["Info"]="Thông tin",["Information"]="Thông tin",["Details"]="Chi tiết",
["Description"]="Mô tả",["Tutorial"]="Hướng dẫn",["Guide"]="Hướng dẫn",["Profile"]="Hồ sơ",
["Account"]="Tài khoản",["Login"]="Đăng nhập",["Logout"]="Đăng xuất",["Sign In"]="Đăng nhập",
["Sign Up"]="Đăng ký",["Register"]="Đăng ký",["Username"]="Tên đăng nhập",
["Password"]="Mật khẩu",["Email"]="Email",["Name"]="Tên",["Nickname"]="Biệt danh",
["Avatar"]="Ảnh đại diện",["Status"]="Trạng thái",["Gender"]="Giới tính",["Male"]="Nam",
["Female"]="Nữ",["Other"]="Khác",["Age"]="Tuổi",["Birthday"]="Sinh nhật",
-- Game
["Game"]="Trò chơi",["Games"]="Trò chơi",["Player"]="Người chơi",["Players"]="Người chơi",
["User"]="Người dùng",["Users"]="Người dùng",["Guest"]="Khách",["Host"]="Chủ phòng",
["Enemy"]="Kẻ địch",["Enemies"]="Kẻ địch",["Opponent"]="Đối thủ",["Rival"]="Đối thủ",
["Boss"]="Trùm",["Mini Boss"]="Trùm nhỏ",["Monster"]="Quái vật",["Mob"]="Quái",
["Creature"]="Sinh vật",["Beast"]="Dã thú",["Animal"]="Động vật",["NPC"]="NPC",
["Friend"]="Bạn",["Friends"]="Bạn bè",["Best Friend"]="Bạn thân",["Team"]="Đội",
["Teammate"]="Đồng đội",["Guild"]="Bang hội",["Clan"]="Bang",["Party"]="Nhóm",
["Group"]="Nhóm",["Squad"]="Tiểu đội",["Alliance"]="Liên minh",["Ally"]="Đồng minh",
["Owner"]="Chủ sở hữu",["Admin"]="Quản trị viên",["Moderator"]="Người điều hành",
["Mod"]="Quản trò",["Staff"]="Nhân viên",["Member"]="Thành viên",["Leader"]="Trưởng nhóm",
["Captain"]="Đội trưởng",["Master"]="Sư phụ",["Pupil"]="Học trò",["Student"]="Học sinh",
["Teacher"]="Giáo viên",["Mentor"]="Người hướng dẫn",["Beginner"]="Người mới",
["Novice"]="Tân binh",["Rookie"]="Tân binh",["Intermediate"]="Trung cấp",
["Expert"]="Chuyên gia",["Pro"]="Chuyên nghiệp",["Veteran"]="Lão làng",
["Legend"]="Huyền thoại",["Legendary"]="Huyền thoại",["Myth"]="Thần thoại",
["Hero"]="Anh hùng",["Villain"]="Ác nhân",["Champion"]="Nhà vô địch",
["Winner"]="Người thắng",["Loser"]="Người thua",
-- Chiến đấu
["Health"]="Máu",["HP"]="Máu",["Max HP"]="Máu tối đa",["Mana"]="Năng lượng",
["MP"]="Năng lượng",["Stamina"]="Thể lực",["Energy"]="Năng lượng",["Vitality"]="Sinh lực",
["Life"]="Mạng",["Lives"]="Mạng",["Damage"]="Sát thương",["DPS"]="Sát thương/giây",
["Attack"]="Tấn công",["Defense"]="Phòng thủ",["Defence"]="Phòng thủ",["Armor"]="Giáp",
["Resistance"]="Kháng",["Speed"]="Tốc độ",["Attack Speed"]="Tốc độ đánh",
["Movement Speed"]="Tốc độ di chuyển",["Power"]="Sức mạnh",["Strength"]="Sức mạnh",
["Agility"]="Nhanh nhẹn",["Luck"]="May mắn",["Intelligence"]="Trí tuệ",
["Wisdom"]="Khôn ngoan",["Dexterity"]="Khéo léo",["Accuracy"]="Độ chính xác",
["Critical"]="Chí mạng",["Crit"]="Chí mạng",["Crit Chance"]="Tỉ lệ chí mạng",
["Crit Damage"]="Sát thương chí mạng",["Block"]="Chặn",["Dodge"]="Né",
["Evade"]="Né tránh",["Parry"]="Đỡ đòn",["Counter"]="Phản đòn",
["Reflect"]="Phản sát thương",["Hit"]="Đánh trúng",["Miss"]="Trượt",["Kill"]="Giết",
["Kills"]="Mạng giết",["Death"]="Chết",["Deaths"]="Số lần chết",["Die"]="Chết",
["Dead"]="Đã chết",["Alive"]="Còn sống",["Respawn"]="Hồi sinh",["Revive"]="Hồi sinh",
["Reborn"]="Tái sinh",["Heal"]="Hồi máu",["Healing"]="Hồi máu",["Regen"]="Hồi phục",
["Buff"]="Tăng cường",["Debuff"]="Suy yếu",["Effect"]="Hiệu ứng",["Effects"]="Hiệu ứng",
["Skill"]="Kỹ năng",["Skills"]="Kỹ năng",["Ability"]="Khả năng",["Abilities"]="Khả năng",
["Talent"]="Tài năng",["Spell"]="Phép",["Magic"]="Phép thuật",["Ultimate"]="Tuyệt kỹ",
["Special"]="Đặc biệt",["Passive"]="Bị động",["Active"]="Chủ động",["Range"]="Tầm",
["Melee"]="Cận chiến",["Ranged"]="Tầm xa",["Cooldown"]="Hồi chiêu",["Cast"]="Niệm",
["Combo"]="Chuỗi đòn",["Streak"]="Chuỗi",["Killstreak"]="Chuỗi hạ gục",
["Headshot"]="Bắn đầu",["Assist"]="Hỗ trợ",["K/D"]="Tỉ lệ giết/chết",
-- Cấp độ
["Level"]="Cấp độ",["Lv"]="Cấp",["Lvl"]="Cấp",["Level Up"]="Lên cấp",
["Max Level"]="Cấp tối đa",["XP"]="Kinh nghiệm",["Exp"]="Kinh nghiệm",
["Experience"]="Kinh nghiệm",["Rank"]="Hạng",["Ranking"]="Xếp hạng",
["Leaderboard"]="Bảng xếp hạng",["Score"]="Điểm",["Points"]="Điểm",
["Scoreboard"]="Bảng điểm",["Tier"]="Bậc",["Grade"]="Hạng",["Class"]="Lớp",
["Stat"]="Chỉ số",["Stats"]="Chỉ số",["Statistics"]="Thống kê",["Progress"]="Tiến độ",
["Achievement"]="Thành tựu",["Achievements"]="Thành tựu",["Trophy"]="Cúp",
["Medal"]="Huy chương",["Badge"]="Huy hiệu",["Title"]="Danh hiệu",
["Reputation"]="Danh tiếng",["Fame"]="Nổi tiếng",["Glory"]="Vinh quang",
["Honor"]="Vinh dự",["Prestige"]="Uy tín",["Unlock"]="Mở khóa",["Locked"]="Đã khóa",
["Owned"]="Đã sở hữu",["Maxed"]="Tối đa",["Mastered"]="Thành thạo",
-- Tiền tệ
["Gold"]="Vàng",["Coins"]="Xu",["Coin"]="Xu",["Money"]="Tiền",["Cash"]="Tiền mặt",
["Gem"]="Đá quý",["Gems"]="Đá quý",["Diamond"]="Kim cương",["Diamonds"]="Kim cương",
["Crystal"]="Pha lê",["Ruby"]="Hồng ngọc",["Emerald"]="Ngọc lục bảo",
["Sapphire"]="Lam ngọc",["Token"]="Xu",["Tokens"]="Xu",["Ticket"]="Vé",
["Tickets"]="Vé",["Currency"]="Tiền tệ",["Balance"]="Số dư",["Wallet"]="Ví",
["Price"]="Giá",["Cost"]="Giá",["Value"]="Giá trị",["Total"]="Tổng",
["Discount"]="Giảm giá",["Sale"]="Khuyến mãi",["Free"]="Miễn phí",["Premium"]="Cao cấp",
["VIP"]="VIP",["Robux"]="Robux",["Purchase"]="Mua",["Refund"]="Hoàn tiền",
["Bank"]="Ngân hàng",["Deposit"]="Gửi",["Withdraw"]="Rút",["Salary"]="Lương",
["Bonus"]="Thưởng",["Reward"]="Phần thưởng",["Rewards"]="Phần thưởng",
-- Shop
["Shop"]="Cửa hàng",["Store"]="Cửa hàng",["Market"]="Chợ",["Marketplace"]="Chợ",
["Offer"]="Đề nghị",["Deal"]="Giao dịch",["Bid"]="Đặt giá",["Auction"]="Đấu giá",
["Cart"]="Giỏ hàng",["Checkout"]="Thanh toán",["Order"]="Đơn hàng",
["Inventory"]="Túi đồ",["Backpack"]="Ba lô",["Bag"]="Túi",["Item"]="Vật phẩm",
["Items"]="Vật phẩm",["Product"]="Sản phẩm",["Products"]="Sản phẩm",
["Equipment"]="Trang bị",["Gear"]="Đồ",["Tool"]="Công cụ",["Weapon"]="Vũ khí",
["Weapons"]="Vũ khí",["Armor"]="Giáp",["Helmet"]="Mũ",["Hat"]="Mũ",["Shield"]="Khiên",
["Sword"]="Kiếm",["Axe"]="Rìu",["Bow"]="Cung",["Arrow"]="Mũi tên",["Gun"]="Súng",
["Pistol"]="Súng lục",["Rifle"]="Súng trường",["Shotgun"]="Súng săn",
["Sniper"]="Súng bắn tỉa",["Knife"]="Dao",["Dagger"]="Dao găm",["Spear"]="Giáo",
["Staff"]="Gậy",["Wand"]="Đũa phép",["Potion"]="Thuốc",["Elixir"]="Tiên dược",
["Scroll"]="Cuộn giấy",["Book"]="Sách",["Tome"]="Sách cổ",["Map"]="Bản đồ",
["Key"]="Chìa khóa",["Keys"]="Chìa khóa",["Chest"]="Rương",["Box"]="Hộp",
["Crate"]="Thùng",["Barrel"]="Thùng phuy",["Gift"]="Quà",["Present"]="Quà tặng",
["Loot"]="Chiến lợi phẩm",["Rarity"]="Độ hiếm",["Common"]="Phổ thông",
["Uncommon"]="Ít gặp",["Rare"]="Hiếm",["Epic"]="Sử thi",["Mythical"]="Thần thoại",
["Divine"]="Thần thánh",["Godly"]="Thần cấp",["Unique"]="Độc nhất",
["Exclusive"]="Độc quyền",["Limited"]="Giới hạn",
-- Nhiệm vụ
["Quest"]="Nhiệm vụ",["Quests"]="Nhiệm vụ",["Mission"]="Nhiệm vụ",
["Missions"]="Nhiệm vụ",["Task"]="Nhiệm vụ",["Tasks"]="Nhiệm vụ",
["Objective"]="Mục tiêu",["Objectives"]="Mục tiêu",["Goal"]="Mục tiêu",
["Target"]="Mục tiêu",["Challenge"]="Thử thách",["Daily"]="Hàng ngày",
["Weekly"]="Hàng tuần",["Monthly"]="Hàng tháng",["Event"]="Sự kiện",
["Events"]="Sự kiện",["Season"]="Mùa",["Season Pass"]="Vé mùa",
["Battle Pass"]="Vé trận đấu",["Complete"]="Hoàn thành",
["Completed"]="Đã hoàn thành",["Finish"]="Kết thúc",["Finished"]="Đã xong",
["Failed"]="Thất bại",["Success"]="Thành công",["Win"]="Thắng",
["Victory"]="Chiến thắng",["Lose"]="Thua",["Defeat"]="Thất bại",["Draw"]="Hòa",
["Tie"]="Hòa",["In Progress"]="Đang tiến hành",["Pending"]="Đang chờ",
["Available"]="Có sẵn",["Ready"]="Sẵn sàng",
-- Thông báo
["Notification"]="Thông báo",["Notifications"]="Thông báo",["Message"]="Tin nhắn",
["Messages"]="Tin nhắn",["Chat"]="Trò chuyện",["Alert"]="Cảnh báo",
["Warning"]="Cảnh báo",["Error"]="Lỗi",["Errors"]="Lỗi",["Notice"]="Thông báo",
["Announcement"]="Thông cáo",["Loading"]="Đang tải",["Loaded"]="Đã tải",
["Please Wait"]="Vui lòng đợi",["Wait"]="Đợi",["Processing"]="Đang xử lý",
["Connecting"]="Đang kết nối",["Connected"]="Đã kết nối",
["Disconnected"]="Đã ngắt",["Online"]="Trực tuyến",["Offline"]="Ngoại tuyến",
["Busy"]="Bận",["Welcome"]="Chào mừng",["Goodbye"]="Tạm biệt",
["Hello"]="Xin chào",["Hi"]="Chào",["Hey"]="Này",["Thanks"]="Cảm ơn",
["Thank You"]="Cảm ơn bạn",["Sorry"]="Xin lỗi",["Please"]="Làm ơn",
["Congrats"]="Chúc mừng",["Congratulations"]="Chúc mừng",
["Good Luck"]="Chúc may mắn",["Good Job"]="Làm tốt lắm",["Well Done"]="Làm tốt",
["Amazing"]="Tuyệt vời",["Awesome"]="Tuyệt vời",["Great"]="Tuyệt",["Good"]="Tốt",
["Bad"]="Tệ",["Excellent"]="Xuất sắc",["Perfect"]="Hoàn hảo",
["Fantastic"]="Tuyệt vời",["Nice"]="Tốt",["Cool"]="Ngầu",["Easy"]="Dễ",
["Normal"]="Bình thường",["Hard"]="Khó",["Difficult"]="Khó",
["Impossible"]="Bất khả thi",["Fun"]="Vui",["Boring"]="Chán",
-- Cài đặt
["Sound"]="Âm thanh",["Music"]="Nhạc",["Volume"]="Âm lượng",["Audio"]="Âm thanh",
["Graphics"]="Đồ họa",["Quality"]="Chất lượng",["Language"]="Ngôn ngữ",
["English"]="Tiếng Anh",["Vietnamese"]="Tiếng Việt",["Chinese"]="Tiếng Trung",
["Japanese"]="Tiếng Nhật",["Korean"]="Tiếng Hàn",["Spanish"]="Tiếng Tây Ban Nha",
["French"]="Tiếng Pháp",["German"]="Tiếng Đức",["Russian"]="Tiếng Nga",
["On"]="Bật",["Off"]="Tắt",["Enable"]="Bật",["Disable"]="Tắt",
["Enabled"]="Đã bật",["Disabled"]="Đã tắt",["Brightness"]="Độ sáng",
["Resolution"]="Độ phân giải",["Fullscreen"]="Toàn màn hình",["Windowed"]="Cửa sổ",
["FPS"]="FPS",["Frame Rate"]="Tốc độ khung hình",["Low"]="Thấp",
["Medium"]="Trung bình",["High"]="Cao",["Ultra"]="Cực cao",["Default"]="Mặc định",
["Custom"]="Tùy chỉnh",["Advanced"]="Nâng cao",["Basic"]="Cơ bản",
["Simple"]="Đơn giản",["Auto"]="Tự động",["Manual"]="Thủ công",
["Keyboard"]="Bàn phím",["Mouse"]="Chuột",["Controller"]="Tay cầm",
["Gamepad"]="Tay cầm",["Touch"]="Cảm ứng",["Keybind"]="Phím tắt",
-- Thời gian
["Time"]="Thời gian",["Date"]="Ngày",["Day"]="Ngày",["Days"]="Ngày",
["Week"]="Tuần",["Weeks"]="Tuần",["Month"]="Tháng",["Months"]="Tháng",
["Year"]="Năm",["Years"]="Năm",["Hour"]="Giờ",["Hours"]="Giờ",["Minute"]="Phút",
["Minutes"]="Phút",["Second"]="Giây",["Seconds"]="Giây",["Today"]="Hôm nay",
["Tomorrow"]="Ngày mai",["Yesterday"]="Hôm qua",["Now"]="Bây giờ",["Later"]="Sau",
["Soon"]="Sớm",["Always"]="Luôn",["Never"]="Không bao giờ",["Sometimes"]="Đôi khi",
["Often"]="Thường xuyên",["Rarely"]="Hiếm khi",["Morning"]="Buổi sáng",
["Afternoon"]="Buổi chiều",["Evening"]="Buổi tối",["Night"]="Ban đêm",
["Noon"]="Buổi trưa",["Midnight"]="Nửa đêm",["Spring"]="Mùa xuân",
["Summer"]="Mùa hè",["Fall"]="Mùa thu",["Autumn"]="Mùa thu",["Winter"]="Mùa đông",
["Monday"]="Thứ Hai",["Tuesday"]="Thứ Ba",["Wednesday"]="Thứ Tư",
["Thursday"]="Thứ Năm",["Friday"]="Thứ Sáu",["Saturday"]="Thứ Bảy",
["Sunday"]="Chủ Nhật",["January"]="Tháng Một",["February"]="Tháng Hai",
["March"]="Tháng Ba",["April"]="Tháng Tư",["May"]="Tháng Năm",["June"]="Tháng Sáu",
["July"]="Tháng Bảy",["August"]="Tháng Tám",["September"]="Tháng Chín",
["October"]="Tháng Mười",["November"]="Tháng Mười Một",["December"]="Tháng Mười Hai",
-- Số đếm
["Zero"]="Không",["One"]="Một",["Two"]="Hai",["Three"]="Ba",["Four"]="Bốn",
["Five"]="Năm",["Six"]="Sáu",["Seven"]="Bảy",["Eight"]="Tám",["Nine"]="Chín",
["Ten"]="Mười",["Twenty"]="Hai mươi",["Thirty"]="Ba mươi",["Fifty"]="Năm mươi",
["Hundred"]="Trăm",["Thousand"]="Nghìn",["Million"]="Triệu",["Billion"]="Tỷ",
["First"]="Đầu tiên",["Second"]="Thứ hai",["Third"]="Thứ ba",["Last"]="Cuối cùng",
["Final"]="Chung kết",["Beginning"]="Bắt đầu",["End"]="Kết thúc",
["Half"]="Một nửa",["Double"]="Gấp đôi",["Triple"]="Gấp ba",["Single"]="Đơn",
["Few"]="Ít",["Many"]="Nhiều",["Some"]="Một vài",["All"]="Tất cả",
["None"]="Không có",["Every"]="Mọi",["Each"]="Mỗi",["Both"]="Cả hai",
["More"]="Nhiều hơn",["Less"]="Ít hơn",["Most"]="Nhiều nhất",["Enough"]="Đủ",
-- Màu sắc
["Red"]="Đỏ",["Blue"]="Xanh dương",["Green"]="Xanh lá",["Yellow"]="Vàng",
["Orange"]="Cam",["Purple"]="Tím",["Pink"]="Hồng",["Brown"]="Nâu",["Black"]="Đen",
["White"]="Trắng",["Gray"]="Xám",["Grey"]="Xám",["Silver"]="Bạc",
["Golden"]="Vàng kim",["Cyan"]="Xanh lơ",["Navy"]="Xanh hải quân",
["Violet"]="Tím violet",["Indigo"]="Chàm",["Rainbow"]="Cầu vồng",
["Bright"]="Sáng",["Dark"]="Tối",["Light"]="Nhạt",
-- Động vật
["Dog"]="Chó",["Cat"]="Mèo",["Bird"]="Chim",["Fish"]="Cá",["Horse"]="Ngựa",
["Cow"]="Bò",["Pig"]="Heo",["Sheep"]="Cừu",["Goat"]="Dê",["Chicken"]="Gà",
["Duck"]="Vịt",["Rabbit"]="Thỏ",["Mouse"]="Chuột",["Rat"]="Chuột cống",
["Bear"]="Gấu",["Panda"]="Gấu trúc",["Wolf"]="Sói",["Fox"]="Cáo",
["Lion"]="Sư tử",["Tiger"]="Hổ",["Leopard"]="Báo",["Elephant"]="Voi",
["Monkey"]="Khỉ",["Gorilla"]="Khỉ đột",["Snake"]="Rắn",["Lizard"]="Thằn lằn",
["Crocodile"]="Cá sấu",["Turtle"]="Rùa",["Frog"]="Ếch",["Spider"]="Nhện",
["Ant"]="Kiến",["Bee"]="Ong",["Butterfly"]="Bướm",["Whale"]="Cá voi",
["Dolphin"]="Cá heo",["Shark"]="Cá mập",["Octopus"]="Bạch tuộc",["Crab"]="Cua",
["Penguin"]="Chim cánh cụt",["Eagle"]="Đại bàng",["Owl"]="Cú mèo",
["Parrot"]="Vẹt",["Peacock"]="Công",["Swan"]="Thiên nga",
-- Sinh vật thần thoại
["Dragon"]="Rồng",["Phoenix"]="Phượng hoàng",["Unicorn"]="Kỳ lân",
["Demon"]="Ác ma",["Angel"]="Thiên thần",["Ghost"]="Ma",["Spirit"]="Linh hồn",
["Zombie"]="Xác sống",["Skeleton"]="Bộ xương",["Vampire"]="Ma cà rồng",
["Werewolf"]="Người sói",["Witch"]="Phù thủy",["Wizard"]="Pháp sư",
["Mage"]="Pháp sư",["Knight"]="Hiệp sĩ",["Warrior"]="Chiến binh",
["Archer"]="Cung thủ",["Priest"]="Linh mục",["Rogue"]="Đạo tặc",
["Assassin"]="Sát thủ",["Thief"]="Kẻ trộm",["Bandit"]="Cướp",
["Pirate"]="Cướp biển",["Ninja"]="Ninja",["Samurai"]="Samurai",["Viking"]="Viking",
["Titan"]="Titan",["Giant"]="Người khổng lồ",["Dwarf"]="Người lùn",
["Elf"]="Yêu tinh",["Fairy"]="Tiên",["Goblin"]="Yêu tinh xấu",["Orc"]="Orc",
["Troll"]="Quỷ khổng lồ",["Minotaur"]="Bò đầu người",["Centaur"]="Nhân mã",
["Mermaid"]="Người cá",["Siren"]="Nàng tiên cá",
-- Địa điểm
["Home"]="Nhà",["House"]="Nhà",["Base"]="Căn cứ",["Village"]="Làng",
["Town"]="Thị trấn",["City"]="Thành phố",["Capital"]="Thủ đô",["Castle"]="Lâu đài",
["Palace"]="Cung điện",["Fortress"]="Pháo đài",["Kingdom"]="Vương quốc",
["Empire"]="Đế chế",["Nation"]="Quốc gia",["Country"]="Đất nước",
["World"]="Thế giới",["Universe"]="Vũ trụ",["Galaxy"]="Thiên hà",
["Planet"]="Hành tinh",["Space"]="Không gian",["Sky"]="Bầu trời",
["Ground"]="Mặt đất",["Forest"]="Rừng",["Jungle"]="Rừng nhiệt đới",
["Desert"]="Sa mạc",["Ocean"]="Đại dương",["Sea"]="Biển",["Lake"]="Hồ",
["River"]="Sông",["Waterfall"]="Thác nước",["Beach"]="Bãi biển",
["Island"]="Đảo",["Mountain"]="Núi",["Hill"]="Đồi",["Valley"]="Thung lũng",
["Cave"]="Hang",["Dungeon"]="Hầm ngục",["Temple"]="Đền",["Church"]="Nhà thờ",
["Tower"]="Tháp",["Bridge"]="Cầu",["Road"]="Đường",["Street"]="Phố",
["Gate"]="Cổng",["Door"]="Cửa",["Wall"]="Tường",["Room"]="Phòng",
["Hall"]="Sảnh",["Garden"]="Vườn",["Park"]="Công viên",["Arena"]="Đấu trường",
["Library"]="Thư viện",["Tavern"]="Quán rượu",["Inn"]="Nhà trọ",
["Hotel"]="Khách sạn",["Restaurant"]="Nhà hàng",["Cafe"]="Quán cà phê",
["Blacksmith"]="Lò rèn",["Workshop"]="Xưởng",["Hospital"]="Bệnh viện",
["Prison"]="Nhà tù",["Jail"]="Nhà giam",
-- Hành động
["Walk"]="Đi bộ",["Run"]="Chạy",["Sprint"]="Chạy nước rút",["Jump"]="Nhảy",
["Leap"]="Nhảy vọt",["Crouch"]="Ngồi",["Crawl"]="Bò",["Fly"]="Bay",
["Swim"]="Bơi",["Dive"]="Lặn",["Climb"]="Leo",["Sit"]="Ngồi",["Stand"]="Đứng",
["Lie"]="Nằm",["Sleep"]="Ngủ",["Wake"]="Thức",["Rest"]="Nghỉ",["Eat"]="Ăn",
["Drink"]="Uống",["Cook"]="Nấu",["Build"]="Xây",["Destroy"]="Phá",
["Break"]="Vỡ",["Fix"]="Sửa",["Mine"]="Đào",["Dig"]="Đào",["Farm"]="Nông trại",
["Plant"]="Trồng",["Harvest"]="Thu hoạch",["Water"]="Tưới",["Fish"]="Câu cá",
["Hunt"]="Săn",["Hunting"]="Săn bắn",["Gather"]="Thu thập",["Collect"]="Thu thập",
["Take"]="Lấy",["Give"]="Cho",["Get"]="Nhận",["Receive"]="Nhận",["Grab"]="Chộp",
["Carry"]="Mang",["Lift"]="Nâng",["Throw"]="Ném",["Push"]="Đẩy",["Pull"]="Kéo",
["Go"]="Đi",["Come"]="Đến",["Leave"]="Rời",["Arrive"]="Đến",["Stay"]="Ở lại",
["Follow"]="Theo",["Lead"]="Dẫn",["Chase"]="Đuổi",["Flee"]="Chạy trốn",
["Escape"]="Trốn",["Seek"]="Tìm",["Look"]="Nhìn",["See"]="Thấy",["Watch"]="Xem",
["Listen"]="Nghe",["Hear"]="Nghe thấy",["Speak"]="Nói",["Talk"]="Nói chuyện",
["Shout"]="Hét",["Whisper"]="Thì thầm",["Read"]="Đọc",["Write"]="Viết",
["Draw"]="Vẽ",["Sing"]="Hát",["Dance"]="Nhảy múa",["Laugh"]="Cười",
["Cry"]="Khóc",["Smile"]="Cười",["Think"]="Suy nghĩ",["Dream"]="Mơ",
-- Trạng thái
["Active"]="Hoạt động",["Inactive"]="Không hoạt động",["Working"]="Đang hoạt động",
["Broken"]="Hỏng",["Damaged"]="Bị hỏng",["Destroyed"]="Đã phá hủy",
["Full"]="Đầy",["Empty"]="Trống",["Complete"]="Hoàn chỉnh",
["Perfect"]="Hoàn hảo",["Hidden"]="Ẩn",["Visible"]="Hiện",["Secret"]="Bí mật",
["Public"]="Công khai",["Private"]="Riêng tư",["Cursed"]="Bị nguyền",
["Blessed"]="Được ban phước",["Sacred"]="Thiêng liêng",["Holy"]="Thánh",
["Evil"]="Ác",["Chaos"]="Hỗn mang",["Balance"]="Cân bằng",
-- Phương hướng
["North"]="Bắc",["South"]="Nam",["East"]="Đông",["West"]="Tây",
["Northeast"]="Đông Bắc",["Northwest"]="Tây Bắc",["Southeast"]="Đông Nam",
["Southwest"]="Tây Nam",["Up"]="Lên",["Down"]="Xuống",["Left"]="Trái",
["Right"]="Phải",["Front"]="Trước",["Behind"]="Sau",["Inside"]="Trong",
["Outside"]="Ngoài",["Top"]="Trên",["Bottom"]="Dưới",["Here"]="Ở đây",
["There"]="Ở kia",["Everywhere"]="Mọi nơi",["Before"]="Trước",["After"]="Sau",
-- Vũ khí
["Longsword"]="Trường kiếm",["Katana"]="Katana",["Rapier"]="Kiếm mảnh",
["Claymore"]="Kiếm hai tay",["Greatsword"]="Đại kiếm",["Battle Axe"]="Rìu chiến",
["Halberd"]="Kích",["Lance"]="Thương",["Trident"]="Đinh ba",["Mace"]="Chùy",
["Warhammer"]="Búa chiến",["Crossbow"]="Nỏ",["Revolver"]="Súng ổ xoay",
["SMG"]="Súng tiểu liên",["LMG"]="Súng máy",["Rocket Launcher"]="Súng phóng tên lửa",
["Flamethrower"]="Súng phun lửa",["Cannon"]="Đại bác",["Grenade"]="Lựu đạn",
["Bomb"]="Bom",["Mine"]="Mìn",["Missile"]="Tên lửa",
-- Giáp
["Chainmail"]="Giáp xích",["Leather Armor"]="Giáp da",["Helm"]="Mũ giáp",
["Crown"]="Vương miện",["Hood"]="Mũ trùm",["Buckler"]="Khiên nhỏ",
["Chestplate"]="Giáp ngực",["Leggings"]="Giáp chân",["Gauntlets"]="Găng tay sắt",
["Gloves"]="Găng tay",["Boots"]="Ủng",["Belt"]="Đai",["Robe"]="Áo choàng dài",
["Cloak"]="Áo choàng",["Cape"]="Áo choàng ngắn",["Shirt"]="Áo sơ mi",
["Pants"]="Quần",["Dress"]="Váy",["Shoes"]="Giày",
-- Trang sức
["Ring"]="Nhẫn",["Necklace"]="Dây chuyền",["Bracelet"]="Vòng tay",
["Earring"]="Khuyên tai",["Amulet"]="Bùa",["Talisman"]="Bùa hộ mệnh",
["Charm"]="Bùa may mắn",["Accessory"]="Phụ kiện",
-- Khái niệm
["Life"]="Cuộc sống",["Death"]="Cái chết",["Soul"]="Linh hồn",
["Mind"]="Tâm trí",["Body"]="Cơ thể",["Heart"]="Trái tim",["Blood"]="Máu",
["Bone"]="Xương",["Love"]="Tình yêu",["Hate"]="Thù hận",["Fear"]="Nỗi sợ",
["Courage"]="Lòng can đảm",["Honor"]="Danh dự",["Loyalty"]="Trung thành",
["Trust"]="Tin tưởng",["Hope"]="Hy vọng",["Despair"]="Tuyệt vọng",
["Dream"]="Giấc mơ",["Nightmare"]="Ác mộng",["Reality"]="Thực tại",
["Truth"]="Sự thật",["Lie"]="Lời nói dối",["Mystery"]="Bí ẩn",
["Wisdom"]="Trí tuệ",["Knowledge"]="Kiến thức",["Weakness"]="Điểm yếu",
["Fate"]="Số phận",["Destiny"]="Định mệnh",["Infinity"]="Vô cực",
["Eternity"]="Vĩnh cửu",
-- Tính từ
["Big"]="Lớn",["Small"]="Nhỏ",["Huge"]="Khổng lồ",["Tiny"]="Tí hon",
["Long"]="Dài",["Short"]="Ngắn",["Tall"]="Cao",["Wide"]="Rộng",["Narrow"]="Hẹp",
["Thick"]="Dày",["Thin"]="Mỏng",["Heavy"]="Nặng",["Strong"]="Mạnh",
["Weak"]="Yếu",["Fast"]="Nhanh",["Slow"]="Chậm",["Quick"]="Nhanh",
["Hot"]="Nóng",["Cold"]="Lạnh",["Warm"]="Ấm",["Cool"]="Mát",["Sharp"]="Sắc",
["Dull"]="Cùn",["Smooth"]="Mịn",["Rough"]="Nhám",["Soft"]="Mềm",["Hard"]="Cứng",
["Fresh"]="Tươi",["Clean"]="Sạch",["Dirty"]="Bẩn",["Clear"]="Rõ",
["Loud"]="To",["Quiet"]="Im lặng",["Calm"]="Bình tĩnh",["Wild"]="Hoang dã",
["Crazy"]="Điên",["Smart"]="Thông minh",["Dumb"]="Ngu",["Wise"]="Khôn ngoan",
["Clever"]="Khéo léo",
-- Khác
["Maybe"]="Có lẽ",["Sure"]="Chắc chắn",["Of Course"]="Tất nhiên",
["Definitely"]="Chắc chắn",["Absolutely"]="Hoàn toàn",["Nothing"]="Không có gì",
["Something"]="Cái gì đó",["Everything"]="Mọi thứ",["Someone"]="Ai đó",
["Everyone"]="Mọi người",["Nobody"]="Không ai",["Excuse Me"]="Xin lỗi",
["Good Morning"]="Chào buổi sáng",["Good Afternoon"]="Chào buổi chiều",
["Good Evening"]="Chào buổi tối",["Good Night"]="Chúc ngủ ngon",
["How Are You"]="Bạn khỏe không",["I'm Fine"]="Tôi khỏe",
["Nice to Meet You"]="Rất vui được gặp",["See You Later"]="Hẹn gặp lại",
["Take Care"]="Bảo trọng",
}

-- ═══════════════════════════════════════════════════════════
--   HÀM DỊCH
-- ═══════════════════════════════════════════════════════════
local cache = {}
local dsTu = {}
for tu in pairs(TD) do table.insert(dsTu, tu) end
table.sort(dsTu, function(a, b) return #a > #b end)

local function dich(text)
    if not text or text == "" then return text end
    if cache[text] then return cache[text] end
    local kq = text
    for _, tu in ipairs(dsTu) do
        local escaped = tu:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
        local mau = "%f[%a]" .. escaped .. "%f[%A]"
        kq = string.gsub(kq, mau, TD[tu])
    end
    cache[text] = kq
    return kq
end

-- ═══════════════════════════════════════════════════════════
--   DỊCH OBJECT
-- ═══════════════════════════════════════════════════════════
local function dichObject(obj)
    if not (obj:IsA("TextLabel") or obj:IsA("TextButton") 
        or obj:IsA("TextBox") or obj:IsA("Text")) then return end
    if not obj:GetAttribute("ChuGoc") then
        obj:SetAttribute("ChuGoc", obj.Text)
    end
    local goc = obj:GetAttribute("ChuGoc")
    if not goc or goc == "" or obj:GetAttribute("DaDich") then return end
    local banDich = dich(goc)
    if banDich ~= goc then
        obj.Text = banDich
        obj:SetAttribute("DaDich", true)
    end
end

local function hoanTac()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") 
        or obj:IsA("TextBox") or obj:IsA("Text") then
            local goc = obj:GetAttribute("ChuGoc")
            if goc then
                obj.Text = goc
                obj:SetAttribute("DaDich", nil)
            end
        end
    end
end

-- ═══════════════════════════════════════════════════════════
--   MÀU SẮC
-- ═══════════════════════════════════════════════════════════
local MAU = {
    Nen = Color3.fromRGB(24, 24, 32),
    Panel = Color3.fromRGB(34, 34, 45),
    Chinh = Color3.fromRGB(88, 101, 242),
    ChinhHover = Color3.fromRGB(108, 121, 255),
    ThanhCong = Color3.fromRGB(87, 242, 135),
    Chu = Color3.fromRGB(255, 255, 255),
    ChuMo = Color3.fromRGB(160, 160, 175),
}

-- ═══════════════════════════════════════════════════════════
--   TẠO UI
-- ═══════════════════════════════════════════════════════════
local oldGui = playerGui:FindFirstChild("UIDichChu")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UIDichChu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Nút mở
local nutMo = Instance.new("TextButton")
nutMo.Size = UDim2.new(0, 55, 0, 55)
nutMo.Position = UDim2.new(0, 20, 0.5, -27)
nutMo.BackgroundColor3 = MAU.Chinh
nutMo.Text = "🇻🇳"
nutMo.TextSize = 26
nutMo.Font = Enum.Font.GothamBold
nutMo.AutoButtonColor = false
nutMo.Parent = screenGui

local c1 = Instance.new("UICorner")
c1.CornerRadius = UDim.new(1, 0)
c1.Parent = nutMo

local s1 = Instance.new("UIStroke")
s1.Color = MAU.ChinhHover
s1.Thickness = 2
s1.Parent = nutMo

-- Khung chính
local khung = Instance.new("Frame")
khung.Size = UDim2.new(0, 360, 0, 290)
khung.Position = UDim2.new(0.5, -180, 0.5, -145)
khung.BackgroundColor3 = MAU.Nen
khung.BorderSizePixel = 0
khung.Visible = false
khung.Active = true
khung.Draggable = true
khung.Parent = screenGui

local c2 = Instance.new("UICorner")
c2.CornerRadius = UDim.new(0, 14)
c2.Parent = khung

local s2 = Instance.new("UIStroke")
s2.Color = MAU.Chinh
s2.Thickness = 1.5
s2.Transparency = 0.3
s2.Parent = khung

-- Header
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = MAU.Panel
header.Text = "🇻🇳  Dịch chữ sang tiếng Việt"
header.TextColor3 = MAU.Chu
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.Parent = khung

local c3 = Instance.new("UICorner")
c3.CornerRadius = UDim.new(0, 14)
c3.Parent = header

local fix = Instance.new("Frame")
fix.Size = UDim2.new(1, 0, 0, 15)
fix.Position = UDim2.new(0, 0, 1, -15)
fix.BackgroundColor3 = MAU.Panel
fix.BorderSizePixel = 0
fix.Parent = header

-- Nút đóng
local nutDong = Instance.new("TextButton")
nutDong.Size = UDim2.new(0, 30, 0, 30)
nutDong.Position = UDim2.new(1, -40, 0.5, -15)
nutDong.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
nutDong.Text = "✕"
nutDong.TextColor3 = MAU.Chu
nutDong.Font = Enum.Font.GothamBold
nutDong.TextSize = 14
nutDong.AutoButtonColor = false
nutDong.Parent = header

local c4 = Instance.new("UICorner")
c4.CornerRadius = UDim.new(1, 0)
c4.Parent = nutDong

-- Info
local thongTin = Instance.new("TextLabel")
thongTin.Size = UDim2.new(1, -40, 0, 25)
thongTin.Position = UDim2.new(0, 20, 0, 60)
thongTin.BackgroundTransparency = 1
thongTin.Text = "📚 Từ điển: " .. #dsTu .. " từ | Không cần HTTP"
thongTin.TextColor3 = MAU.ChuMo
thongTin.Font = Enum.Font.Gotham
thongTin.TextSize = 13
thongTin.TextXAlignment = Enum.TextXAlignment.Left
thongTin.Parent = khung

-- Nút DỊCH
local nutDich = Instance.new("TextButton")
nutDich.Size = UDim2.new(1, -40, 0, 45)
nutDich.Position = UDim2.new(0, 20, 0, 95)
nutDich.BackgroundColor3 = MAU.Chinh
nutDich.Text = "🔤  DỊCH TOÀN BỘ GAME"
nutDich.TextColor3 = MAU.Chu
nutDich.Font = Enum.Font.GothamBold
nutDich.TextSize = 15
nutDich.AutoButtonColor = false
nutDich.Parent = khung

local c5 = Instance.new("UICorner")
c5.CornerRadius = UDim.new(0, 10)
c5.Parent = nutDich

-- Nút HOÀN TÁC
local nutHoanTac = Instance.new("TextButton")
nutHoanTac.Size = UDim2.new(1, -40, 0, 45)
nutHoanTac.Position = UDim2.new(0, 20, 0, 150)
nutHoanTac.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
nutHoanTac.Text = "↩️  HOÀN TÁC"
nutHoanTac.TextColor3 = MAU.Chu
nutHoanTac.Font = Enum.Font.GothamBold
nutHoanTac.TextSize = 15
nutHoanTac.AutoButtonColor = false
nutHoanTac.Parent = khung

local c6 = Instance.new("UICorner")
c6.CornerRadius = UDim.new(0, 10)
c6.Parent = nutHoanTac

-- Nút tự động
local nutTuDong = Instance.new("TextButton")
nutTuDong.Size = UDim2.new(1, -40, 0, 40)
nutTuDong.Position = UDim2.new(0, 20, 0, 205)
nutTuDong.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
nutTuDong.Text = "🔄  TỰ ĐỘNG DỊCH: BẬT"
nutTuDong.TextColor3 = MAU.Chu
nutTuDong.Font = Enum.Font.GothamBold
nutTuDong.TextSize = 14
nutTuDong.AutoButtonColor = false
nutTuDong.Parent = khung

local c7 = Instance.new("UICorner")
c7.CornerRadius = UDim.new(0, 10)
c7.Parent = nutTuDong

-- Trạng thái
local trangThai = Instance.new("TextLabel")
trangThai.Size = UDim2.new(1, -40, 0, 25)
trangThai.Position = UDim2.new(0, 20, 0, 255)
trangThai.BackgroundTransparency = 1
trangThai.Text = "Sẵn sàng"
trangThai.TextColor3 = MAU.ChuMo
trangThai.Font = Enum.Font.Gotham
trangThai.TextSize = 13
trangThai.TextXAlignment = Enum.TextXAlignment.Left
trangThai.Parent = khung

-- Hover
local function hover(nut, m1, m2)
    nut.MouseEnter:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {BackgroundColor3 = m2}):Play()
    end)
    nut.MouseLeave:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {BackgroundColor3 = m1}):Play()
    end)
end

hover(nutMo, MAU.Chinh, MAU.ChinhHover)
hover(nutDich, MAU.Chinh, MAU.ChinhHover)
hover(nutHoanTac, Color3.fromRGB(60,60,75), Color3.fromRGB(80,80,100))
hover(nutTuDong, Color3.fromRGB(60,60,75), Color3.fromRGB(80,80,100))
hover(nutDong, Color3.fromRGB(255,80,80), Color3.fromRGB(255,110,110))

-- Mở/đóng
local dangMo = false
local function batTat()
    dangMo = not dangMo
    if dangMo then
        khung.Visible = true
        khung.Size = UDim2.new(0, 0, 0, 0)
        khung.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(khung, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = UDim2.new(0, 360, 0, 290),
            Position = UDim2.new(0.5, -180, 0.5, -145)
        }):Play()
    else
        local t = TweenService:Create(khung, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        t:Play()
        t.Completed:Connect(function() khung.Visible = false end)
    end
end

nutMo.MouseButton1Click:Connect(batTat)
nutDong.MouseButton1Click:Connect(batTat)

-- Dịch
nutDich.MouseButton1Click:Connect(function()
    trangThai.Text = "⏳ Đang dịch..."
    trangThai.TextColor3 = MAU.ChinhHover
    task.spawn(function()
        local dem = 0
        for _, obj in ipairs(game:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") 
            or obj:IsA("TextBox") or obj:IsA("Text") then
                dichObject(obj)
                dem = dem + 1
            end
        end
        task.wait(0.3)
        trangThai.Text = "✅ Đã quét " .. dem .. " chữ!"
        trangThai.TextColor3 = MAU.ThanhCong
    end)
end)

-- Hoàn tác
nutHoanTac.MouseButton1Click:Connect(function()
    hoanTac()
    trangThai.Text = "↩️ Đã khôi phục chữ gốc"
    trangThai.TextColor3 = MAU.ChinhHover
end)

-- Tự động
local tuDong = true
nutTuDong.MouseButton1Click:Connect(function()
    tuDong = not tuDong
    nutTuDong.Text = tuDong and "🔄  TỰ ĐỘNG DỊCH: BẬT" or "🔄  TỰ ĐỘNG DỊCH: TẮT"
end)

game.DescendantAdded:Connect(function(obj)
    if not tuDong then return end
    task.wait(0.2)
    dichObject(obj)
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        batTat()
    end
end)

print("✅ [Dịch Chữ VN] Đã load! Từ điển: " .. #dsTu .. " từ")
