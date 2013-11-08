AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/humans/scientist.mdl")
	self:SetSkin(math.random(1, 15))

	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()

	self:SetSolid(SOLD_BBOX)
	self:SetMoveType(MOVETYPE_STEP)

	self:CapabilitiesAdd(CAP_MOVE_GROUND | CAP_ANIMATEDFACE | CAP_TURN_HEAD)
	self:SetMaxYawSpeed(5000)

	self:SetHealth(100)
end

function ENT:OnTakeDamage(dmg)
	if dmg:GetAttacker():IsPlayer() and dmg:GetAttacker():Team() == self:GetTeam() then
		umsg.Start("ScientistDamagedWarning", dmg:GetAttacker())
		umsg.End()
		return
	end
	self:SetHealth(self:Health() - dmg:GetDamage())
	if self:Health() <= 0 then
		self:SetSchedule(SCHED_FALL_TO_GROUND)
		umsg.Start("ScientistKilled")
		umsg.End()
		if dmg:GetAttacker():IsPlayer() then
			umsg.Start("ScientistKilledWarning", dmg:GetAttacker())
			umsg.End()
			GAMEMODE.Teams[dmg:GetAttacker():Team()].efficency = math.max(0, GAMEMODE.Teams[dmg:GetAttacker():Team()].efficency - 0.1)
		end
	end
end