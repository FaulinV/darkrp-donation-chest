## Download and Install
This script folder is best placed at the path below:
darkrpmodification\lua\entities\hobo_chest

You can add this donation box to your F4 > Entities by adding this code in your `darkrpmodification\lua\darkrp_customthings\entities.lua`


    DarkRP.createEntity("Donation box", {
    ent = "donation_box",
    model = "models/props/CS_militia/footlocker01_open.mdl",
    price = 1000,
    max = 1,
    cmd = "buydonationchest",
    category = "Entities",
    allowed = {TEAM_HOBO}
    })
    
