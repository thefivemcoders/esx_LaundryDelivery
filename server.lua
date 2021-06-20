

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('laundry:pourboire') --Paie a la livraison d'une laundry + pourboire eventuel
AddEventHandler('laundry:pourboire', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(pourboire)
end)

RegisterServerEvent("laundry:paiefinale") --Paie "bonus" lors de la fin de service
AddEventHandler("laundry:paiefinale", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local flouzefin = math.random(10, 100)

	xPlayer.addMoney(flouzefin)

	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Voici votre petit bonus final : " .. flouzefin .. "$",
		type = "success",
		queue = "global",
		timeout = 4000,
		layout = "bottomRight"
	})
end)

RegisterServerEvent("laundry:itemadd") --Ajout temporaire de l'item "laundry"
AddEventHandler("laundry:itemadd", function(nbPizza)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem('laundry', tonumber(nbPizza))
end)

RegisterServerEvent("laundry:itemrm") --Rm de l'item "laundry"
AddEventHandler("laundry:itemrm", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('packed_clothes', 1)
end)

RegisterServerEvent("laundry:deleteAllPizz") --Rm de l'item "laundry"
AddEventHandler("laundry:deleteAllPizz", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	local pizzanbr = xPlayer.getInventoryItem('laundry').count
	
	xPlayer.removeInventoryItem('laundry', pizzanbr)
end)
