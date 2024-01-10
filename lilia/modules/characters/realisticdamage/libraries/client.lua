﻿function RealisticDamageCore:DrawCharInfo(client, _, info)
    local injText, injColor = hook.Run("GetInjuredText", client)
    if injText then info[#info + 1] = {L(injText), injColor} end
end
