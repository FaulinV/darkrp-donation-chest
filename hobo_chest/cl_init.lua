include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    if self.Entity:GetPos():Distance(LocalPlayer():GetPos()) > 300 then return end

    local dx = Vector(-19, -10, 30)
    local da = Angle(0, 90, 75)
    local scale = 0.1 

    cam.Start3D2D(self:LocalToWorld(dx), self:LocalToWorldAngles(da), scale)
        draw.RoundedBox(0, -130, 10, 460, 215, Color(43, 49, 54, 255))
        draw.RoundedBox(0, -130, 10, 460, 28, Color(255, 59, 0, 255))
        draw.SimpleText("Donation Chest", "Trebuchet24", 0, 23, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
