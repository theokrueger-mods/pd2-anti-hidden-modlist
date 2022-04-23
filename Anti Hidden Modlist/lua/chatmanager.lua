-- synopsis of how i wrote this, piled on lua until it worked
-- better hope this wont crash your game :)

-- this was hacked together as a proof of concept in around an hour so you shouldnt care about the overly inefficient code since it is a result of my iterative process. If demand is remotely high I will make a fancy version that runs good lol
local Net = _G.LuaNetworking
local has_beardlib = {}
local was_warned = {}

-- everything is nested to hell and back
local _receive_message_original = ChatManager._receive_message
function ChatManager:_receive_message(channel_id, pname, message, ...)
	-- lazily rechecks every time an outfit string is recieved. I have no idea how often this is and i do not care either
	if channel_id == 4 and Net:IsHost() then
		has_beardlib[pname] = string.find(message, "/BCO/") ~= nil -- checks for beardlib tag in outfit string

		Hooks:PostHook(NetworkPeer, "set_ip_verified", "set_ip_verified_sus", function(self, state)
			DelayedCalls:Add("loadfirstpls", 2, function()
				local modded = self:is_modded()
				local name = self:name()
				if modded then
					local temp = has_beardlib[name] and " and is running BeardLib!" or "!"
					managers.chat:feed_system_message(1, name.." has a modlist"..temp)
				else
					if has_beardlib[name] then
						managers.chat:feed_system_message(1, name.." is probably hiding their modlist! For shame!")
						managers.chat:feed_system_message(1, "Please check "..name.."'s modlist before taking any action.")
					else
						managers.chat:feed_system_message(1, name.." is mod-free so far.")
					end
				end
				was_warned[name] = true
			end)
		end)
	end
    return _receive_message_original(self, channel_id, pname, message, ...)
end