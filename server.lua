--[[
============================================================
  STEAM_REQUIRED — FiveM resource
  Author : Brooksy172
  ID     : SR-5F9A-2B7C
  NOTE   : DO NOT REMOVE THIS HEADER / WATERMARK.
           Redistribution, claiming authorship, or selling
           this script without explicit permission is prohibited.
  Copyright (c) 2025 YourNameHere. All rights reserved.
============================================================
]]


AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local src = source
    deferrals.defer()

    Wait(500)
    deferrals.update("🔍 Checking your connection...")

    Wait(1000)
    deferrals.update("🔍 Checking Steam status...")

    local hasSteam = false

    for _, identifier in ipairs(GetPlayerIdentifiers(src)) do
        if identifier:sub(1, 6) == "steam:" then
            hasSteam = true
            break
        end
    end

    Wait(1500)

    if not hasSteam then
        deferrals.done([[
🛑 **Steam Not Detected!**
------------------------------------
You must have **Steam open** to join this server.

✅ Close FiveM
✅ Open Steam and log in
▶️ Start FiveM again

If Steam *is* open, restart FiveM completely.
        ]])
        return
    end

    deferrals.update("✅ Steam detected! Finalizing connection...")
    Wait(800)
    deferrals.done()
end)
