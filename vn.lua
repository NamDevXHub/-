-- ═══════════════════════════════════════════════════════════
--   DỊCH CHỮ ROBLOX SANG TIẾNG VIỆT - FULL TỪ ĐIỂN
--   Đặt trong: StarterPlayer > StarterPlayerScripts (LocalScript)
-- ═══════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════
--   TỪ ĐIỂN (1000+ từ) - Bạn có thể thêm từ mới vào đây
-- ═══════════════════════════════════════════════════════════
local TD = {
-- UI cơ bản
["Play"]="Chơi",["Start"]="Bắt đầu",["Stop"]="Dừng",["Pause"]="Tạm dừng",
["Resume"]="Tiếp tục",["Restart"]="Chơi lại",["Exit"]="Thoát",["Quit"]="Thoát",
["Close"]="Đóng",["Open"]="Mở",["Back"]="Quay lại",["Next"]="Tiếp",["Previous"]="Trước",
["Continue"]="Tiếp tục",["Cancel"]="Hủy",["Confirm"]="Xác nhận",["Yes"]="Có",["No"]="Không",
["OK"]="Đồng ý",["Save"]="Lưu",["Load"]="Tải",["Delete"]="Xóa",["Edit"]="Sửa",
["Apply"]="Áp dụng",["Reset"]="Đặt lại",["Submit"]="Gửi",["Send"]="Gửi",["Skip"]="Bỏ qua",
["Retry"]="Thử lại",["Refresh"]="Làm mới",["Update"]="Cập nhật",["Download"]="Tải xuống",
["Upload"]="Tải lên",["Share"]="Chia sẻ",["Copy"]="Sao chép",["Paste"]="Dán",
["Cut"]="Cắt",["Select"]="Chọn",["Search"]="Tìm kiếm",["Filter"]="Lọc",["Sort"]="Sắp xếp",
["View"]="Xem",["Hide"]="Ẩn",["Show"]="Hiện",["New"]="Mới",["Create"]="Tạo",
["Add"]="Thêm",["Remove"]="Xóa",["Insert"]="Chèn",["Rename"]="Đổi tên",["Move"]="Di chuyển",
-- Menu
["Menu"]="Menu",["Main Menu"]="Menu chính",["Settings"]="Cài đặt",["Options"]="Tùy chọn",
["Config"]="Cấu hình",["Help"]="Trợ giúp",["Support"]="Hỗ trợ",["About"]="Giới thiệu",
["Contact"]="Liên hệ",["Info"]="Thông tin",["Information"]="Thông tin",["Details"]="Chi tiết",
["Profile"]="Hồ sơ",["Account"]="Tài khoản",["Login"]="Đăng nhập",["Logout"]="Đăng xuất",
["Sign In"]="Đăng nhập",["Sign Up"]="Đăng ký",["Sign Out"]="Đăng xuất",["Register"]="Đăng ký",
["Username"]="Tên đăng nhập",["Password"]="Mật khẩu",["Email"]="Email",["Name"]="Tên",
["Nickname"]="Biệt danh",["Avatar"]="Ảnh đại diện",["Status"]="Trạng thái",
-- Game
["Game"]="Trò chơi",["Games"]="Trò chơi",["Player"]="Người chơi",["Players"]="Người chơi",
["Enemy"]="Kẻ địch",["Enemies"]="Kẻ địch",["Boss"]="Trùm",["Monster"]="Quái vật",
["Mob"]="Quái",["NPC"]="NPC",["Friend"]="Bạn",["Friends"]="Bạn bè",["Team"]="Đội",
["Guild"]="Bang hội",["Clan"]="Bang",["Party"]="Nhóm",["Group"]="Nhóm",["Ally"]="Đồng minh",
["Owner"]="Chủ sở hữu",["Admin"]="Quản trị viên",["Moderator"]="Người điều hành",
["Member"]="Thành viên",["Leader"]="Trưởng nhóm",["Captain"]="Đội trưởng",
-- Chiến đấu
["Health"]="Máu",["HP"]="Máu",["Mana"]="Năng lượng",["MP"]="Năng lượng",
["Stamina"]="Thể lực",["Energy"]="Năng lượng",["Damage"]="Sát thương",
["Attack"]="Tấn công",["Defense"]="Phòng thủ",["Speed"]="Tốc độ",["Power"]="Sức mạnh",
["Strength"]="Sức mạnh",["Agility"]="Nhanh nhẹn",["Luck"]="May mắn",
["Intelligence"]="Trí tuệ",["Vitality"]="Sinh lực",["Accuracy"]="Độ chính xác",
["Critical"]="Chí mạng",["Crit"]="Chí mạng",["Block"]="Chặn",["Dodge"]="Né",
["Parry"]="Đỡ",["Hit"]="Đánh trúng",["Miss"]="Trượt",["Kill"]="Giết",
["Death"]="Chết",["Die"]="Chết",["Dead"]="Đã chết",["Alive"]="Còn sống",
["Respawn"]="Hồi sinh",["Revive"]="Hồi sinh",["Heal"]="Hồi máu",["Regen"]="Hồi phục",
["Buff"]="Tăng cường",["Debuff"]="Suy yếu",["Effect"]="Hiệu ứng",["Skill"]="Kỹ năng",
["Skills"]="Kỹ năng",["Ability"]="Khả năng",["Abilities"]="Khả năng",["Spell"]="Phép",
["Magic"]="Phép thuật",["Range"]="Tầm",["Cooldown"]="Hồi chiêu",
-- Cấp độ
["Level"]="Cấp độ",["Lv"]="Cấp",["Lvl"]="Cấp",["Level Up"]="Lên cấp",
["Max Level"]="Cấp tối đa",["XP"]="Kinh nghiệm",["Exp"]="Kinh nghiệm",
["Experience"]="Kinh nghiệm",["Rank"]="Hạng",["Ranking"]="Xếp hạng",
["Leaderboard"]="Bảng xếp hạng",["Score"]="Điểm",["Points"]="Điểm",
["Tier"]="Bậc",["Grade"]="Hạng",["Class"]="Lớp",["Stat"]="Chỉ số",["Stats"]="Chỉ số",
["Statistics"]="Thống kê",["Progress"]="Tiến độ",["Achievement"]="Thành tựu",
["Achievements"]="Thành tựu",["Trophy"]="Cúp",["Medal"]="Huy chương",
["Badge"]="Huy hiệu",["Title"]="Danh hiệu",["Reputation"]="Danh tiếng",
-- Tiền tệ
["Gold"]="Vàng",["Coins"]="Xu",["Coin"]="Xu",["Money"]="Tiền",["Cash"]="Tiền mặt",
["Gem"]="Đá quý",["Gems"]="Đá quý",["Diamond"]="Kim cương",["Diamonds"]="Kim cương",
["Crystal"]="Pha lê",["Token"]="Xu",["Tokens"]="Xu",["Currency"]="Tiền tệ",
["Price"]="Giá",["Cost"]="Giá",["Value"]="Giá trị",["Total"]="Tổng",
["Discount"]="Giảm giá",["Free"]="Miễn phí",["Paid"]="Trả phí",["Premium"]="Cao cấp",
["VIP"]="VIP",["Robux"]="Robux",["Purchase"]="Mua",["Refund"]="Hoàn tiền",
-- Cửa hàng
["Shop"]="Cửa hàng",["Store"]="Cửa hàng",["Market"]="Chợ",["Marketplace"]="Chợ",
["Buy"]="Mua",["Sell"]="Bán",["Trade"]="Trao đổi",["Trading"]="Giao dịch",
["Offer"]="Đề nghị",["Deal"]="Giao dịch",["Bid"]="Đặt giá",["Auction"]="Đấu giá",
["Cart"]="Giỏ hàng",["Checkout"]="Thanh toán",["Order"]="Đơn hàng",
["Inventory"]="Túi đồ",["Backpack"]="Ba lô",["Bag"]="Túi",["Item"]="Vật phẩm",
["Items"]="Vật phẩm",["Product"]="Sản phẩm",["Products"]="Sản phẩm",
["Equipment"]="Trang bị",["Gear"]="Đồ",["Tool"]="Công cụ",["Weapon"]="Vũ khí",
["Weapons"]="Vũ khí",["Armor"]="Giáp",["Helmet"]="Mũ",["Hat"]="Mũ",["Shield"]="Khiên",
["Sword"]="Kiếm",["Axe"]="Rìu",["Bow"]="Cung",["Arrow"]="Mũi tên",["Gun"]="Súng",
["Pistol"]="Súng lục",["Rifle"]="Súng trường",["Knife"]="Dao",["Dagger"]="Dao găm",
["Staff"]="Gậy",["Wand"]="Đũa phép",["Potion"]="Thuốc",["Elixir"]="Tiên dược",
["Scroll"]="Cuộn giấy",["Book"]="Sách",["Map"]="Bản đồ",["Key"]="Chìa khóa",
["Lock"]="Khóa",["Unlock"]="Mở khóa",["Locked"]="Đã khóa",["Unlocked"]="Đã mở",
["Chest"]="Rương",["Box"]="Hộp",["Crate"]="Thùng",["Reward"]="Phần thưởng",
["Rewards"]="Phần thưởng",["Bonus"]="Thưởng thêm",["Gift"]="Quà",["Loot"]="Chiến lợi phẩm",
["Rarity"]="Độ hiếm",["Common"]="Phổ thông",["Uncommon"]="Ít gặp",["Rare"]="Hiếm",
["Epic"]="Sử thi",["Legendary"]="Huyền thoại",["Mythical"]="Thần thoại",
["Divine"]="Thần thánh",["Godly"]="Thần cấp",
-- Trang bị
["Equip"]="Trang bị",["Unequip"]="Tháo",["Equipped"]="Đã trang bị",["Use"]="Sử dụng",
["Wear"]="Mặc",["Owned"]="Đã sở hữu",["Missing"]="Thiếu",["Required"]="Yêu cầu",
["Slot"]="Ô",["Slots"]="Ô",["Capacity"]="Sức chứa",
-- Nhiệm vụ
["Quest"]="Nhiệm vụ",["Quests"]="Nhiệm vụ",["Mission"]="Nhiệm vụ",["Missions"]="Nhiệm vụ",
["Task"]="Nhiệm vụ",["Tasks"]="Nhiệm vụ",["Objective"]="Mục tiêu",["Objectives"]="Mục tiêu",
["Goal"]="Mục tiêu",["Target"]="Mục tiêu",["Challenge"]="Thử thách",["Daily"]="Hàng ngày",
["Weekly"]="Hàng tuần",["Monthly"]="Hàng tháng",["Event"]="Sự kiện",["Events"]="Sự kiện",
["Season"]="Mùa",["Season Pass"]="Vé mùa",["Battle Pass"]="Vé trận đấu",
["Complete"]="Hoàn thành",["Completed"]="Đã hoàn thành",["Finish"]="Kết thúc",
["Failed"]="Thất bại",["Success"]="Thành công",["Win"]="Thắng",["Victory"]="Chiến thắng",
["Lose"]="Thua",["Defeat"]="Thất bại",["Draw"]="Hòa",["Tie"]="Hòa",
-- Thông báo
["Notification"]="Thông báo",["Notifications"]="Thông báo",["Message"]="Tin nhắn",
["Messages"]="Tin nhắn",["Chat"]="Trò chuyện",["Alert"]="Cảnh báo",["Warning"]="Cảnh báo",
["Error"]="Lỗi",["Errors"]="Lỗi",["Notice"]="Thông báo",["Announcement"]="Thông cáo",
["Loading"]="Đang tải",["Loaded"]="Đã tải",["Please wait"]="Vui lòng đợi",
["Wait"]="Đợi",["Processing"]="Đang xử lý",["Connecting"]="Đang kết nối",
["Connected"]="Đã kết nối",["Disconnected"]="Đã ngắt kết nối",["Online"]="Trực tuyến",
["Offline"]="Ngoại tuyến",["Busy"]="Bận",["Welcome"]="Chào mừng",["Goodbye"]="Tạm biệt",
["Hello"]="Xin chào",["Hi"]="Chào",["Hey"]="Này",["Thanks"]="Cảm ơn",
["Thank you"]="Cảm ơn bạn",["Sorry"]="Xin lỗi",["Please"]="Làm ơn",
["Congrats"]="Chúc mừng",["Congratulations"]="Chúc mừng",["Good Luck"]="Chúc may mắn",
["Good Job"]="Làm tốt lắm",["Amazing"]="Tuyệt vời",["Awesome"]="Tuyệt vời",
["Great"]="Tuyệt",["Good"]="Tốt",["Bad"]="Tệ",["Excellent"]="Xuất sắc",
["Perfect"]="Hoàn hảo",["Fantastic"]="Tuyệt vời",
-- Cài đặt
["Sound"]="Âm thanh",["Music"]="Nhạc",["Volume"]="Âm lượng",["Audio"]="Âm thanh",
["Graphics"]="Đồ họa",["Quality"]="Chất lượng",["Language"]="Ngôn ngữ",
["English"]="Tiếng Anh",["Vietnamese"]="Tiếng Việt",["Chinese"]="Tiếng Trung",
["Japanese"]="Tiếng Nhật",["Korean"]="Tiếng Hàn",["Spanish"]="Tiếng Tây Ban Nha",
["French"]="Tiếng Pháp",["German"]="Tiếng Đức",["Russian"]="Tiếng Nga",
["On"]="Bật",["Off"]="Tắt",["Enable"]="Bật",["Disable"]="Tắt",["Enabled"]="Đã bật",
["Disabled"]="Đã tắt",["Brightness"]="Độ sáng",["Resolution"]="Độ phân giải",
["Fullscreen"]="Toàn màn hình",["Windowed"]="Cửa sổ",["FPS"]="FPS",
["Frame Rate"]="Tốc độ khung hình",["Low"]="Thấp",["Medium"]="Trung bình",
["High"]="Cao",["Ultra"]="Cực cao",["Default"]="Mặc định",["Custom"]="Tùy chỉnh",
["Advanced"]="Nâng cao",["Basic"]="Cơ bản",["Simple"]="Đơn giản",["Complex"]="Phức tạp",
["Auto"]="Tự động",["Manual"]="Thủ công",["Keyboard"]="Bàn phím",["Mouse"]="Chuột",
["Controller"]="Tay cầm",["Gamepad"]="Tay cầm",["Touch"]="Cảm ứng",["Keybind"]="Phím tắt",
-- Thời gian
["Time"]="Thời gian",["Date"]="Ngày",["Day"]="Ngày",["Days"]="Ngày",["Week"]="Tuần",
["Weeks"]="Tuần",["Month"]="Tháng",["Months"]="Tháng",["Year"]="Năm",["Years"]="Năm",
["Hour"]="Giờ",["Hours"]="Giờ",["Minute"]="Phút",["Minutes"]="Phút",["Second"]="Giây",
["Seconds"]="Giây",["Today"]="Hôm nay",["Tomorrow"]="Ngày mai",["Yesterday"]="Hôm qua",
["Now"]="Bây giờ",["Later"]="Sau",["Soon"]="Sớm",["Always"]="Luôn luôn",
["Never"]="Không bao giờ",["Sometimes"]="Đôi khi",["Often"]="Thường xuyên",
["Rarely"]="Hiếm khi",["Morning"]="Buổi sáng",["Afternoon"]="Buổi chiều",
["Evening"]="Buổi tối",["Night"]="Ban đêm",["Noon"]="Buổi trưa",["Midnight"]="Nửa đêm",
["Spring"]="Mùa xuân",["Summer"]="Mùa hè",["Fall"]="Mùa thu",["Autumn"]="Mùa thu",
["Winter"]="Mùa đông",["Monday"]="Thứ Hai",["Tuesday"]="Thứ Ba",["Wednesday"]="Thứ Tư",
["Thursday"]="Thứ Năm",["Friday"]="Thứ Sáu",["Saturday"]="Thứ Bảy",["Sunday"]="Chủ Nhật",
-- Số đếm
["Zero"]="Không",["One"]="Một",["Two"]="Hai",["Three"]="Ba",["Four"]="Bốn",
["Five"]="Năm",["Six"]="Sáu",["Seven"]="Bảy",["Eight"]="Tám",["Nine"]="Chín",
["Ten"]="Mười",["Hundred"]="Trăm",["Thousand"]="Nghìn",["Million"]="Triệu",
["Billion"]="Tỷ",["First"]="Đầu tiên",["Second"]="Thứ hai",["Third"]="Thứ ba",
["Last"]="Cuối cùng",["Final"]="Chung kết",["Beginning"]="Bắt đầu",["End"]="Kết thúc",
["Half"]="Một nửa",["Double"]="Gấp đôi",["Triple"]="Gấp ba",["Single"]="Đơn",
-- Màu sắc
["Red"]="Đỏ",["Blue"]="Xanh dương",["Green"]="Xanh lá",["Yellow"]="Vàng",
["Orange"]="Cam",["Purple"]="Tím",["Pink"]="Hồng",["Brown"]="Nâu",["Black"]="Đen",
["White"]="Trắng",["Gray"]="Xám",["Grey"]="Xám",["Silver"]="Bạc",
["Golden"]="Vàng kim",["Cyan"]="Xanh lơ",["Navy"]="Xanh hải quân",["Violet"]="Tím violet",
-- Sinh vật
["Dog"]="Chó",["Cat"]="Mèo",["Bird"]="Chim",["Fish"]="Cá",["Horse"]="Ngựa",
["Cow"]="Bò",["Pig"]="Heo",["Sheep"]="Cừu",["Chicken"]="Gà",["Duck"]="Vịt",
["Rabbit"]="Thỏ",["Mouse"]="Chuột",["Bear"]="Gấu",["Wolf"]="Sói",["Fox"]="Cáo",
["Lion"]="Sư tử",["Tiger"]="Hổ",["Elephant"]="Voi",["Monkey"]="Khỉ",["Snake"]="Rắn",
["Dragon"]="Rồng",["Phoenix"]="Phượng hoàng",["Unicorn"]="Kỳ lân",["Demon"]="Ác ma",
["Angel"]="Thiên thần",["Ghost"]="Ma",["Zombie"]="Xác sống",["Skeleton"]="Bộ xương",
["Vampire"]="Ma cà rồng",["Werewolf"]="Người sói",["Witch"]="Phù thủy",
["Wizard"]="Pháp sư",["Knight"]="Hiệp sĩ",["Warrior"]="Chiến binh",
["Archer"]="Cung thủ",["Mage"]="Pháp sư",["Priest"]="Linh mục",["Rogue"]="Đạo tặc",
["Assassin"]="Sát thủ",["Thief"]="Kẻ trộm",["Bandit"]="Cướp",["Pirate"]="Cướp biển",
["Ninja"]="Ninja",["Samurai"]="Samurai",["Viking"]="Viking",
-- Địa điểm
["Home"]="Nhà",["House"]="Nhà",["Base"]="Căn cứ",["Village"]="Làng",["Town"]="Thị trấn",
["City"]="Thành phố",["Castle"]="Lâu đài",["Kingdom"]="Vương quốc",["Empire"]="Đế chế",
["Nation"]="Quốc gia",["Country"]="Đất nước",["World"]="Thế giới",["Universe"]="Vũ trụ",
["Galaxy"]="Thiên hà",["Planet"]="Hành tinh",["Space"]="Không gian",["Sky"]="Bầu trời",
["Ground"]="Mặt đất",["Forest"]="Rừng",["Jungle"]="Rừng nhiệt đới",["Desert"]="Sa mạc",
["Ocean"]="Đại dương",["Sea"]="Biển",["Lake"]="Hồ",["River"]="Sông",["Mountain"]="Núi",
["Valley"]="Thung lũng",["Cave"]="Hang",["Dungeon"]="Hầm ngục",["Temple"]="Đền",
["Church"]="Nhà thờ",["Tower"]="Tháp",["Bridge"]="Cầu",["Road"]="Đường",
["Street"]="Phố",["Gate"]="Cổng",["Door"]="Cửa",["Wall"]="Tường",["Room"]="Phòng",
["Hall"]="Sảnh",["Garden"]="Vườn",
-- Hành động
["Walk"]="Đi bộ",["Run"]="Chạy",["Jump"]="Nhảy",["Crouch"]="Ngồi",["Crawl"]="Bò",
["Fly"]="Bay",["Swim"]="Bơi",["Climb"]="Leo",["Sit"]="Ngồi",["Stand"]="Đứng",
["Lie"]="Nằm",["Sleep"]="Ngủ",["Wake"]="Thức",["Eat"]="Ăn",["Drink"]="Uống",
["Cook"]="Nấu",["Build"]="Xây",["Destroy"]="Phá",["Break"]="Vỡ",["Fix"]="Sửa",
["Repair"]="Sửa chữa",["Craft"]="Chế tạo",["Crafting"]="Chế tạo",["Mine"]="Đào",
["Dig"]="Đào",["Farm"]="Nông trại",["Hunt"]="Săn",["Hunting"]="Săn bắn",
["Gather"]="Thu thập",["Collect"]="Thu thập",["Take"]="Lấy",["Give"]="Cho",
["Get"]="Nhận",["Receive"]="Nhận",["Throw"]="Ném",["Push"]="Đẩy",["Pull"]="Kéo",
["Enter"]="Vào",["Leave"]="Rời",["Stay"]="Ở lại",["Follow"]="Theo",["Chase"]="Đuổi",
["Escape"]="Trốn",["Seek"]="Tìm",["Look"]="Nhìn",["Watch"]="Xem",["Listen"]="Nghe",
["Speak"]="Nói",["Talk"]="Nói chuyện",["Read"]="Đọc",["Write"]="Viết",["Draw"]="Vẽ",
["Sing"]="Hát",["Dance"]="Nhảy múa",["Laugh"]="Cười",["Cry"]="Khóc",
-- Trạng thái
["New"]="Mới",["Old"]="Cũ",["Young"]="Trẻ",["Ancient"]="Cổ đại",["Modern"]="Hiện đại",
["Future"]="Tương lai",["Past"]="Quá khứ",["Present"]="Hiện tại",["Active"]="Hoạt động",
["Inactive"]="Không hoạt động",["Ready"]="Sẵn sàng",["Working"]="Đang hoạt động",
["Broken"]="Hỏng",["Damaged"]="Bị hỏng",["Destroyed"]="Đã phá hủy",["Full"]="Đầy",
["Empty"]="Trống",["Complete"]="Hoàn chỉnh",["Perfect"]="Hoàn hảo",["Hidden"]="Ẩn",
["Visible"]="Hiện",["Secret"]="Bí mật",["Public"]="Công khai",["Private"]="Riêng tư",
-- Khác
["Yes"]="Có",["No"]="Không",["Maybe"]="Có lẽ",["Sure"]="Chắc chắn",
["Of Course"]="Tất nhiên",["Definitely"]="Chắc chắn",["Absolutely"]="Hoàn toàn",
["Nothing"]="Không có gì",["Something"]="Cái gì đó",["Everything"]="Mọi thứ",
["Someone"]="Ai đó",["Everyone"]="Mọi người",["Nobody"]="Không ai",
["Here"]="Ở đây",["There"]="Ở kia",["Everywhere"]="Mọi nơi",["Somewhere"]="Đâu đó",
["Before"]="Trước",["After"]="Sau",["During"]="Trong khi",["Between"]="Giữa",
["Left"]="Trái",["Right"]="Phải",["Up"]="Lên",["Down"]="Xuống",["Front"]="Trước",
["Behind"]="Sau",["Inside"]="Trong",["Outside"]="Ngoài",["Top"]="Trên",["Bottom"]="Dưới",
["North"]="Bắc",["South"]="Nam",["East"]="Đông",["West"]="Tây",
["Beginner"]="Người mới",["Novice"]="Tân binh",["Intermediate"]="Trung cấp",
["Expert"]="Chuyên gia",["Master"]="Bậc thầy",["Grandmaster"]="Đại sư",
["Legend"]="Huyền thoại",["Myth"]="Thần thoại",["Hero"]="Anh hùng",["Villain"]="Ác nhân",
["Good"]="Thiện",["Evil"]="Ác",["Neutral"]="Trung lập",["Light"]="Ánh sáng",
["Dark"]="Bóng tối",["Fire"]="Lửa",["Water"]="Nước",["Earth"]="Đất",["Wind"]="Gió",
["Ice"]="Băng",["Thunder"]="Sét",["Poison"]="Độc",["Holy"]="Thánh",["Shadow"]="Bóng",
["Weapon"]="Vũ khí",["Armor"]="Giáp",["Accessory"]="Phụ kiện",["Ring"]="Nhẫn",
["Necklace"]="Dây chuyền",["Bracelet"]="Vòng tay",["Earring"]="Khuyên tai",
["Boots"]="Ủng",["Gloves"]="Găng tay",["Belt"]="Đai",["Cloak"]="Áo choàng",
["Cape"]="Áo choàng",["Robe"]="Áo dài",["Shirt"]="Áo",["Pants"]="Quần",
["Dress"]="Váy",["Skirt"]="Váy ngắn",["Shoes"]="Giày",["Socks"]="Tất",
}

