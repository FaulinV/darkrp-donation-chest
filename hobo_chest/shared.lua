ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "Faulin"

ENT.PrintName = "Hobo Donation Chest"
ENT.Category = "Entity"
ENT.Spawnable = true

function ENT:SetupDataTables()
    -- The owner of the Entity
    self:NetworkVar("Entity", 0, "owning_ent")
    -- How much money the Entity is holding
    self:NetworkVar("Int", 1, "Money")
end
