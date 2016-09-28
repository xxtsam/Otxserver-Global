<?xml version="1.0" encoding="UTF-8"?>
<monster name="Rift Invader" nameDescription="an Rift Invader" race="undead" experience="1300" speed="350" manacost="0">
	<health now="11700" max="11700"/>
	<look type="290" corpse="8966"/>
	<targetchange interval="20000" chance="15"/>
	<flags>
        <flag summonable="0"/>
		<flag attackable="1"/>
		<flag hostile="1"/>
		<flag illusionable="0"/>
		<flag convinceable="0"/>
		<flag pushable="0"/>
		<flag canpushitems="1"/>
		<flag staticattack="85"/>
		<flag lightlevel="0"/>
		<flag lightcolor="0"/>
		<flag targetdistance="1"/>
		<flag runonhealth="1"/>
	</flags>
	<attacks>
		<attack name="melee" interval="2000" skill="80" attack="180"/>
		<attack name="energy" interval="1000" chance="11" target="0" radius="4" min="0" max="-550">
			<attribute key="shootEffect" value="energy"/>
			<attribute key="areaEffect" value="purpleenergy"/>
		</attack>
		<attack name="energy" interval="1000" chance="12" range="3" target="1" min="0" max="-600">
			<attribute key="areaEffect" value="purpleenergy"/>
		</attack>
		<attack name="physical" interval="1000" chance="12" radius="4" target="0" min="0" max="-500">
			<attribute key="areaEffect" value="poff"/>
		</attack>
	</attacks>
	<defenses armor="55" defense="70">
		<defense name="healing" interval="2000" chance="15" min="160" max="350">
			<attribute key="areaEffect" value="blueshimmer"/>
		</defense>
	</defenses>
	<elements>
		<element earthPercent="-5"/>
	</elements>
	<immunities>
		<immunity energy="1"/>
		<immunity fire="1"/>
	</immunities>
	<voices interval="5000" chance="10">
		<voice sentence="BZZZZZZZZZZ"/>
	</voices>
</monster>
