    local models = {
    785076010, 
    1243022785, 
    462203053 ,
}

local function progressBar(modelCoords)
    local pedCoords = GetEntityCoords(PlayerPedId())
    if #(pedCoords - modelCoords) > 0.75 then
        lib.notify({
            title = 'You ape',
            description = 'You ain\'t plastic man. Get next to it',
            type = 'error'
        }) 
        return
    end
    if lib.progressBar({
        duration = 5000,
        label = 'Stealing those coins',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true
        },
        anim = {
            dict = 'mp_common_heist',
            clip = 'pick_door',
        },
    }) then 
        lib.callback.await('fang-bubblerobbery:server:giveMoney') 
        lib.notify({
            title = 'Success',
            description = 'You stole change... wtf is wrong with you',
            type = 'success'
        }) 
    end
end


-- Function to set up targets
local function setupBuyTargets()
    exports.ox_target:addModel(models, {
        {
            label = 'Buy a random ball',
            icon = 'fa-solid fa-dollar-sign',
            onSelect = function()
            lib.callback.await('fang-bubblerobbery:server:giveItem')
            end
        },
        {
            label = 'Steal some change',
            icon = 'fa-solid fa-sack-dollar',
            items = 'lockpick',
            onSelect = function(data)
                print(data)
                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}}, {'1', '2', '3', '4'})
                
                if not success then
                    lib.notify({
                        title = 'Failed',
                        description = 'How you failed this is beyond me',
                        type = 'error'
                    }) return
                end
                progressBar(data.coords)
            end
        }
    })
end

CreateThread(function()
    setupBuyTargets() --sets up targets to buy gumballs
end)