local QBCore = exports['qb-core']:GetCoreObject()
local cooldown = 0
local used = false
local jobSpawned = false
local refreshPed = false
local jobPed
local useBaitCooldown = 3
local illegalhunting = false

local HuntingZones =  { 
  'MTCHIL',
  'CANNY',
  'MTGORDO',
  'CMSW',
  'MTJOSE',
}

local HuntingAnimals = {
  'a_c_boar',
  'a_c_deer',
  'a_c_coyote',
  'a_c_mtlion',
}

Citizen.CreateThread(function()
  blip = AddBlipForCoord(-679.89,5838.79,16.33)
  SetBlipSprite(blip, 141)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, 0.8)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Hunting Shop")
  EndTextCommandSetBlipName(blip)

  blip = AddBlipForCoord(569.75, 2796.62, 42.02) 
  SetBlipSprite(blip, 52)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, 0.8)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("legal sell ")
  EndTextCommandSetBlipName(blip)
  
  
  local legalHunts = {
    `a_c_boar`,
    `a_c_deer`,
    `a_c_coyote`,
    `a_c_mtlion`,
  }

  local illlegalHunts = {
    `a_c_chop`,
    `a_c_husky`,
    `a_c_retriever`,
    `a_c_westy`,
    `a_c_shepherd`,
    `a_c_poodle`,
    `u_m_y_gunvend_01`,
  }

	exports['qb-target']:AddTargetModel(legalHunts, {
    options = {
      {
        event = "qb-hunting:skinAnimal",
        icon = "far fa-hand-paper",
        label = "Skin",
      },
    },
    distance = 1.5
  })
  SetScenarioTypeEnabled('WORLD_DEER_GRAZING',false)
  SetScenarioTypeEnabled('WORLD_COYOTE_WANDER',false)
  SetScenarioTypeEnabled('WORLD_COYOTE_REST',false)
  --SetScenarioTypeEnabled('WORLD_RABBIT_EATING',false)
  SetScenarioTypeEnabled('WORLD_BOAR_GRAZING',false)
  SetScenarioTypeEnabled('WORLD_MOUNTAIN_LION_WANDER',false)
  SetScenarioTypeEnabled('WORLD_MOUNTAIN_LION_REST',false)
end)

RegisterNetEvent('hunting:shop', function (ShopItems)
	local ShopItems = {}
	ShopItems.label = "hunting shop"
	ShopItems.items = Config.huntingitem
	ShopItems.slots = #Config.huntingitem
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "huntingshop_"..math.random(1, 99), ShopItems) 
end)


RegisterNetEvent('qb-hunting:spawnAnimal')
AddEventHandler('qb-hunting:spawnAnimal', function()
  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local radius = 100.0
  local x = coords.x + math.random(-radius,radius)
  local y = coords.y + math.random(-radius,radius)
  local safeCoord, outPosition = GetSafeCoordForPed(x,y,coords.z,false,16)
  --animal = Config.HuntingAnimals[math.random(#Config.HuntingAnimals)] --HuntingAnimals
  animal = HuntingAnimals[math.random(#HuntingAnimals)]
  local hash = GetHashKey(animal)
  if not HasModelLoaded(hash) then
    RequestModel(hash)
    Wait(10)
  end
  while not HasModelLoaded(hash) do
    Wait(10)
  end
  if outPosition.x > 1 or outPosition.x < -1  then
    --Wait(2000)
    Wait(8000)
    baitAnimal = CreatePed(28, hash, outPosition.x, outPosition.y, outPosition.z, 0, true, false)
    print(baitAnimal)
    print('walking')
  else
    print('Debug: Too Far to Spawn')
    QBCore.Functions.Notify('you lost a one bait because it to far from the zone learn for your mistake :(')
  end
  if DoesEntityExist(baitAnimal) then
    TaskGoToCoordAnyMeans(baitAnimal,coords,2.0,0,786603,0)
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(1000)
    if DoesEntityExist(baitAnimal) then
      local ped = PlayerPedId()
      local coords = GetEntityCoords(PlayerPedId())
      local animalCoords = GetEntityCoords(baitAnimal)
      local dst = #(coords - animalCoords)
      HideHudComponentThisFrame(14)
      if dst < 2.5 then -- spook animal
        TaskCombatPed(baitAnimal,ped,0,16)
      end
    end
  end
end)


RegisterNetEvent('qb-hunting:skinurmom', function ()
  TriggerServerEvent('qb-hunting:skinReward')
end)

RegisterNetEvent('qb-hunting:skinAnimal')
AddEventHandler('qb-hunting:skinAnimal', function()
  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasItem)
    if hasItem then
      if DoesEntityExist(baitAnimal) then
          LoadAnimDict('amb@medic@standing@kneel@base')
          LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
          TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
          TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar('name_here', 'skinning ...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      }, {
          animDict = '',
          anim = '',
          flags = 16,
      }, {}, {}, function() -- Play When Done
      TriggerEvent('qb-hunting:skinurmom')
      ClearPedTasksImmediately(PlayerPedId())
      DeleteEntity(baitAnimal)
          IsDrilling = false
      end, function() -- Play When Cancel
        ClearPedTasksImmediately(PlayerPedId())
      end)
      else
        QBCore.Functions.Notify('not your shit !!!', 'error')
        print('Not your shit Bitch')
      end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  end, "WEAPON_KNIFE")
end)

RegisterCommand('zone', function()
  for k,v in pairs (HuntingZones) do
local zone1 = GetZonePopschedule(v)
   print(k, v)
   print(zone1)
  end
end)

RegisterNetEvent('qb-hunting:usedBait')
AddEventHandler('qb-hunting:usedBait', function()
  for k,v in pairs (HuntingZones) do
    if IsEntityInZone(PlayerPedId(),v) and cooldown <= 0 then
      -- if cooldown <= 0 then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
          QBCore.Functions.Notify('you cant use that in any car', 'error')
        else
        LoadAnimDict('amb@medic@standing@kneel@base')
        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
        QBCore.Functions.Progressbar('name_here', 'Placing Bait ...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {
            animDict = '',
            anim = '',
            flags = 16,
        }, {}, {}, function() -- Play When Done
          Citizen.Wait(100)
          cooldown = useBaitCooldown * 5000
          baitCooldown()
         used = true
         usedBait()
         TriggerServerEvent('qb-hunting:removeBait')
         ClearPedTasksImmediately(PlayerPedId())
            IsDrilling = false
        end, function() -- Play When Cancel
          ClearPedTasksImmediately(PlayerPedId())
        end)
      end
    else
    --  TriggerEvent("QBCore:Notify", "UHMMM FIND SOMETHING TO WRITE HERE",2)
    -- end
  end
end
end)

function baitCooldown()
  Citizen.CreateThread(function()
    while cooldown > 0 do
      Wait(2000)
      cooldown = cooldown - 1000
    end
  end)
end

function usedBait()
  Citizen.CreateThread(function()
    while used do
      print('waiting to spawn')
      Wait(1500)
      print('spawning')
      TriggerEvent('qb-hunting:spawnAnimal')
      used = false
    end
  end)
end


function LoadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Citizen.Wait(10)
  end
end
