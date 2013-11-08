ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName    = "Scientist"
ENT.Author       = "cash4ads"
ENT.Contact      = "contact@cash4ads.biz"
ENT.Purpose      = "SI Scientist"
ENT.Instructions = "do not touch"

function ENT:OnRemove()
end

function ENT:PhysicsCollide(data, physobj)
end

function ENT:PhysicsUpdate(physobj)
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Team")
end