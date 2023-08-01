CreateThread(function()
	for k,v in pairs(Config.Items) do
		ESX.RegisterUsableItem(k, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
			if v.remove then
				xPlayer.removeInventoryItem(k,1)
			end
			if v.type == "food" then
				TriggerClientEvent("esx_status:add", source, "hunger", v.status)
				TriggerClientEvent('cynio:onUse', source, v.type, v.prop)
			elseif v.type == "drink" then
				TriggerClientEvent("esx_status:add", source, "thirst", v.status)
				TriggerClientEvent('cynio:onUse', source, v.type, v.prop)
			elseif v.type == "alcohol" then
				TriggerClientEvent("esx_status:remove", source, "thirst", v.status)
				TriggerClientEvent('cynio:onUse', source, v.type, v.prop)	
			elseif v.type == "fruit" then
				TriggerClientEvent("esx_status:add", source, "thirst", v.status)
				TriggerClientEvent("esx_status:add", source, "hunger", v.status)
				TriggerClientEvent('cynio:onUse', source, v.type, v.prop)	
			else
				print(string.format('^1[ERROR]^0 %s has no correct type defined.', k))
			end
		end)
	end 
end)


