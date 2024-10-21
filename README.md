# fang-bubblegumrobbery
Thanks to RiotX for the idea and xT for the function I pulled my hair out for :)

# Description
This script is what it is. You can rob the gumball machines around town! 
This script allows players to purchase gumballs for a small amount of change, which can be changed in the configs.
But if someone wants to be devious and they're too broke to buy one, then if they have lockpicks, they can break the machine open
and steal some change. Mind you they can only get 10-30 bucks out of it. 

# Features
- Buy gumballs from the machines around town
- Steal from the machine
- Configurable cooldown timer, buy price and items.

# Dependencies
- ox_inventory
- ox_target
- qbx_core

# Other things
The items/images implement as they should, but I have not added any usages for the items themselves. 
I believe that other devs can do what they need with them, such as add effects, buffs etc. Have some free reign with them!
Also the only issue so far with this (that I am unsure on how to change) is that if a player goes a certain distance, the prop will leave the players scope and obviously respawn with a new ID.
If someone finds a way to fix that (if it is possible, I am still learning as I go here) make a PR and I will more than likely accept it.

#Items
```lua
    ['gum1'] = {
        label = 'Red Gumball',
        weight = 10,
        stack = true,
        close = true,
        client = {
            image = 'redgumball.png'
        }
    },
    ['gum2'] = {
        label = 'Yellow Gumball',
        weight = 10,
        stack = true,
        close = true,
        client = {
            image = 'yellowgumball.png'
        }
    },
    ['gum3'] = {
        label = 'Green Gumball',
        weight = 10,
        stack = true,
        close = true,
        client = {
            image = 'greeengumball.png'
        }
    },
    ['gum4'] = {
        label = 'Blue Gumball',
        weight = 10,
        stack = true,
        close = true,
        client = {
            image = 'bluegumball.png'
        }
    },
    ['gum5'] = {
        label = 'Purple Gumball',
        weight = 10,
        stack = true,
        close = true,
        client = {
            image = 'purplegumball.png'
        }
    },
}
```
