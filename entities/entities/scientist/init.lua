AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/kleiner.mdl")

	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()

	self:SetSolid(SOLD_BBOX)
	self:SetMoveType(MOVETYPE_STEP)

	self:CapabilitiesAdd(CAP_MOVE_GROUND | CAP_ANIMATEDFACE | CAP_TURN_HEAD)
	self:SetMaxYawSpeed(5000)

	self:SetHealth(100)
end

function ENT:OnTakeDamage(dmg)
	self:SetHealth(self:Health() - dmg:GetDamage())
	if self:Health() <= 0 then
		self:SetSchedule(SCHED_FALL_TO_GROUND)
		umsg.Start("ScientistKilled")
		umsg.End()
		if dmg:GetAttacker():IsPlayer() then
			umsg.Start("ScientistKilledWarning", dmg:GetAttacker())
			umsg.End()
		end
	end
end