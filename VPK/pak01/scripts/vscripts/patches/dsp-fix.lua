local DEBUG = 0

local function checkDSP()
    DSP_Soundscape = Entities:FindByClassname(nil, "env_soundscape")

    if DSP_Soundscape == nil then
        SpawnEntityFromTableAsynchronous("env_soundscape",
        { 
            enablesoundevent = true,
            soundevent = "dust2.outdoors_dsp",
            soundscape = "",
            radius = 3000,
            startdisabled = false,
            uselocaloffset = false,
            origin = "0.000000 0.000000 360.000000",
            angles = "0.000000 0.000000 0.000000",
            scales = "1.000000 1.000000 1.000000",
        }, nil, nil)
        if DEBUG == 1 then
            print("Map is missing DSP Soundscape. Creating one...")
            DeepPrintTable(DSP_Soundscape)
        end
    else
        -- Map has soundscape. We are good
    end
end

ListenToGameEvent("player_connect_full", checkDSP, nil)