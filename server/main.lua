local QBCore = exports['qb-core']:GetCoreObject()

-------------------USABLE ITEMS-------------------
--ENGINE PARTS
QBCore.Functions.CreateUseableItem("engine0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:E0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:E1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine2", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:E2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine3", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:E3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine4", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:E4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

--BRAKES
QBCore.Functions.CreateUseableItem("brake0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:B0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:B1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake2", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:B2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake3", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:B3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

--TRANSMISSION
QBCore.Functions.CreateUseableItem("transmission0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:T0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:T1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission2", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:T2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission3", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:T3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

--SUSPENSION
QBCore.Functions.CreateUseableItem("suspension0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:S0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:S1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension2", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:S2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension3", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:S3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension4", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:S4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

--TURBO
QBCore.Functions.CreateUseableItem("turbo0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:Turbo0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("turbo1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:Turbo1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

-- Forlygter
QBCore.Functions.CreateUseableItem("light0", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLS", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light1", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLW", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light2", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLB", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light3", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLEB", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light4", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLMG", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light5", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLLG", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light6", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLG", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light7", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLGF", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light8", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLO", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light9", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLR", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light10", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLS", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light11", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLS", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light12", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLS", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

QBCore.Functions.CreateUseableItem("light13", function(source, item)
    
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("mf-tunerjob:FLSF", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Unknown Error", "error")
    end
end)

--DATA
RegisterServerEvent("updateVehicle")
AddEventHandler("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        exports.oxmysql:execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.oxmysql:scalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end

----- DO NOT TOUCH ABOVE ^^^^^
-----ONLY EDIT BELOW THIS LINE-------

AddEventHandler('onServerResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('[mf-tunerjob] | Made By Focking Mikkel#0820')
end)