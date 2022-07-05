local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('arabcodingteam-hunting:skinReward')
AddEventHandler('arabcodingteam-hunting:skinReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("huntingcarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass1"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("huntingcarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass2"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("huntingcarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass3"], "add")
  else 
    Player.Functions.AddItem("huntingcarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass4"], "add")
  end
end)

RegisterServerEvent('arabcodingteam-hunting:removeBait')
AddEventHandler('arabcodingteam-hunting:removeBait', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  Player.Functions.RemoveItem("huntingbait", 1)
end)

RegisterServerEvent('remove:money')
AddEventHandler('remove:money', function(totalCash)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  if Player.PlayerData.money['cash'] >= (500) then
    Player.Functions.RemoveMoney('cash', 500)
    TriggerClientEvent("arabcodingteam-hunting:setammo", src)
    TriggerClientEvent("QBCore:Notify", src, 'Reloaded.')
  else
    TriggerClientEvent("QBCore:Notify", src, 'Not enough cash on you.', 'error')
  end
end)

QBCore.Functions.CreateUseableItem("huntingbait", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)

  TriggerClientEvent('arabcodingteam-hunting:usedBait', source)
end)


local carcasses = {
  huntingcarcass1 = 200,
  huntingcarcass2 = 475,
  huntingcarcass3 = 725,
  huntingcarcass4 = 1000
}

RegisterServerEvent('arabcodingteam-hunting:server:sell')
AddEventHandler('arabcodingteam-hunting:server:sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k,v in pairs(carcasses) do
        local item = Player.Functions.GetItemByName(k)
        if item ~= nil then
            if Player.Functions.RemoveItem(k, item.amount) then
                Player.Functions.AddMoney('cash', v * item.amount)
            end
        end
    end
end)
