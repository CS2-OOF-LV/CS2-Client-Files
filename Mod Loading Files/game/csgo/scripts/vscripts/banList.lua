local bannedPlayers = { -- You can add players to the banlist using their SteamID3
    "[U:1:372278500]",
}

local banlistCount = 0

function PrintBanList()
    banlistCount = 0
    for _, id in ipairs(bannedPlayers) do
        banlistCount = banlistCount + 1
    end

    if banlistCount > 0 then
        print("Found " .. banlistCount .. " banned player in script.")
    else
        print("Found no banned players in script.")
    end
end

function ShowBanList()
    for k,v in ipairs(bannedPlayers) do
        print(k, v)
    end
end

function CheckBanList(event)
    if GetMapName() ~= "<empty>" then -- if we're not in menu check for banned players
        DeepPrintTable(event)
        for _, id in ipairs(bannedPlayers) do
            if(id == event.networkid) then
                SendToServerConsole("kickid " .. event.userid .. " You have been banned from this server!")
            end
        end
    end
end

function ReloadBanList()
    SendToServerConsole("sv_cheats 1")
    SendToServerConsole("script_reload_code banList.lua")
    SendToServerConsole("sv_cheats 0")
    print("Reloaded Ban List!")
end

function Activate()
    ListenToGameEvent("player_connect", CheckBanList, nil)
    Convars:RegisterCommand("ReloadBanList", ReloadBanList, "Writes all cvars into a the statusConvar.cfg", 0x1000)
    Convars:RegisterCommand("PrintBanList", ShowBanList, "Prints the banlist into the server console", 0x1000)
end

Activate()
PrintBanList()