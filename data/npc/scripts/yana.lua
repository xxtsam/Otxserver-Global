local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local IdToken = 25377 -- Configurar id do token
local items = {
	["mayhem"] = {
		["wand"] = {itemId = 26261, tokens_cost = 50, charged = 26271, heavycharged = 26281, overcharged = 26291},
		["rod"] = {itemId = 26262, tokens_cost = 50, charged = 26272, heavycharged = 26282, overcharged = 26292},
		["sword"] = {itemId = 26253, tokens_cost = 50, charged = 26263, heavycharged = 26273, overcharged = 26283},
		["slayer"] = {itemId = 26254, tokens_cost = 50, charged = 26264, heavycharged = 26274, overcharged = 26284},
		["axe"] = {itemId = 26255, tokens_cost = 50, charged = 26265, heavycharged = 26275, overcharged = 26285},
		["chopper"] = {itemId = 26256, tokens_cost = 50, charged = 26266, heavycharged = 26276, overcharged = 26286},
		["club"] = {itemId = 26257, tokens_cost = 50, charged = 26267, heavycharged = 26277, overcharged = 26287},
		["hammer"] = {itemId = 26258, tokens_cost = 50, charged = 26268, heavycharged = 26278, overcharged = 26288},
		["bow"] = {itemId = 26259, tokens_cost = 50, charged = 26269, heavycharged = 26280, overcharged = 26289},
		["crossbow"] = {itemId = 26361, tokens_cost = 50, charged = 26362, heavycharged = 26363, overcharged = 26364},
	},
	["carving"] = {
		["wand"] = {itemId = 26365, tokens_cost = 50, charged = 26366, heavycharged = 26367, overcharged = 26367},
		["rod"] = {itemId = 26369, tokens_cost = 50, charged = 26370, heavycharged = 26371, overcharged = 26372},
		["sword"] = {itemId = 26333, tokens_cost = 50, charged = 26334, heavycharged = 26335, overcharged = 26336},
		["slayer"] = {itemId = 26337, tokens_cost = 50, charged = 26338, heavycharged = 26339, overcharged = 26340},
		["axe"] = {itemId = 26341, tokens_cost = 50, charged = 26342, heavycharged = 26343, overcharged = 26344},
		["chopper"] = {itemId = 26345, tokens_cost = 50, charged = 26346, heavycharged = 26347, overcharged = 26348},
		["club"] = {itemId = 26349, tokens_cost = 50, charged = 26350, heavycharged = 26351, overcharged = 26352},
		["hammer"] = {itemId = 26353, tokens_cost = 50, charged = 26354, heavycharged = 26355, overcharged = 26356},
		["bow"] = {itemId = 26357, tokens_cost = 50, charged = 26358, heavycharged = 26359, overcharged = 26360},
		["crossbow"] = {itemId = 26361, tokens_cost = 50, charged = 26362, heavycharged = 26363, overcharged = 26364},
	},
	["remedy"] = {
		["wand"] = {itemId = 26325, tokens_cost = 50, charged = 26326, heavycharged = 26327, overcharged = 26328},
		["rod"] = {itemId = 26329, tokens_cost = 50, charged = 26330, heavycharged = 26331, overcharged = 26332},
		["sword"] = {itemId = 26293, tokens_cost = 50, charged = 26294, heavycharged = 26295, overcharged = 26296},
		["slayer"] = {itemId = 26297, tokens_cost = 50, charged = 26298, heavycharged = 26299, overcharged = 26300},
		["axe"] = {itemId = 26301, tokens_cost = 50, charged = 26302, heavycharged = 26303, overcharged = 26304},
		["chopper"] = {itemId = 26305, tokens_cost = 50, charged = 26306, heavycharged = 26307, overcharged = 26308},
		["club"] = {itemId = 26309, tokens_cost = 50, charged = 26310, heavycharged = 26311, overcharged = 26312},
		["hammer"] = {itemId = 26313, tokens_cost = 50, charged = 26314, heavycharged = 26315, overcharged = 26316},
		["bow"] = {itemId = 26317, tokens_cost = 50, charged = 26318, heavycharged = 26319, overcharged = 26320},
		["crossbow"] = {itemId = 26321, tokens_cost = 50, charged = 26322, heavycharged = 26323, overcharged = 26324},	
	}
}



