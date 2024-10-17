lib.callback.register('fang-bubblerobbery:server:giveItem', function(source)
    local items = Config.Items
    local itemSelect = math.random(1,5)
    local prizeItem = items[itemSelect].item
    local moneyCount = exports.ox_inventory:GetItemCount(source, 'money')
    local data = {
        title = 'Error',
        description = 'You are too broke...',
        type = 'error'
    }
    if moneyCount < Config.Price then
        TriggerClientEvent('ox_lib:notify', source, data)
        return 
    end
    exports.ox_inventory:RemoveItem(source, 'money', Config.Price)
    exports.ox_inventory:AddItem(source, prizeItem, items[itemSelect].count)
end)

lib.callback.register('fang-bubblerobbery:server:giveMoney', function(source)
    local amount = math.random(10,30)
    exports.ox_inventory:RemoveItem(source, 'lockpick', 1)
    exports.ox_inventory:AddItem(source, 'money', amount)
end)