function drawBar(time, text)
	SendNUIMessage({
		time = time,
		text = text
	})
end

RegisterNetEvent('progressBar:drawBar')
AddEventHandler('progressBar:drawBar', function(time, text)
	drawBar(time, text)
end)
