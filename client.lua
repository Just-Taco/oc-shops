HT = nil

Citizen.CreateThread(function()
	while HT == nil do
		TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Ped = GetPlayerPed(-1)
        local pedpos = GetEntityCoords(Ped)
        for k,v in pairs(cfg.shops) do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.x,v.y,v.z, true) <= 30 then
            DrawMarker(1, v.x,v.y,v.z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 0, 0, 255, 255, 0, 0, 0, 50)
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.x,v.y,v.z, true) <= 2 then
                DrawText3D(v.x,v.y,v.z, "~b~E~w~ - Supermarket")
                if IsControlJustPressed(1, 38) then
                    shop1()
                end
                end
            end
        end
    end
end)


function shop1()
	local player = PlayerPedId()
	local elements = {}
			
	table.insert(elements,{label = "Bil lockpick | 50.000 kr", value = "billockpick"})
    table.insert(elements,{label = "Hus lockpick | 50.000 kr", value = "huslockpick"})
    table.insert(elements,{label = "Koben | 2.000 kr", value = "koben"})
    table.insert(elements,{label = "Joint Papir x10 | 100 kr", value = "jointpapir"})
	table.insert(elements,{label = "Luk Menu", value = "cancel_menu"})
		
	HT.UI.Menu.Open('default', GetCurrentResourceName(), "choose_menu",
		{
			title    = "SuperMarket",
			align    = "right",
			elements = elements
		},
	function(data, menu)
			if data.current.value == "cancel_menu" then
				menu.close()
			end
			if data.current.value == "billockpick" then
				TriggerServerEvent("billockpick")
			end
            if data.current.value == "huslockpick" then
				TriggerServerEvent("huslockpick")
			end
            if data.current.value == "koben" then
				TriggerServerEvent("koben")
			end
            if data.current.value == "jointpapir" then
				TriggerServerEvent("jointpapir")
			end
			
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            if not loadedBlip then
                for k,v in pairs(cfg.shops) do
                stationBlip = AddBlipForCoord(v.x,v.y,v.z)
                SetBlipSprite(stationBlip, 59)
                SetBlipDisplay(stationBlip, 2)
                SetBlipScale(stationBlip, 0.7)
                SetBlipColour(stationBlip, 1)
                SetBlipScale(stationBlip,0.7)
                SetBlipAlpha(stationBlip, 255)
                SetBlipAsShortRange(stationBlip, true)
                BeginTextCommandSetBlipName("String")
                AddTextComponentString("Supermarket")
                EndTextCommandSetBlipName(stationBlip)
                loadedBlip = true
            end
        end
    end
end)


    function DrawText3D(x,y,z, text)
        local onScreen,_x,_y=World3dToScreen2d(x,y,z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
    
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 20, 20, 20, 150)
    end