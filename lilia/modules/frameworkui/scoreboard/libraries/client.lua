﻿------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ScoreboardCore:ScoreboardHide()
    if IsValid(lia.gui.score) then
        lia.gui.score:SetVisible(false)
        CloseDermaMenus()
    end

    gui.EnableScreenClicker(false)
    return true
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ScoreboardCore:ScoreboardShow()
    if IsValid(lia.gui.score) then
        lia.gui.score:SetVisible(true)
    else
        vgui.Create("liaScoreboard")
    end

    gui.EnableScreenClicker(true)
    return true
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ScoreboardCore:OnReloaded()
    if IsValid(lia.gui.score) then lia.gui.score:Remove() end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MODULE:ShowPlayerOptions(client, options)
    if CAMI.PlayerHasAccess(LocalPlayer(), "Staff Permissions - Can Access Scoreboard Info Out Of Staff") or (CAMI.PlayerHasAccess(LocalPlayer(), "Staff Permissions - Can Access Scoreboard Admin Options") and LocalPlayer():isStaffOnDuty()) then
        options["Player Profile"] = {"icon16/user.png", function() if IsValid(client) then client:ShowProfile() end end}
        options["Player Steam ID"] = {"icon16/user.png", function() if IsValid(client) then SetClipboardText(client:SteamID()) end end}
        options["Move To Player"] = {"icon16/user.png", function() LocalPlayer():ConCommand("say !goto " .. client:SteamID()) end}
        options["Bring Player"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say !bring " .. client:SteamID()) end end}
        options["Return Player"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say !return " .. client:SteamID()) end end}
        options["Slay Player"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say !slay " .. client:SteamID()) end end}
        options["Respawn Player"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say !respawn " .. client:SteamID()) end end}
        options["Change Name"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say /charsetname " .. client:SteamID()) end end}
        options["Change Description"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say /charsetdesc " .. client:SteamID()) end end}
        options["Change Model"] = {"icon16/user.png", function() if IsValid(client) then OpenPlayerModelUI(client) end end}
        options["Check Flags"] = {"icon16/user.png", function() if IsValid(client) then LocalPlayer():ConCommand("say /flags " .. client:SteamID()) end end}
    end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
