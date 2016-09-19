local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local t = {}
local renown = {}

local config = {
	['earthheart cuirass'] = {itemid = 25177, token = {type = 'silver', id = 25172, count = 100}},
	['earthheart platemail'] = {itemid = 25179, token = {type = 'silver', id = 25172, count = 100}},
	['earthmind raiment'] = {itemid = 25191, token = {type = 'silver', id = 25172, count = 100}},
	['earthsoul tabard'] = {itemid = 25187, token = {type = 'silver', id = 25172, count = 100}},
	['fireheart cuirass'] = {itemid = 25174, token = {type = 'silver', id = 25172, count = 100}},
	['fireheart hauberk'] = {itemid = 25175, token = {type = 'silver', id = 25172, count = 100}},
	['fireheart platemail'] = {itemid = 25176, token = {type = 'silver', id = 25172, count = 100}},
	['firemind raiment'] = {itemid = 25190, token = {type = 'silver', id = 25172, count = 100}},
	['firesoul tabard '] = {itemid = 25186, token = {type = 'silver', id = 25172, count = 100}},
	['frostheart cuirass'] = {itemid = 18517, token = {type = 'silver', id = 25172, count = 100}},
	['frostheart hauberk'] = {itemid = 25184, token = {type = 'silver', id = 25172, count = 100}},
	['frostheart platemail'] = {itemid = 25185, token = {type = 'silver', id = 25172, count = 100}},
	['frostmind raiment'] = {itemid = 25193, token = {type = 'silver', id = 25172, count = 100}},
	['frostsoul tabard'] = {itemid = 25189, token = {type = 'silver', id = 25172, count = 100}},
	['thunderheart cuirass'] = {itemid = 25180, token = {type = 'silver', id = 25172, count = 100}},
	['thunderheart hauberk'] = {itemid = 25181, token = {type = 'silver', id = 25172, count = 100}},
	['thunderheart platemail'] = {itemid = 25182, token = {type = 'silver', id = 25172, count = 100}},
	['thundermind raiment'] = {itemid = 25192, token = {type = 'silver', id = 25172, count = 100}},
	['thundermind tabard'] = {itemid = 25188, token = {type = 'silver', id = 25172, count = 100}},	
	}

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, 'Blessings, |PLAYERNAME|! How may I be of service? Do you wish to trade some {token}s?')
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, 'token') then
		npcHandler:say({
			'For 100 of your silver tokens, I can offer you: {earthheart cuirass}, {earthheart platemail}, {earthmind raiment}, {earthsoul Tabard} , {fireheart cuirass}, {fireheart hauberk}, {fireheart platemail}, {firemind raiment}, {firesoul Tabard}, {frostheart cuirass}, {frostheart hauberk}, {frostheart platemail}, {frostmind raiment}, {frostsoul tabard}, {thunderheart cuirass}, {thunderheart hauberk}, {thunderheart platemail}, {thundermind raiment}, {thundersoul tabard}.',
		}, cid)
	elseif config[msg] then
		local itemType = ItemType(config[msg].itemid)
		npcHandler:say(string.format('Do you want to trade %s %s for %d %s tokens?', (itemType:getArticle() ~= "" and itemType:getArticle() or ""), itemType:getName(), config[msg].token.count, config[msg].token.type), cid)
		npcHandler.topic[cid] = 1
		t[cid] = msg
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			local player, targetTable = Player(cid), config[t[cid]]
			if player:getItemCount(targetTable.token.id) < targetTable.token.count then
				npcHandler:say('Sorry, you don\'t have enough ' .. targetTable.token.type .. ' tokens with you.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			local item = Game.createItem(targetTable.itemid, 1)
			local weight = 0
			weight = ItemType(item.itemid):getWeight(item:getCount())

			if player:addItemEx(item) ~= RETURNVALUE_NOERROR then
				if player:getFreeCapacity() < weight then
					npcHandler:say('First make sure you have enough capacity to hold it.', cid)
				else
					npcHandler:say('First make sure you have enough space in your inventory.', cid)
				end
				npcHandler.topic[cid] = 0
				return true
			end
			player:removeItem(targetTable.token.id, targetTable.token.count)
			npcHandler:say('Here have one of our ' .. item:getPluralName() .. '.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

local function onReleaseFocus(cid)
	t[cid], renown[cid] = nil, nil
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())