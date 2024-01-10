﻿function PerfomanceCore:InitializedModules()
    for hookType, identifiers in pairs(self.RemovableHooks) do
        for _, identifier in ipairs(identifiers) do
            if hook.GetTable()[hookType] and hook.GetTable()[hookType][identifier] then hook.Remove(hookType, identifier) end
        end
    end

    if SERVER then
        self:ServersideInitializedModules()
    else
        self:ClientsideInitializedModules()
    end
end
