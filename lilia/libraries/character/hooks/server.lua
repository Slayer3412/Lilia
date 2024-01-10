﻿local GM = GM or GAMEMODE
function GM:CanDeleteChar(_, char)
    if char:getMoney() < lia.config.DefaultMoney then return true end
end

function GM:PrePlayerLoadedChar(client, _, _)
    client:SetBodyGroups("000000000")
    client:SetSkin(0)
    client:ExitVehicle()
    client:Freeze(false)
end

function GM:CreateDefaultInventory(character)
    local charID = character:getID()
    if lia.inventory.types["grid"] then
        return         lia.inventory.instance(
            "grid",
            {
                char = charID
            }
        )
    end
end

function GM:CharacterPreSave(character)
    local client = character:getPlayer()
    if not character:getInv() then return end
    for _, v in pairs(character:getInv():getItems()) do
        if v.onSave then v:call("onSave", client) end
    end
end

function GM:PlayerLoadedChar(client, character, lastChar)
    local timeStamp = os.date("%Y-%m-%d %H:%M:%S", os.time())
    lia.db.updateTable(
        {
            _lastJoinTime = timeStamp
        },
        nil,
        "characters",
        "_id = " .. character:getID()
    )

    if lastChar then
        local charEnts = lastChar:getVar("charEnts") or {}
        for _, v in ipairs(charEnts) do
            if v and IsValid(v) then v:Remove() end
        end

        lastChar:setVar("charEnts", nil)
    end

    if IsValid(client.liaRagdoll) then
        client.liaRagdoll.liaNoReset = true
        client.liaRagdoll.liaIgnoreDelete = true
        client.liaRagdoll:Remove()
    end

    character:setData("loginTime", os.time())
    hook.Run("PlayerLoadout", client)
end

function GM:CharacterLoaded(id)
    local character = lia.char.loaded[id]
    if character then
        local client = character:getPlayer()
        if IsValid(client) then
            local uniqueID = "liaSaveChar" .. client:SteamID()
            timer.Create(
                uniqueID,
                lia.config.CharacterDataSaveInterval,
                0,
                function()
                    if IsValid(client) and client:getChar() then
                        client:getChar():save()
                    else
                        timer.Remove(uniqueID)
                    end
                end
            )
        end
    end
end

function GM:OnCharFallover(client, entity, bFallenOver)
    bFallenOver = bFallenOver or false
    if IsValid(entity) then
        entity:SetCollisionGroup(COLLISION_GROUP_NONE)
        entity:SetCustomCollisionCheck(false)
    end

    client:setNetVar("fallingover", bFallenOver)
end
