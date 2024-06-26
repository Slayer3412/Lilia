﻿--[[--
Permissions - Spawning.

This module manages spawning permissions and also patches some exploits.
]]
-- @moduleinfo spawning
MODULE.name = "Permissions - Spawning"
MODULE.author = "76561198312513285"
MODULE.discord = "@liliaplayer"
MODULE.desc = "A Module that Manages Spawning."
MODULE.CAMIPrivileges = {
    {
        Name = "Spawn Permissions - Can Spawn Ragdolls",
        MinAccess = "admin",
        Description = "Allows access to spawning ."
    },
    {
        Name = "Spawn Permissions - Can Spawn SWEPs",
        MinAccess = "superadmin",
        Description = "Allows access to spawning SWEPs."
    },
    {
        Name = "Spawn Permissions - Can Spawn Effects",
        MinAccess = "admin",
        Description = "Allows access to spawning Effects."
    },
    {
        Name = "Spawn Permissions - Can Spawn Props",
        MinAccess = "admin",
        Description = "Allows access to spawning Props."
    },
    {
        Name = "Spawn Permissions - Can Spawn Blacklisted Props",
        MinAccess = "superadmin",
        Description = "Allows access to spawning Blacklisted Props."
    },
    {
        Name = "Spawn Permissions - Can Spawn NPCs",
        MinAccess = "superadmin",
        Description = "Allows access to spawning NPCs."
    },
    {
        Name = "Spawn Permissions - No Car Spawn Delay",
        MinAccess = "superadmin",
        Description = "Allows a user to not have car spawn delay."
    },
    {
        Name = "Spawn Permissions - No Spawn Delay",
        MinAccess = "admin",
        Description = "Allows a user to not have spawn delay."
    },
    {
        Name = "Spawn Permissions - Can Spawn Cars",
        MinAccess = "admin",
        Description = "Allows access to Spawning Cars."
    },
    {
        Name = "Spawn Permissions - Can Spawn Restricted Cars",
        MinAccess = "superadmin",
        Description = "Allows access to Spawning Restricted Cars."
    },
    {
        Name = "Spawn Permissions - Can Spawn SENTs",
        MinAccess = "admin",
        Description = "Allows access to Spawning SENTs."
    },
}