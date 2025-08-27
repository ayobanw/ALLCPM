-- ANW®©™ Script by Abg & Mi 💥 (v3 - Safe Android ID)

local info = gg.getTargetInfo()
local android_id = info and info.androidId or "ADMIN"

gg.alert("📱 Android ID anda: " .. android_id)

local key = gg.prompt({"🔑 Masukkan KEY anda:"})[1]

if key == nil or key == "" then
    gg.alert("❌ KEY tidak dimasukkan!")
    os.exit()
end

local url = "https://raw.githubusercontent.com/ayobanw/keys/main/keys.txt"

local response = gg.makeRequest(url)
local body = response.content

if response.code ~= 200 then
    gg.alert("❌ Gagal hubung ke GitHub (kod " .. tostring(response.code) .. ").")
    os.exit()
end

if string.find(body, key .. ":" .. android_id) then
    gg.alert("✔ Key sah & ID sepadan. Selamat datang ke ANW®©™ Script!")

    

else
    gg.alert("❌ Key tidak sah atau bukan untuk device ini.")
    os.exit()
end

local github_user = "ayobanw"
local repo_name = "keys"
local key_file = "keys.txt"
local script_file = " [GHV5] 𝑨𝒚𝒐𝒃 𝑷𝑹𝑶𝑮𝑹𝑨𝑴 script V5.lua"


local key_url = "https://raw.githubusercontent.com/" .. github_user .. "/" .. repo_name .. "/main/" .. key_file
local script_url = "https://raw.githubusercontent.com/" .. github_user .. "/" .. repo_name .. "/main/" .. script_file

local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

local inputKey = gg.prompt({"Masukkan Key (Password) Anda:"})
if not inputKey or not inputKey[1] or inputKey[1] == "" then
  gg.alert("Tiada input diterima, skrip ditamatkan.")
  os.exit()
end
inputKey = trim(inputKey[1])

local keyRequest = gg.makeRequest(key_url)
if not keyRequest or not keyRequest.content then
  gg.alert("❌ Gagal mendapatkan senarai key. Semak sambungan internet atau URL.")
  os.exit()
end

if not keyRequest.content:find(inputKey, 1, true) then
  gg.alert("❌ Key tidak sah. Hubungi admin untuk akses.")
  os.exit()
end

local scriptRequest = gg.makeRequest(script_url)
if not scriptRequest or not scriptRequest.content then
  gg.alert("❌ Gagal memuat skrip utama dari GitHub. Semak sambungan internet atau URL.")
  os.exit()
end

local func, err = load(scriptRequest.content)
if not func then
  gg.alert("❌ Ralat muat skrip utama: " .. tostring(err))
  os.exit()
end

func()
