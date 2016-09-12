local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
--combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_POISONFIELD_PVP)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onCastSpell(creature, variant, isHotkey)
if getPlayerStorageValue(creature, 357812) == 1  or getPlayerStorageValue(creature, 357819) == 1 then
        return false
    end
	return combat:execute(creature, variant)
end
