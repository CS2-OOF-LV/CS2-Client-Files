local filePrecached = 0

function PreloadScript(event)
    if (filePrecached ~= 1) then
        if (GetMapName() ~= "<empty>") then
            if (ScriptIsWarmupPeriod() == true) then
                SendToServerConsole("sv_cheats 1")
                SendToServerConsole("script_reload_code patches/precacheScript")
                SendToServerConsole("sv_cheats 0")
                --print("Precached SoundEvents for new user!")
                filePrecached = 1
            else 
                --print("Game already started. Don't need to precache again")
            end
        else
            --print("We are in the main menu. Don't need to preload file yet!")
        end
    else
        --print("File already precached. Ignoring load...")
    end
end

function Activate()
    ListenToGameEvent("player_spawn", PreloadScript, nil)
end

Activate()