local function BGBBB_Ali(msg)
local text = msg.content_.text_
if database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
function bnnaGet(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
if text and text:match("^كتم اسم (.*)$") and Owner(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local BlNe = text:match("^كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, '𖢟︙تم كتم الاسم '..BlNe)
database:sadd(bot_id.."Fury:blocname"..msg.chat_id_, BlNe)
end

if text and text:match("^الغاء كتم اسم (.*)$") and Owner(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local delBn = text:match("^الغاء كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, '𖢟︙تم الغاء كتم الاسم '..delBn)
database:srem(bot_id.."Fury:blocname"..msg.chat_id_, delBn)
end

if text == "مسح الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
database:del(bot_id.."Fury:blocname"..msg.chat_id_)
texts = "𖢟︙ تم مسح الاسماء المكتومه "
send(msg.chat_id_, msg.id_, texts)
end
if text == "الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local All_name = database:smembers(bot_id.."Fury:blocname"..msg.chat_id_)
t = "\n𖢟︙قائمة الاسماء المكتومه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(All_name) do
t = t..""..k.."- (["..v.."])\n"
end
if #All_name == 0 then
t = "𖢟︙لا يوجد اسماء مكتومه"
end
send(msg.chat_id_, msg.id_, t)
end
end
if text == "تفعيل كتم الاسم" and Constructor(msg) then
send(msg.chat_id_, msg.id_, '𖢟︙تم التفعيل سيتم كتم العضو الذي يضع الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"open")
end
if text == "تعطيل كتم الاسم" and Constructor(msg) then
send(msg.chat_id_, msg.id_, '𖢟︙تم تعطيل سيتم كتم العضو الذي يضع الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"close")
end
if not Owner(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
function BGBBB_name(t1,t2)
if t2.id_ then 
name_Ali = ((t2.first_name_ or "") .. (t2.last_name_ or ""))
if name_Ali then 
names_Ali = database:smembers(bot_id.."Fury:blocname"..msg.chat_id_) or ""
if names_Ali and names_Ali[1] then 
for i=1,#names_Ali do 
if name_Ali:match("(.*)("..names_Ali[i]..")(.*)") then 
DeleteMessage_(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
end
end
bnnaGet(msg.sender_user_id_, BGBBB_name)
end
end
return {
Fury = BGBBB_Ali,
}
