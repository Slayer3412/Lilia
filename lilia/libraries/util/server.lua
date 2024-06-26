﻿function lia.util.notify(message, recipient)
    net.Start("liaNotify")
    net.WriteString(message)
    if recipient == nil then
        net.Broadcast()
    else
        net.Send(recipient)
    end
end

function lia.util.SpawnEntities(entityTable)
    for entity, position in pairs(entityTable) do
        if isvector(position) then
            local newEnt = ents.Create(entity)
            if IsValid(newEnt) then
                newEnt:SetPos(position)
                newEnt:Spawn()
            end
        else
            print("Invalid position for entity", entity)
        end
    end
end

function lia.util.notifyLocalized(message, recipient, ...)
    local args = {...}
    if recipient ~= nil and not istable(recipient) and type(recipient) ~= "Player" then
        table.insert(args, 1, recipient)
        recipient = nil
    end

    net.Start("liaNotifyL")
    net.WriteString(message)
    net.WriteUInt(#args, 8)
    for i = 1, #args do
        net.WriteString(tostring(args[i]))
    end

    if recipient == nil then
        net.Broadcast()
    else
        net.Send(recipient)
    end
end

function lia.util.findEmptySpace(entity, filter, spacing, size, height, tolerance)
    spacing = spacing or 32
    size = size or 3
    height = height or 36
    tolerance = tolerance or 5
    local position = entity:GetPos()
    local mins = Vector(-spacing * 0.5, -spacing * 0.5, 0)
    local maxs = Vector(spacing * 0.5, spacing * 0.5, height)
    local output = {}
    for x = -size, size do
        for y = -size, size do
            local origin = position + Vector(x * spacing, y * spacing, 0)
            local data = {}
            data.start = origin + mins + Vector(0, 0, tolerance)
            data.endpos = origin + maxs
            data.filter = filter or entity
            local trace = util.TraceLine(data)
            data.start = origin + Vector(-maxs.x, -maxs.y, tolerance)
            data.endpos = origin + Vector(mins.x, mins.y, height)
            local trace2 = util.TraceLine(data)
            if trace.StartSolid or trace.Hit or trace2.StartSolid or trace2.Hit or not util.IsInWorld(origin) then continue end
            output[#output + 1] = origin
        end
    end

    table.sort(output, function(a, b) return a:Distance(position) < b:Distance(position) end)
    return output
end

function lia.util.spawnProp(model, position, force, lifetime, angles, collision)
    local entity = ents.Create("prop_physics")
    entity:SetModel(model)
    entity:Spawn()
    entity:SetCollisionGroup(collision or COLLISION_GROUP_WEAPON)
    entity:SetAngles(angles or angle_zero)
    if type(position) == "Player" then position = position:GetItemDropPos(entity) end
    entity:SetPos(position)
    if force then
        local phys = entity:GetPhysicsObject()
        if IsValid(phys) then phys:ApplyForceCenter(force) end
    end

    if (lifetime or 0) > 0 then timer.Simple(lifetime, function() if IsValid(entity) then entity:Remove() end end) end
    return entity
end

function lia.util.DebugLog(str)
    MsgC(Color("sky_blue"), os.date("(%d/%m/%Y - %H:%M:%S)", os.time()), Color("yellow"), " [LOG] ", color_white, str, "\n")
end

function lia.util.DebugMessage(msg, ...)
    MsgC(Color(70, 150, 255), "[CityRP] DEBUG: ", string.format(msg, ...), "\n")
end

function lia.util.DWarningMessage(message, ...)
    MsgC(Color(255, 100, 0), string.format(message, ...), "\n")
end

function lia.util.ChatPrint(target, ...)
    netstream.Start(target, "ChatPrint", {...})
end