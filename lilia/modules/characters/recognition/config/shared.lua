﻿--[[ Is character recognition enabled? ]]
RecognitionCore.RecognitionEnabled = true
--[[ Do members from the same faction always auto-recognize each other? ]]
RecognitionCore.FactionAutoRecognize = false
--[[ Are fake names enabled? ]]
RecognitionCore.FakeNamesEnabled = false
--[[ Variables to hide from a non-recognized character in the scoreboard ]]
RecognitionCore.ScoreboardHiddenVars = {"name", "model", "desc"}
--[[ Chat types that are recognized ]]
RecognitionCore.ChatIsRecognized = {"ic", "y", "w", "me"}
--[[ Factions that auto-recognize members between each other ]]
RecognitionCore.MemberToMemberAutoRecognition = {
    [FACTION_STAFF] = true,
}
