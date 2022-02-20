local QBCore = exports['qb-core']:GetCoreObject()
local BackEngineVehicles = { -- Used from qb-vehicle failure <3
'ninef',
'adder',
'vagner',
't20',
'infernus',
'zentorno',
'reaper',
'comet2',
'comet3',
'jester',
'jester2',
'cheetah',
'cheetah2',
'prototipo',
'turismor',
'pfister811',
'ardent',
'nero',
'nero2',
'tempesta',
'vacca',
'bullet',
'osiris',
'entityxf',
'turismo2',
'fmj',
're7b',
'tyrus',
'italigtb',
'penetrator',
'monroe',
'ninef2',
'stingergt',
'surfer',
'surfer2',
'comet3',
}

isLoggedIn = true

local PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.Job then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)


local function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = QBCore.Functions.GetClosestVehicle()
    local vehicleMods = {
        mods = {},
    }
    vehicleMods.mods[11] = GetVehicleMod(veh,11)
    vehicleMods.mods[12] = GetVehicleMod(veh,12)
    vehicleMods.mods[13] = GetVehicleMod(veh,13)
    vehicleMods.mods[15] = GetVehicleMod(veh,15)
    vehicleMods.mods[18] = IsToggleModOn(veh, 18)

local myCar = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('updateVehicle',myCar)
end

function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

