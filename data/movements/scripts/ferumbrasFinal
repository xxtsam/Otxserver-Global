-- Ferumbras Quest editada por xxtsam
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(51991, 51992, 51993, 51994, 51995, 51996, 51997) >= 1 and player:getLevel() >= 150 then
		player:teleportTo(Position(33293, 31453, 12))
	else
		player:teleportTo(Position(33278, 32392, 8))
		player:sendCancelMessage("You need kill 7 boss ferumbras quest to acess final room.")
	end
	return true
end