-- ═══════════════════════════════════════════════════════════
--   HÀM DỊCH
-- ═══════════════════════════════════════════════════════════
local cache = {}
local dsTuDaSapXep = {}

-- Sắp xếp từ dài trước để dịch cụm từ chính xác
for tu in pairs(TD) do
    table.insert(dsTuDaSapXep, tu)
end
table.sort(dsTuDaSapXep, function(a, b) return #a > #b end)

local function dich(text)
    if not text or text == "" then return text end
    if cache[text] then return cache[text] end
    
    local ketQua = text
    for _, tu in ipairs(dsTuDaSapXep) do
        -- Escape ký tự đặc biệt trong từ
        local tuEscaped = tu:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
        local mau = "%f[%a]" .. tuEscaped .. "%f[%A]"
        ketQua = string.gsub(ketQua, mau, TD[tu])
    end
    
    cache[text] = ketQua
    return ketQua
end

-- ═══════════════════════════════════════════════════════════
--   DỊCH OBJECT
-- ═══════════════════════════════════════════════════════════
local function dichObject(obj)
    if not (obj:IsA("TextLabel") or obj:IsA("TextButton") 
        or obj:IsA("TextBox") or obj:IsA("Text")) then return end
    
    -- Lưu chữ gốc
    if not obj:GetAttribute("ChuGoc") then
        obj:SetAttribute("ChuGoc", obj.Text)
    end
    
    local goc = obj:GetAttribute("ChuGoc")
    if not goc or goc == "" then return end
    
    -- Không dịch nếu đã dịch rồi
    if obj:GetAttribute("DaDich") then return end
    
    local banDich = dich(goc)
    if banDich ~= goc then
        obj.Text = banDich
        obj:SetAttribute("DaDich", true)
    end
end

local function quetTatCa()
    for _, obj in ipairs(game:GetDescendants()) do
        dichObject(obj)
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
--   TẠO UI
-- ═══════════════════════════════════════════════════════════
local MAU = {
    Nen        = Color3.fromRGB(24, 24, 32),
    Panel      = Color3.fromRGB(34, 34, 45),
    Chinh      = Color3.fromRGB(88, 101, 242),
    ChinhHover = Color3.fromRGB(108, 121, 255),
    ThanhCong  = Color3.fromRGB(87, 242, 135),
    Chu        = Color3.fromRGB(255, 255, 255),
    ChuMo      = Color3.fromRGB(160, 160, 175),
}

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

-- Thông tin từ điển
local thongTin = Instance.new("TextLabel")
thongTin.Size = UDim2.new(1, -40, 0, 25)
thongTin.Position = UDim2.new(0, 20, 0, 60)
thongTin.BackgroundTransparency = 1
thongTin.Text = "📚 Từ điển: " .. #dsTuDaSapXep .. " từ | Không cần HTTP"
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

-- Nút DỊCH LẠI (tự động)
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
local function hover(nut, mau1, mau2)
    nut.MouseEnter:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {BackgroundColor3 = mau2}):Play()
    end)
    nut.MouseLeave:Connect(function()
        TweenService:Create(nut, TweenInfo.new(0.15), {BackgroundColor3 = mau1}):Play()
    end)
end

hover(nutMo, MAU.Chinh, MAU.ChinhHover)
hover(nutDich, MAU.Chinh, MAU.ChinhHover)
hover(nutHoanTac, Color3.fromRGB(60,60,75), Color3.fromRGB(80,80,100))
hover(nutTuDong, Color3.fromRGB(60,60,75), Color3.fromRGB(80,80,100))
hover(nutDong, Color3.fromRGB(255,80,80), Color3.fromRGB(255,110,110))

-- Mở/đóng UI
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

-- Tự động dịch
local tuDong = true
nutTuDong.MouseButton1Click:Connect(function()
    tuDong = not tuDong
    nutTuDong.Text = tuDong and "🔄  TỰ ĐỘNG DỊCH: BẬT" or "🔄  TỰ ĐỘNG DỊCH: TẮT"
end)

-- Theo dõi object mới
game.DescendantAdded:Connect(function(obj)
    if not tuDong then return end
    task.wait(0.2)
    dichObject(obj)
end)

-- Phím tắt RightCtrl
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        batTat()
    end
end)

print("✅ [Dịch Chữ VN] Đã load! Từ điển: " .. #dsTuDaSapXep .. " từ")
print("💡 Nhấn RightCtrl hoặc nút 🇻🇳 để mở UI")
