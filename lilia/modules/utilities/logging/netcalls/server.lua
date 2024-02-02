﻿---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
util.AddNetworkString("liaRequestLogs")
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
util.AddNetworkString("liaDrawLogs")
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
util.AddNetworkString("liaRequestLogs")
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
net.Receive("liaRequestLogs", function(_, client)
    if not CAMI.PlayerHasAccess(client, "Commands - View Logs", nil) then
        client:notify(":|")
        return
    end

    local selectedDate = net.ReadString()
    local logs = LoggerCore:ReadLogsFromFile(selectedDate)
    net.Start("liaDrawLogs")
    net.WriteTable(logs)
    net.Send(client)
end)
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
