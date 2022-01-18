-- Created by Taco
-- Created by Taco
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_druglevering") 
vRP = Proxy.getInterface("vRP")

RegisterServerEvent("billockpick")
AddEventHandler("billockpick", function()
    local source = source
    local user_id = vRP.getUserId({source})
end)

RegisterServerEvent("huslockpick")
AddEventHandler("huslockpick", function()
    local source = source
    local user_id = vRP.getUserId({source})
        if vRP.tryFullPayment({user_id,50000}) then
            vRP.giveInventoryItem({user_id,"ultraadvancedlockpick",1,true})
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har lige købt en hus lockpick', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke råd til at købe en hus lockpick', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
        end
end)
RegisterServerEvent("billockpick")
AddEventHandler("billockpick", function()
    local source = source
    local user_id = vRP.getUserId({source})
        if vRP.tryFullPayment({user_id,50000}) then
            vRP.giveInventoryItem({user_id,"vehlockpick",1,true})
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har lige købt en bil lockpick', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke råd til at købe en bil lockpick', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
        end
end)
RegisterServerEvent("koben")
AddEventHandler("koben", function()
    local source = source
    local user_id = vRP.getUserId({source})
        if vRP.tryFullPayment({user_id,2000}) then
            vRP.giveInventoryItem({user_id,"koben",1,true})
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har lige købt et Koben', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke råd til at købe et Koben', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
        end
end)

RegisterServerEvent("jointpapir")
AddEventHandler("jointpapir", function()
    local source = source
    local user_id = vRP.getUserId({source})
        if vRP.tryFullPayment({user_id,100}) then
            vRP.giveInventoryItem({user_id,"jointpapir",10,true})
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du har lige købt 10 joint papir', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke råd til at købe joint papir', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
        end
end)