local function creatureSayCallback(cid, type, msg)
    local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "mayhem") then
			npcHandler:say("Ah, very good. I can offer you a one-handed weapon: {sword}, {axe} or {club}. You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Which one do you choose?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "carving") then
			npcHandler:say("Ah, very good. I can offer you a one-handed weapon: {sword}, {axe} or {club}. You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Which one do you choose?", cid)
			npcHandler.topic[cid] = 3
		elseif msgcontains(msg, "remedy") then
			npcHandler:say("Ah, very good. I can offer you a one-handed weapon: {sword}, {axe} or {club}. You may also take a two-handed weapon: {slayer}, {chopper} or {hammer}. I also can offer you a {bow}, {crossbow}, {wand} or {rod}. Which one do you choose?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif npcHandler.topic[cid] == 2 then
		local itemsDisp = items["mayhem"]
		local finally = itemsDisp[msg]

		if finally then
			if player:removeItem(IdToken, finally.tokens_cost) then
				npcHandler:say("Ah, excellent. Here is your "..msg.." of mayhem.", cid)
				player:addItem(finally.itemId, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough of tokens.", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		local itemsDisp = items["carving"]
		local finally = itemsDisp[msg]

		if finally then
			if player:removeItem(IdToken, finally.tokens_cost) then
				npcHandler:say("Ah, excellent. Here is your "..msg.." of carving.", cid)
				player:addItem(finally.itemId, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough of tokens.", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	elseif npcHandler.topic[cid] == 4 then
		local itemsDisp = items["remedy"]
		local finally = itemsDisp[msg]

		if finally then
			if player:removeItem(IdToken, finally.tokens_cost) then
				npcHandler:say("Ah, excellent. Here is your "..msg.." of remedy.", cid)
				player:addItem(finally.itemId, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough of tokens.", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	elseif npcHandler.topic[cid] == 5 then
		if msgcontains(msg, "risk") then
			npcHandler:say({
				'If I overcharge your weapon, there\'s a risk that the charging doesn\'t succeed. See, the complex process of charging a weapon with this kind of {energy} is very challenging. ...',
				'It can make the weapon\'s substance very instable and in this case the charging won\'t succeed. Yet I\'d have to keep your tokens for my effort so they will be lost for you anyway. I hope you understand this. ...',
				'Of course, if it works your weapon will be remarkably more powerful for a certain time. It\'s up to you, make your choice.'
			}, cid)
		elseif msgcontains(msg, "energy") then
			npcHandler:say({
				'I\'m sorry but I won\'t reveal the exact process of charging a weapon. It\'s about keeping business secrets, you know. All I can tell you is that I use a special kind of energetic-based enchantment magic. ...',
				'It is consigned in my family for many generations. This is the reason why only special weapons, which I can offer you in exchange for {gold} tokens, can be charged with this method.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, "mayhem") then
			npcHandler:say("As you wish. Which kind of item do you want to charge: {sword}, {axe}, {club}, {slayer}, {chopper}, {hammer}, {bow}, {crossbow}, {wand} or {rod}?", cid)
			npcHandler.topic[cid] = 6
		elseif msgcontains(msg, "carving") then
			npcHandler:say("As you wish. Which kind of item do you want to charge: {sword}, {axe}, {club}, {slayer}, {chopper}, {hammer}, {bow}, {crossbow}, {wand} or {rod}?", cid)
			npcHandler.topic[cid] = 7
		elseif msgcontains(msg, "remedy") then
			npcHandler:say("As you wish. Which kind of item do you want to charge: {sword}, {axe}, {club}, {slayer}, {chopper}, {hammer}, {bow}, {crossbow}, {wand} or {rod}?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif npcHandler.topic[cid] == 6 then
		local itemsDisp = items["mayhem"]
		local finally = itemsDisp[msg]
		
		if finally then
			if player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.itemId) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.itemId, 1)
				player:addItem(finally.charged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.charged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.charged, 1)
				player:addItem(finally.heavycharged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.heavycharged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.heavycharged, 1)
				player:addItem(finally.overcharged, 1)
			else
				npcHandler:say("I'm sorry but you don't have the appropriate weapon. Come back if you're in the possession of a "..msg.." of mayhem.", cid)
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	elseif npcHandler.topic[cid] == 7 then
		local itemsDisp = items["carving"]
		local finally = itemsDisp[msg]
		
		if finally then
			if player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.itemId) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.itemId, 1)
				player:addItem(finally.charged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.charged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.charged, 1)
				player:addItem(finally.heavycharged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.heavycharged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.heavycharged, 1)
				player:addItem(finally.overcharged, 1)
			else
				npcHandler:say("I'm sorry but you don't have the appropriate weapon. Come back if you're in the possession of a "..msg.." of carving.", cid)
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	elseif npcHandler.topic[cid] == 8 then
		local itemsDisp = items["remedy"]
		local finally = itemsDisp[msg]
		
		if finally then
			if player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.itemId) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.itemId, 1)
				player:addItem(finally.charged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.charged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.charged, 1)
				player:addItem(finally.heavycharged, 1)
			elseif player:getItemCount(IdToken) >= 5 and player:getItemCount(finally.heavycharged) >= 1 then
				player:removeItem(IdToken, 5) 
				player:removeItem(finally.heavycharged, 1)
				player:addItem(finally.overcharged, 1)
			else
				npcHandler:say("I'm sorry but you don't have the appropriate weapon. Come back if you're in the possession of a "..msg.." of remedy.", cid)
			end
		else
			npcHandler:say("I\'m sorry but I did not understand what you said...", cid)
		end
	end

	if msgcontains(msg, "information") then
			npcHandler:say({
				'{Token}s are small objects made of metal or other materials. You can use them to buy superior equipment from {token} traders like me. ...',
				'There are several ways to obtain the tokens Im interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items. ...'
			}, cid)
	elseif msgcontains(msg, "token") then
				npcHandler:say("If you have any {gold} tokens with you, let's have a look! Maybe I can offer you something in exchange.", cid)
	elseif msgcontains(msg, "gold") then
			npcHandler:say({
				'Here\'s the deal, Jess Leewyn. For 50 of your gold tokens, I can offer you some special equipment pieces which you can {charge} with a certain item type. I have the following item types to offer: {mayhem}, {remedy} or {carving}. ...',
				'I may also give you a short {description} what these labels mean. So, which item type are you most interested in?'
			}, cid)
		   npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "charge") then
			npcHandler:say({
				'I may charge your equipment in the exchange of {gold} tokens. This gives your weapon some temporary improvements. For five tokens you\'ll get a charged weapon and for ten tokens a heavily charged one. ...',
				'For the cost of fifteen tokens I can also overcharge your weapon but that comes with a certain {risk}. There are three equipment types I can charge: {mayhem}, {remedy} or {carving}. What kind of weapon would you like to charge?'
			}, cid)
		   npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "description") then
			npcHandler:say({
				'A weapon of mayhem increases your chance to hit harder and to enhance the damage you inflict. A weapon of remedy gives you a certain chance to gain a part of a creature\'s life energy for yourself. ...',
				'And a weapon of carving does the same with a creature\'s mana.'
			}, cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
