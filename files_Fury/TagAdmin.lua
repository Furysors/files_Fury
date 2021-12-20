local function TagAd(msg)
local text = msg.content_.text_
if text and text == "تفعيل تاك الادمنيه" and Owner(msg) then 
database:set(bot_id.."Fury:Tag:Admins:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_,"𖢟︙تم تفعيل تاك الادمنيه")
end
if text and text == "تعطيل تاك الادمنيه" and Owner(msg) then 
database:del(bot_id.."Fury:Tag:Admins:"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "𖢟︙تم تعطيل تاك الادمنيه")
end

if text == 'صيح الادمنيه' or text == "تاك للادمنيه" or text == "وين الادمنيه" then
if database:get(bot_id.."Fury:Tag:Admins:"..msg.chat_id_) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(a,data)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,b)  
if b.username_ then 
User_id = "@"..b.username_
else
User_id = msg.sender_user_id_
end
local t = "\n𖢟︙المستخدم ~ ["..User_id .."] يصيح الادمنيه \n\n"
k = 0
for i,v in pairs(data.members_) do
if bot_id ~= v.user_id_ then 
k = k + 1
local username = database:get(bot_id.."Fury:User:Name"..v.user_id_)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.user_id_.."`)\n"
end
end
end
send(msg.chat_id_, msg.id_,t)
end,nil)
end,nil)
end
end   


end
return {Fury = TagAd}
