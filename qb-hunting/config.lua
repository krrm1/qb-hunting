Config = {}

Config.BaitCooldown = 1

--Config.EnableShopBlip = true

Config.TimeBeforeBaitStarts = 5000 -- (20000 = 20 seconds, this is to give the player enough time to move away from the bait )
Config.GiveOtherItem = false -- If you want to give other item or not
--Config.DistanceAnimalsSpook = 1 -- Distance the player can get to a baited target before it runs(Mtlions will attack at this range)

--Config.EnablePoaching = false
Config.IllegalPelt = 'illegalcarcass'

--Config.HuntingAnimals = {'a_c_boar','a_c_deer','a_c_coyote','a_c_mtlion'}

--Config.UseZones = true -- If true, Only allow hunting in specific Zones
--Config.Zones = {
--  'MTCHIL',
--  'CANNY',
--  'MTGORDO',
--  'CMSW',
--  'MTJOSE'
--}

Config.huntingitem = {
    [1] = {
        name = "WEAPON_SNIPERRIFLE",
        price = 2533,
        amount = 2,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "huntingbait",
        price = 20,
        amount = 100,
        info = {},
        type = "item",
        slot = 2,
    },
        [3] = {
        name = "snp_ammo",
        price = 10,
        amount = 20,
        info = {},
        type = "item",
        slot = 3,
    },
}
