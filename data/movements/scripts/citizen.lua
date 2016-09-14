function onStepIn(creature, item, position, fromPosition)
	if item.actionid > 30020 and item.actionid < 30050 then
		local player = creature:getPlayer()
		if player == nil then
			return false
		end

		if town:getId() == 12 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
			player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You first need to absolve the Barbarian Test Quest to become citizen!')
			player:teleportTo(town:getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		local town = Town(item.actionid - 30020)
		player:setTown(town)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are the newest resident of " .. town:getName(town) .. ".")
	end
	return true
end
