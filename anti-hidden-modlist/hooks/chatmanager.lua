local Net = _G.LuaNetworking
local hasbeardlib = {}
local warned = {}

local _receive_message_original = ChatManager._receive_message
function ChatManager:_receive_message(channel_id, pname, message, ...)
        if channel_id == 4 and Net:IsHost() then
                -- checks for beardlib tag in outfit string
                hasbeardlib[pname] = string.find(message, '/BCO/') ~= nil
        end
        return _receive_message_original(self, channel_id, pname, message, ...)
end

Hooks:PostHook(
        NetworkPeer,
        'set_ip_verified',
        'AHM_set_ip_verified',
        function(self, state)
                DelayedCalls:Add(
                        self:name() .. 'waitforload',
                        5,
                        function()
                                local modded = self:is_modded()
                                local name = self:name()
                                warned[name] = warned[name] or 0
                                if modded then
                                        if hasbeardlib[name] and warned[name] < 4 then
                                                managers.chat:feed_system_message(1, name .. ' has a modlist and is running BeardLib!')
                                                warned[name] = 3
                                        elseif warned[name] < 3 then
                                                managers.chat:feed_system_message(1, name .. ' has a modlist!')
                                                warned[name] = 2
                                        end
                                else
                                        if hasbeardlib[name] then
                                                managers.chat:feed_system_message(1, name .. ' is probably hiding their modlist! For shame!')
                                                managers.chat:feed_system_message(1, 'Please check ' .. name .. "'s modlist before taking any action.")
                                                warned[name] = 4
                                        elseif warned[name] == 0 then
                                                managers.chat:feed_system_message(1, name .. ' is mod-free so far.')
                                                warned[name] = 1
                                        end
                                end
                        end
                )
        end
)
