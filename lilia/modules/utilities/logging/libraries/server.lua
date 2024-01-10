
function LoggerCore:PlayerAuthed(client, steamID)
    lia.log.add(client, "playerConnected", client, steamID)
end


function LoggerCore:PlayerDisconnected(client)
    local character = client:getChar()
    if character then lia.log.add(client, "playerDisconnected") end
end


function LoggerCore:PlayerHurt(client, attacker, health, damage)
    lia.log.add(client, "playerHurt", attacker:IsPlayer() and attacker:Name() or attacker:GetClass(), damage, health)
end

