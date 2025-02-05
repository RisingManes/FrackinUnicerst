function init()
	self.powerModifier = config.getParameter("powerModifier", 0)
    effect.addStatModifierGroup({{stat = "powerMultiplier", effectiveMultiplier = self.powerModifier}})
	local rAmt=config.getParameter("resistanceAmount", 0)
	local dAmt=config.getParameter("defenseAmount", 0)
	if status.statPositive("specialStatusImmunity") then
		rAmt=rAmt*0.25
		dAmt=dAmt*0.25
	end
	effect.addStatModifierGroup({
		{stat = "protection", amount = dAmt},
		{stat = "physicalResistance", amount = rAmt},
		{stat = "fireResistance", amount = rAmt},
		{stat = "iceResistance", amount = rAmt},
		{stat = "poisonResistance", amount = rAmt},
		{stat = "electricResistance", amount = rAmt},
		{stat = "radioactiveResistance", amount = rAmt},
		{stat = "shadowResistance", amount = rAmt},
		{stat = "cosmicResistance", amount = rAmt}
	})
	makeAlert()
	script.setUpdateDelta(0)
end

function makeAlert()
	if entity.entityType()=="player" then
		local statusTextRegion = { 0, 1, 0, 1 }
		animator.setParticleEmitterOffsetRegion("statustext", statusTextRegion)
		animator.burstParticleEmitter("statustext")
	end
end

function update(dt)

end

function uninit()

end