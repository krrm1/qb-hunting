
local QBCore = exports['qb-core']:GetCoreObject()
local carcasses = {
    { name = "huntingcarcass1", price = 100, illegal = false },
    { name = "huntingcarcass2", price = 175, illegal = false },
    { name = "huntingcarcass3", price = 225, illegal = false },
    { name = "huntingcarcass4", price = 300, illegal = false },
}


RegisterNetEvent('Dox-hunting:client:sell', function ()

  sellattime()

end)

function sellattime()
	local hour = GetClockHours()
	if hour > 21 or hour < 3 then
	  return true
  end
  print(hour)
  TriggerServerEvent("Dox-hunting:server:sell")
  end