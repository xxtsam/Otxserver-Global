local freeBlessMaxLevel = 130

function onLogin(player)
	if player:getLevel() <= freeBlessMaxLevel then
		for i = 1, 6 do
			player:addBlessing(i)
		end
	end

	player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	player:say('FREE BLESS LVL ' .. freeBlessMaxLevel .. '.', TALKTYPE_ORANGE_1)
	return true
end