--  PARTS INSTALATION--
-- ENGINE
RegisterNetEvent('mf-tunerjob:E0')
AddEventHandler('mf-tunerjob:E0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
--     local trunkpos = false
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == Config.Job then
            if onDuty then
                  if engine ~= -1 then 
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
-- 			    trunkpos = true
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                                QBCore.Functions.Progressbar("Gas_Engine", "Installer Nye Motor...", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine0"], "remove")
                                    QBCore.Functions.Notify("Motor blev installeret", "success")
                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af motor sidder allerede i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)
RegisterNetEvent('mf-tunerjob:E1')
AddEventHandler('mf-tunerjob:E1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if engine ~= 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installer Nye Motor...", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine1"], "remove")
                                    QBCore.Functions.Notify("Motor blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af motor sidder allerede i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:E2')
AddEventHandler('mf-tunerjob:E2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if engine ~= 1 then 
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installer Nye Motor...", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine2"], "remove")
                                    QBCore.Functions.Notify("Motor blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af motor sidder allerede i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:E3')
AddEventHandler('mf-tunerjob:E3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if engine ~= 2 then 
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installer Nye Motor...", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine3"], "remove")
                                    QBCore.Functions.Notify("Motor blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af motor sidder allerede i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:E4')
AddEventHandler('mf-tunerjob:E4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if engine ~= 3 then 
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installer Nye Motor...", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 3, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine4"], "remove")
                                    QBCore.Functions.Notify("Motor blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af motor sidder allerede i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

--brakes
RegisterNetEvent('mf-tunerjob:B0')
AddEventHandler('mf-tunerjob:B0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if brake ~= -1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installer Bremser...", 8500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake0"], "remove")
                                    QBCore.Functions.Notify("Bremser blev instaleret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af bremser sidder på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:B1')
AddEventHandler('mf-tunerjob:B1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if brake ~= 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installer Bremser...", 8500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake1"], "remove")
                                    QBCore.Functions.Notify("Bremser blev instaleret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af bremser sidder på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:B2')
AddEventHandler('mf-tunerjob:B2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if brake ~= 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installer Bremser...", 8500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake2"], "remove")
                                    QBCore.Functions.Notify("Bremser blev instaleret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af bremser sidder på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:B3')
AddEventHandler('mf-tunerjob:B3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if brake ~= 2 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installer Bremser...", 8500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake3"], "remove")
                                    QBCore.Functions.Notify("Bremser blev instaleret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne form af bremser sidder på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

-- --Transmission
RegisterNetEvent('mf-tunerjob:T0')
AddEventHandler('mf-tunerjob:T0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    transmission = GetVehicleMod(veh, 13)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if transmission ~= -1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Transmission", "Installer Transmission...", 9250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission0"], "remove")
                                    QBCore.Functions.Notify("Transmisiion blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne transmission er allerede blevet sat i køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:T1')
AddEventHandler('mf-tunerjob:T1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    transmission = GetVehicleMod(veh, 13)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if transmission ~= 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Transmission", "Installer Transmission...", 9250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission1"], "remove")
                                    QBCore.Functions.Notify("Transmisiion blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne transmission er allerede blevet sat i køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:T2')
AddEventHandler('mf-tunerjob:T2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    transmission = GetVehicleMod(veh, 13)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if transmission ~= 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Transmission", "Installer Transmission...", 9250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission2"], "remove")
                                    QBCore.Functions.Notify("Transmisiion blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne transmission er allerede blevet sat i køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:T3')
AddEventHandler('mf-tunerjob:T3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    transmission = GetVehicleMod(veh, 13)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if transmission ~= 2 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Transmission", "Installer Transmission...", 9250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission3"], "remove")
                                    QBCore.Functions.Notify("Transmisiion blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne transmission er allerede blevet sat i køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

-- --Suspension
RegisterNetEvent('mf-tunerjob:S0')
AddEventHandler('mf-tunerjob:S0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    suspension = GetVehicleMod(veh, 15)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if suspension ~= -1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Suspension", "Installer Affjedring...", 9000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension0"], "remove")
                                    QBCore.Functions.Notify("Affjedringen blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne affjedring er allerede sat på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:S1')
AddEventHandler('mf-tunerjob:S1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    suspension = GetVehicleMod(veh, 15)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if suspension ~= 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Suspension", "Installer Affjedring...", 9000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension1"], "remove")
                                    QBCore.Functions.Notify("Affjedringen blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne affjedring er allerede sat på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:S2')
AddEventHandler('mf-tunerjob:S2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    suspension = GetVehicleMod(veh, 15)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if suspension ~= 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Suspension", "Installer Affjedring...", 9000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension2"], "remove")
                                    QBCore.Functions.Notify("Affjedringen blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne affjedring er allerede sat på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:S3')
AddEventHandler('mf-tunerjob:S3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    suspension = GetVehicleMod(veh, 15)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if suspension ~= 2 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Suspension", "Installer Affjedring...", 9000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension3"], "remove")
                                    QBCore.Functions.Notify("Affjedringen blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne affjedring er allerede sat på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:S4')
AddEventHandler('mf-tunerjob:S4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    suspension = GetVehicleMod(veh, 15)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if suspension ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Suspension", "Installer Affjedring...", 9000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 3, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension4"], "remove")
                                    QBCore.Functions.Notify("Affjedringen blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne affjedring er allerede sat på køretøj", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

-- --Suspension
RegisterNetEvent('mf-tunerjob:Turbo0')
AddEventHandler('mf-tunerjob:Turbo0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    turbo = IsToggleModOn(veh, 18)
    print(turbo)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if turbo == 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Turbo", "Fjerner Turbo...", 9250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 18, false)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "turbo0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["turbo0"], "remove")
                                    QBCore.Functions.Notify("Turboen blev fjernet", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Der sidder ikke nogen turbo i", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:Turbo1')
AddEventHandler('mf-tunerjob:Turbo1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    turbo = IsToggleModOn(veh, 18)
    print(turbo)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if turbo == false then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Turbo", "Installer Turbo...", 9500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() 
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 18, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "turbo1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["turbo1"], "remove")
                                    QBCore.Functions.Notify("Turboen blev installeret", "success")
                                    

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Der sidder allerede en turbo i køretøjet", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på vagt!!", "error")
            end
        else
            QBCore.Functions.Notify("Det kan du ikke", "error")
        end
end)

-- Turbo Done --
-- Start På Lys --

RegisterNetEvent('mf-tunerjob:FLS')  
AddEventHandler('mf-tunerjob:FLS', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer standard forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 255)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light0"], "remove")
                                    QBCore.Functions.Notify("Standard Lys installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLW')  
AddEventHandler('mf-tunerjob:FLW', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer hvide forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 0)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light1"], "remove")
                                    QBCore.Functions.Notify("Hvide forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLB')  
AddEventHandler('mf-tunerjob:FLB', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer blå forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 1)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light2"], "remove")
                                    QBCore.Functions.Notify("Blå forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLEB')  
AddEventHandler('mf-tunerjob:FLEB', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Elektrisk Blå forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 2)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light3"], "remove")
                                    QBCore.Functions.Notify("Elektrisk blå forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLMG')  
AddEventHandler('mf-tunerjob:FLMG', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Mint Grøne forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 3)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light4"], "remove")
                                    QBCore.Functions.Notify("Mint grøne forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLLG')  
AddEventHandler('mf-tunerjob:FLLG', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Lime Grøne forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 4)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light5", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light5"], "remove")
                                    QBCore.Functions.Notify("Lime grøne forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLG')  
AddEventHandler('mf-tunerjob:FLG', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Gule forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 5)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light6", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light6"], "remove")
                                    QBCore.Functions.Notify("Gule forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLGF')  
AddEventHandler('mf-tunerjob:FLGF', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Guld Farvet forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 6)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light7", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light7"], "remove")
                                    QBCore.Functions.Notify("Guld farvet forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLO')  
AddEventHandler('mf-tunerjob:FLO', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Orange forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 7)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light8", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light8"], "remove")
                                    QBCore.Functions.Notify("Orange forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLR')  
AddEventHandler('mf-tunerjob:FLR', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Røde forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 8)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light9", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light9"], "remove")
                                    QBCore.Functions.Notify("Røde forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLPP')  
AddEventHandler('mf-tunerjob:FLPP', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Pony Pink forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 9)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light10", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light10"], "remove")
                                    QBCore.Functions.Notify("Pony pink forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLHP')  
AddEventHandler('mf-tunerjob:FLHP', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Hot Pink forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 10)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light11", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light11"], "remove")
                                    QBCore.Functions.Notify("Hot pink forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLL')  
AddEventHandler('mf-tunerjob:FLL', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
        if PlayerJob.name == Config.Job then
            if onDuty then
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Lilla forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 11)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light12", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light12"], "remove")
                                    QBCore.Functions.Notify("Lilla forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
            else
                QBCore.Functions.Notify("Du skal være på arbejde!", "error")
            end
        else
            QBCore.Functions.Notify("Du er ikke udlært nok til dette", "error")
        end
end)

RegisterNetEvent('mf-tunerjob:FLSF')  
AddEventHandler('mf-tunerjob:FLSF', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
                if headlight ~= 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("headlight", "Installer Sorte forlygter...", 15000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 22, true)
                                    SetVehicleHeadlightsColour(vehicle, 12)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "light13", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["light13"], "remove")
                                    QBCore.Functions.Notify("Sorte forlygter blev installeret", "success")

                                end)
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify("Denne farve sidder alerede på bilen.", "error")
                end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('[mf-tunerjob] | Made By Focking Mikkel#0820')
end)
--=====================QB-TARGET==========================--

exports['qb-target']:AddTargetModel(`s_m_y_xmech_01`, { 
    options = { 
        {
        event = "mf-tunerjob:client:openTunerShop",
            icon = 'fad fa-key',
            label = "Tuner Dele",
            job = 'tuner', 
        }
    },
    distance = 3.0,
})

exports['qb-target']:AddTargetModel(881450200, {
    options = {
        { 
            type = "server",    
            event = "QBCore:ToggleDuty", 
            icon = 'fad fa-key',
            label = 'Gå På/Fra Job', 
            job = 'tuner',
        }
    },
    distance = 3.0,
})
 
CreateThread(function()
    exports['qb-target']:AddBoxZone("tunercraft", vector3(829.63, -959.76, 29.18), 0.7, 1.63, {
      name = "tunercraft",
      heading = 0.0,
      debugPoly = false,
      minZ = 29.0,
      maxZ = 30.2,
    }, {
      options = {
        {
        type = "client",
        event = "mf-tunerjob:client:opeqnTunerCraft",
        icon = 'fad fa-key',
        label = 'Byg Tuner Dele',
        job = 'tuner',
        }
      },
      distance = 3.0,
    })
end)


  
CreateThread(function()
    local bones = {
        'door_dside_f',
        'door_dside_r',
        'door_pside_f',
        'door_pside_r'
    }
    exports['qb-target']:AddTargetBone(bones, {
      options = { 
        { 
          type = "client", 
          event = "fm-tunerjob:mod:vehmenu",
          icon = 'fad fa-key',
          label = 'Tuner Menu',
          job = 'tuner',
        }
      },
      distance = 3.0,
    })
end)

--=====================INVENTORY==========================--
RegisterNetEvent('mf-tunerjob:client:openTunerShop')
AddEventHandler('mf-tunerjob:client:openTunerShop', function()
    local ShopItems = {}
    ShopItems.label = "Standard Dele"
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "tuner", Config.Items)
end)

RegisterNetEvent('mf-tunerjob:client:openTunerCraft')
AddEventHandler('mf-tunerjob:client:openTunerCraft', function()
    local crafting = {}
	crafting.label = "Tuner Crafting"
	crafting.items = GetTunerThresholdItems()
	TriggerServerEvent("inventory:server:OpenInventory", "tuner_crafting", math.random(1, 99), crafting)
end)

function GetTunerThresholdItems()
	SetupTunerItemsInfo()
	local items = {}
	for k, item in pairs(Config.TunerCrafting["items"]) do
		if QBCore.Functions.GetPlayerData().metadata["tunercraftingrep"] >= Config.TunerCrafting["items"][k].threshold then
			items[k] = Config.TunerCrafting["items"][k]
		end
	end
	return items
end

function SetupTunerItemsInfo()
	itemInfos = {
		[1] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 140x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 250x, " .. QBCore.Shared.Items["iron"]["label"] .. ": 140x"},
		[2] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 160x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 250x, " .. QBCore.Shared.Items["iron"]["label"] .. ": 140x"},
		[3] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 180x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 250x, " .. QBCore.Shared.Items["iron"]["label"] .. ": 160x"},
		[4] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 230x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 270x, " .. QBCore.Shared.Items["iron"]["label"] .. ": 200x"},
		[5] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 150x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 150x "},
		[6] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 180x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 180x "},
		[7] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 200x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 200x "},
		[8] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 140x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 140x "},
        [9] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 140x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 140x "},
        [10] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 160x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 180x "},
        [11] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 100x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 30x "},
        [12] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 120x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 40x "},
        [13] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 130x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 50x "},
        [14] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 150x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 60x "},
        [15] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 160x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 60x "},
	}

	local items = {}
	for k, item in pairs(Config.TunerCrafting["items"]) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.TunerCrafting["items"] = items
end

RegisterNetEvent('inventory:client:CraftTuner', function(itemName, itemCosts, amount, toSlot, points)
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    QBCore.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() 
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("inventory:server:CraftTuner", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'add')
        isCrafting = false
	end, function()
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Fejlede", "error")
        isCrafting = false
	end)
end)


--=====================BLIP==========================--
CreateThread(function()
    local c = Config.Blip["blip"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)
    SetBlipSprite (Blip, 446)
    SetBlipDisplay(Blip, 4)
    SetBlipScale  (Blip, 0.7)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 0)
    SetBlipAlpha(Blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Byens Tuner")
    EndTextCommandSetBlipName(Blip)
end)

RegisterNetEvent('fm-tunerjob:mod:vehmenu', function()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Nummerplade: " .. plate,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Køretøjs Status",
            txt = "Vis kørtøjets status",
            params = {
                event = "craft:vehstatus",
            }
        },
        {
            id = 3,
            header = "Køretøjs Modifikationer",
            txt = "Cis køretøjets nuværende modifikationer",
            params = {
                event = "craft:vehmods",
            }
        },
        {
            id = 4,
            header = "Luk Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('craft:tunermenu', function()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Dele",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Køretøjs Status",
            txt = "Vis kørtøjets status",
            params = {
                event = "inventory:server:OpenInventory"
            }
        },
        {
            id = 4,
            header = "Luk Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('craft:vehmods', function()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)
    local statusList = exports['qb-mechanicjob']:GetVehicleStatusList(plate)
    local fuel = exports['lj-fuel']:GetFuel(vehicle)
    local turbo = "Ingen"
    if IsToggleModOn(vehicle, 18) == 1 then
        turbo = "Sidder I"
    end

    local engine = "Standard"
    local engineMod = GetVehicleMod(vehicle, 11)
    if engineMod > -1 then
        if engineMod == -1 then
            engine = "Standard"
        elseif engineMod == 0 then    
            engine = "Tun 1"
        elseif engineMod == 1 then
            engine = "Tun 2"
        elseif engineMod == 2 then
            engine = "Tun 3"
        elseif engineMod == 3 then
            engine = "Tun 4"
        end
    end

    local brakes = "Standard"
    local brakesMod = GetVehicleMod(vehicle, 12)
    if brakesMod > -1 then
        if brakesMod == -1 then
            brakes = "Standard"
        elseif brakesMod == 0 then
            brakes = "Tun 1"    
        elseif brakesMod == 1 then
            brakes = "Tun 2"
        elseif brakesMod == 2 then
            brakes = "Tun 3"
        end  
    end

    local transmission = "Standard"
    local transMod = GetVehicleMod(vehicle, 13)
    if transMod > 0 then
        if transMod == 0 then
            transmission = "Standard"
        elseif transMod == 0 then    
            transmission = "Tun 1"
        elseif transMod == 1 then
            transmission = "Tun 2"
        elseif transMod == 2 then
            transmission = "Tun 3"
        end   
    end

    local suspension = "Standard"
    local susMod = GetVehicleMod(vehicle, 15)
    if susMod > -1 then
        if susMod == -1 then
            suspension = "Standard"
        elseif susMod == 0 then
            suspension = "Tun 1"    
        elseif susMod == 1 then
            suspension = "Tun 2"
        elseif susMod == 2 then
            suspension = "Tun 3"
        elseif susMod == 3 then
            suspension = "Tun 4"
        end 
    end

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Køretøj: " .. plate,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Motor: ".. engine,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 3,
            header = "Transmission: ".. transmission,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 4,
            header = "Affjedring: ".. suspension,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 5,
            header = "Bremser: ".. brakes,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 6,
            header = "Turbo: ".. turbo,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 7,
            header = "<-- Tilbage",
            txt = "",
            params = {
                event = "craft:vehmenu",
            }
        },
        {
            id = 8,
            header = "Luk Menuen",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

-- VEHICLE HEALTH/STATUS
RegisterNetEvent('craft:vehstatus', function()

    local statusList = exports['qb-mechanicjob']:GetVehicleStatusList(plate)
    fuel = exports['lj-fuel']:GetFuel(vehicle)
    vehicle = QBCore.Functions.GetClosestVehicle()
    plate = GetVehicleNumberPlateText(vehicle)
    engineHealth = GetVehicleEngineHealth(vehicle)
    vehTemp = GetVehicleEngineTemperature(vehicle)
    bodyHealth = GetVehicleBodyHealth(vehicle)
    fuelHealth = exports['lj-fuel']:GetFuel(vehicle)
    tankHealth = GetVehiclePetrolTankHealth(vehicle)

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Brandstof Niveau",
            txt = "Status: " .. math.ceil(fuelHealth) .. ".0% / 100.0%",
        },
        {
            id = 2,
            header = "Motor Helbred",
            txt = "Status: " .. math.ceil(engineHealth / 10) .. "% / 100.0%",
        },
        {
            id = 3,
            header = "Karosseri Helbred",
            txt = "Status: " .. math.ceil(bodyHealth / 10) .. "% / 100.0%",
        },
        {
            id = 4,
            header = "Motor Temperatur",
            txt = "Status: " .. math.ceil(vehTemp) .. "° C",
        }, 

        {
            id = 5,
            header = "<-- Tilbage",
            txt = "",
            params = {
                event = "craft:vehmenu",
            }
        },
        {
            id = 6,
            header = "Luk Menuen",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end