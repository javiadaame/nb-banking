

CreateThread(function()
    playerPed = PlayerPedId()
    playerCoords = GetEntityCoords(playerPed)

    if Config.EnableBlips then
        blips()
    end

    while true do 
        Wait(500)
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        for k, v in pairs(Config["banks"]) do
            local coords = vector3(v.x, v.y, v.z)
            local distance = #(playerCoords - coords)
            
            if distance < 1.5 then
                print("Check!")
                currentBank = v
                isInBank = true
                break
            else
                isInBank = false
            end
        end
    end
end)


-- Functions
function blips()
    for k, v in pairs(Config["banks"]) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 207)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 2)
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(v.name))
        EndTextCommandSetBlipName(blip)
    end
end