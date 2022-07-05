local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()

  Citizen.Wait(500)

    RequestModel("cs_hunter")
    while not HasModelLoaded("cs_hunter") do
        Wait(500)
    end

    local ped =  CreatePed(0, 'cs_hunter', Config.PedsCoords[1].coords.x, Config.PedsCoords[1].coords.y, Config.PedsCoords[1].coords.z, Config.PedsCoords[1].heading, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_AA_SMOKE', true)

    exports['kd-target']:AddBoxZone("pedshop1", Config.PedsCoords[1].coords, 1.0, 1.2, {
    name = "pedshop1",
    heading=45,
    debugPoly = Config.debug,
    minZ=16.53,
    maxZ=18.33,
  }, {
    options = {
      { 
        num = 1,
        type = "client",
        event = "hunting:shop",
        icon = 'fas fa-shopping-basket ',
        label = 'hunting shop',
      }
    },
    distance = 2.5,
  })
end)

Citizen.CreateThread(function()

  Citizen.Wait(500)
  
    RequestModel("cs_josef")
    while not HasModelLoaded("cs_josef") do
        Wait(500)
    end

    local ped =  CreatePed(0, 'cs_josef', Config.PedsCoords[2].coords.x, Config.PedsCoords[2].coords.y, Config.PedsCoords[2].coords.z, Config.PedsCoords[2].heading, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_AA_SMOKE', true)


    exports['kd-target']:AddBoxZone("pedshop2", Config.PedsCoords[2].coords, 1, 1, {
    name = "pedshop2",
    heading=0,
    debugPoly = Config.debug,
    minZ=41.3,
    maxZ=42.9,
  }, {
    options = {
      { 
        num = 1,
        type = "client",
        event = "arabcodingteam-hunting:client:sell",
        icon = 'fas fa-shopping-basket ',
        label = 'sell',
      }
    },
    distance = 1.5,
  })
end)
