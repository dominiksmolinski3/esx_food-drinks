local IsAnimated = false

AddEventHandler('cynio:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('cynio:onUse')
AddEventHandler('cynio:onUse', function(type, prop_name)
	if not IsAnimated then
		IsAnimated = true
		CreateThread(function()
		if type == 'food' or 'fruit' then
			TriggerEvent("mythic_progbar:client:progress", {
				name = "cynio's food&drinks",
				label = "Jesz... ",
				duration = 8000,
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				},
				animation = {
					animDict = "mp_player_inteat@burger",
					anim = "mp_player_int_eat_burger_fp",
				},
				prop = {
					model = prop_name,
				}
			}, function(status)
				if not status then
				Citizen.Wait(1)
				DeleteObject(prop)
				IsAnimated = false
			end
		end)
		elseif type == 'drink' or 'alcohol' then
			TriggerEvent("mythic_progbar:client:progress", {
				name = "cynio's food&drinks",
				label = "Pijesz... ",
				duration = 8000,
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				},
				animation = {
					animDict = "mp_player_intdrink",
					anim = "loop_bottle",
				},
				prop = {
					model = prop_name,
				}
			}, function(status)
				if not status then
				Citizen.Wait(1)
				DeleteObject(prop)
				IsAnimated = false
			end
		end)
	end
end)
end
end)