﻿function F1MenuCore:PlayerDeath(client)
    netstream.Start(client, "removeF1")
end
