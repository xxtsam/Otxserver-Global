function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(51997) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This room has been completed, go to next.")
	else
		player:teleportTo(Position(33309, 32377, 13))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You escaped. To complete this part of the mission It is necessary to kill the boss.")
	end
	return true
end
