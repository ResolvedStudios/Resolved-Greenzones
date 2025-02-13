local greenZones = {
    {coords = vector3(440.0, -982.0, 30.0), radius = 50.0, name = "Mission Row Police Department"}, 
    {coords = vector3(1850.0, 3685.0, 34.0), radius = 60.0, name = "Sandy Shores PD/Medical"},
    {coords = vector3(-470.0, 6012.0, 31.7), radius = 50.0, name = "Paleto Bay PD"},    
    {coords = vector3(-252.0, 6321.7, 31.4), radius = 50.0, name = "Paleto Medical"},
    {coords = vector3(-635.0, -121.0, 38.0), radius = 50.0, name = "Fire Station LS"},
    {coords = vector3(1200.0, -1460.0, 34.0), radius = 50.0, name = "El Burro Fire Station"},
    {coords = vector3(1690.0, 3585.0, 35.0), radius = 30.0, name = "Sandy Shores Fire"},
    {coords = vector3(-364.0, 6110.0, 31.0), radius = 45.0, name = "Paleto Bay Fire Station"},
}
-- If you want to add more zones I left exmaples in the readme (https://github.com/ResolvedStudios/Resolved-Greenzones/tree/main?tab=readme-ov-file#add-a-green-zone)

local inGreenZone = false

Citizen.CreateThread(function()
    for _, zone in pairs(greenZones) do
        local blip = AddBlipForRadius(zone.coords.x, zone.coords.y, zone.coords.z, zone.radius)
        SetBlipColour(blip, 2) 
        SetBlipAlpha(blip, 128)

        local zoneBlip = AddBlipForCoord(zone.coords.x, zone.coords.y, zone.coords.z)
        SetBlipSprite(zoneBlip, 153) 
        SetBlipColour(zoneBlip, 2)
        SetBlipScale(zoneBlip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Green Zone - " .. zone.name)
        EndTextCommandSetBlipName(zoneBlip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local isInZone = false

        for _, zone in pairs(greenZones) do
            local distance = #(playerCoords - zone.coords)
            if distance <= zone.radius then
                isInZone = true

                if not inGreenZone then
                    inGreenZone = true
                    TriggerEvent('customNotify:Send', 'success', 'You have entered a green zone', 4000)
                    TriggerEvent('customNotify:PlaySound', 'notify')
                end

                -- Disable player actions inside the green zone
                DisableControlAction(0, 24, true)  -- Disable attack
                DisableControlAction(0, 257, true) -- Disable aim
                DisableControlAction(0, 25, true)  -- Disable right-click aim
                DisableControlAction(0, 45, true)  -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee attack (R)
                DisableControlAction(0, 141, true) -- Disable alternative melee (Q)
                DisableControlAction(0, 142, true) -- Disable melee block
                DisablePlayerFiring(playerPed, true) -- Prevent shooting
                SetEntityInvincible(playerPed, true)  -- Make the player invincible
                ClearPedBloodDamage(playerPed)  -- Remove blood
            end
        end

        if not isInZone and inGreenZone then
            inGreenZone = false
            TriggerEvent('customNotify:Send', 'error', 'You have left a green zone', 4000)
            TriggerEvent('customNotify:PlaySound', 'notify')
        end
    end
end)
