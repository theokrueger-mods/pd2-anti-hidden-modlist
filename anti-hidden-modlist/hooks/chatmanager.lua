local Net = _G.LuaNetworking
local modders = {}
local warned = {}

-- intercept all messages
Hooks:PostHook(
        ChatManager,
        '_recieve_message',
        'AHM_recieve_message',
        function(self, channel_id, name, message, color, icon)
                if channel_id == 4 and Net:IsHost() then
                        -- check for beardlib outfit string. if this exists we know they for sure are running mods
                        modders[name] = string.find(message, '/BCO/') ~= nil
                end
        end
)

-- when a client joins n stuff
Hooks:PostHook(
        NetworkPeer,
        'set_ip_verified',
        'AHM_set_ip_verified',
        function(self, state)
                -- wait an additional 7 seconds for a modlist to load
                DelayedCalls:Add(
                        'AHM_wait_for_' .. self:name .. '_' .. math.random(),
                        7,
                        function()
                                -- get some info
                                local modded = self:is_modded()
                                local name = self:name()

                                -- inform the user of this information now
                                managers.chat:feed_system_message(
                                        1,
                                        name ..
                                        modders[name] and
                                        -- if had beardlib
                                        (
                                                ' is running beardlib' ..
                                                (
                                                        modded and
                                                        -- if has modlist and beardlib
                                                        ' and is showing their modlist!' or
                                                        -- if has no modlist and beardib >:(
                                                        ' but is HIDING their modlist! for shame!!'
                                                )
                                        )
                                        or
                                        -- if not has beardlib
                                        (
                                                ' is not running beardlib' ..
                                                (
                                                        modded and
                                                        -- if has modlist and no beardlib
                                                        ' but has a modlist!'
                                                        or
                                                        -- if has no modlist and no beardlib
                                                        ' and appears to be free of mods!'
                                                )
                                        )
                                ) -- end feed_system_message
                        end
                ) -- end delayedcall
        end
)
