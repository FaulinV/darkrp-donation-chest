AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- Set the fixed donation amount here (in dollars)
local fixedDonationAmount = 5000

if SERVER then
    function ENT:Initialize()
        if CLIENT then return end
        self:SetModel("models/props/CS_militia/footlocker01_open.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)

        local phys = self:GetPhysicsObject()

        if phys:IsValid() then
            phys:Wake()
        end
    end

    function ENT:Think()
        if not IsValid(self:Getowning_ent()) then
            self:Remove()
        end
    end

    function ENT:Use(activator, caller)
        local moneyValue = self:GetMoney()
        local formattedValue = DarkRP.formatMoney(moneyValue)

        if caller == self:Getowning_ent() and moneyValue > 0 and IsValid(caller) and caller:IsPlayer() then
            caller:addMoney(moneyValue)
            self:SetMoney(0)
            DarkRP.notify(caller, 0, 3, "You collected " .. formattedValue .. " from the donation box")
        elseif caller == self:Getowning_ent() and moneyValue == 0 and IsValid(caller) and caller:IsPlayer() then
            DarkRP.notify(caller, 1, 3, "The donation box is empty")
        else
            if caller:canAfford(fixedDonationAmount) then
                caller:addMoney(-fixedDonationAmount)
                self:SetMoney(self:GetMoney() + fixedDonationAmount)
                DarkRP.notify(caller, 1, 3, "You donated $" .. fixedDonationAmount .. " for " .. self:Getowning_ent():Nick())
            else
                DarkRP.notify(caller, 1, 3, "You can't afford to donate $" .. fixedDonationAmount)
            end
        end
    end
end
