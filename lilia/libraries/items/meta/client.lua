﻿local ITEM = lia.meta.item or {}
debug.getregistry().Item = lia.meta.item
ITEM.__index = ITEM
function ITEM:getName()
    return L(self.name)
end

function ITEM:getDesc()
    return L(self.desc)
end

lia.meta.item = ITEM
