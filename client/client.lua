local batonhol = true


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then
			if CheckIfBaton(ped) and batonhol then
				TriggerEvent("sounds", "out", 0.2)
				batonhol = false
			end
			if not CheckIfBaton(ped) and not batonhol then
				TriggerEvent("sounds", "in", 0.3)
				batonhol = true
			end
		end
	end
end)

function CheckIfBaton(ped)
		if GetHashKey("weapon_nightstick") == GetSelectedPedWeapon(ped) then
			return true
		end
	return false
end

AddEventHandler('sounds', function(soundFile, soundVolume)
  SendNUIMessage({
    transactionType = 'playSound',
    transactionFile = soundFile,
    transactionVolume = soundVolume
  })
end)