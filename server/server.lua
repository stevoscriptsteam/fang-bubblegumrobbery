local config = require('config.lua')
local robbedMachines = {}
local resetTimers = {}

lib.callback.register('fang-bubblegumrobbery:server:getRobbedMachines', function(_, machineEntity)
    return robbedMachines[machineEntity]
end)

lib.callback.register('fang-bubblegumrobbery:server:setRobbedStatus', function(_, entityID, state)
    if robbedMachines[entityID] then return end

    robbedMachines[entityID] = state
   
    if state and not resetTimers[entityID] then
        resetTimers[entityID] = lib.timer((config.Cooldown * 1000), function()
            robbedMachines[entityID] = nil
            resetTimers[entityID] = nil 
        end, true)
    end

    return (robbedMachines[entityID] == state)
end)

lib.callback.register('fang-bubblerobbery:server:giveItem', function(source)
    local items = config.Items
    local itemSelect = math.random(1,5)
    local prizeItem = items[itemSelect].item
    local moneyCount = exports.ox_inventory:GetItemCount(source, 'money')
    local data = {
        title = 'Error',
        description = 'You are too broke...',
        type = 'error'
    }
    if moneyCount < config.Price then
        TriggerClientEvent('ox_lib:notify', source, data)
        return 
    end
    exports.ox_inventory:RemoveItem(source, 'money', config.Price)
    exports.ox_inventory:AddItem(source, prizeItem, items[itemSelect].count)
end)

lib.callback.register('fang-bubblerobbery:server:giveMoney', function(source)
    local amount = math.random(10,30)
    exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
    exports.ox_inventory:AddItem(source, 'money', amount)
end)
