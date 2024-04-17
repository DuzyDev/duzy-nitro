ESX = nil

local activeCars = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nitro:removeInventoryItem')
AddEventHandler('nitro:removeInventoryItem', function(item, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, quantity)
    TriggerClientEvent('nitro:activated', source)
end)

ESX.RegisterUsableItem('nitro', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem('nitro')
    if xItem.count >= 1 then
        TriggerClientEvent('nitro:check', source)
    end
end)