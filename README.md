# fm-tunerjob

Dette er et  tuner job lavet til QBCore.

Det map jeg bruger er dette:
https://www.youtube.com/watch?v=a_Yt4Lv41pQ&ab_channel=kiiya

## Dependencies
[qn-target](https://github.com/BerkieBb/qb-target)

[Fivem.Dks QB filer](https://github.com/NicoDK6400/QBCore--Oversat-til-dansk/tree/main/)

## Installation
Alle billerne i images skal ind i qb-inventory/html/images

Det her skal ind i
qb-inventory/server/main.lua efter linje 591
```
RegisterNetEvent('inventory:server:CraftTuner', function(itemName, itemCosts, amount, toSlot, points)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local amount = tonumber(amount)
	if itemName ~= nil and itemCosts ~= nil then
		for k, v in pairs(itemCosts) do
			Player.Functions.RemoveItem(k, (v*amount))
		end
		Player.Functions.AddItem(itemName, amount, toSlot)
		Player.Functions.SetMetaData("tunercraftingrep", Player.PlayerData.metadata["tunercraftingrep"]+(points*amount))
		TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, false)
	end
end)
```

Det her skal ind i
qb-inventory/server/main.lua efter linje 764
```
elseif name == "tuner_crafting" then
				secondInv.name = "tuner_crafting"
				secondInv.label = other.label
				secondInv.maxweight = 900000
				secondInv.inventory = other.items
				secondInv.slots = #other.items
```

Det her skal ind i
qb-inventory/server/main.lua efter linje 1341
```
elseif fromInventory == "tuner_crafting" then
		local itemData = Config.TunerCrafting["items"][fromSlot]
		if hasCraftItems(src, itemData.costs, fromAmount) then
			TriggerClientEvent("inventory:client:CraftTuner", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points)
```


Det var det for qb-inventory
Nu er vi nået til qb-core
qb-core/shared/items.lua
```
-- Køretøjs Tun
	["engine0"] 		 	 	  = {["name"] = "engine0", 							["label"] = "Standard Motor", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_a.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Standard Motor"},
	["engine1"] 		 	 	  = {["name"] = "engine1", 							["label"] = "Tunet Motor 1", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_b.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Motor 1"},
	["engine2"] 		 	 	  = {["name"] = "engine2", 							["label"] = "Tunet Motor 2", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_c.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Motor 2"},
	["engine3"] 		 	 	  = {["name"] = "engine3", 							["label"] = "Tunet Motor 3", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_d.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Motor 3"},
	["engine4"] 		 	 	  = {["name"] = "engine4", 							["label"] = "Tunet Motor 4", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "engine_parts_s.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Motor 4"},

	["brake0"] 		 	 		  = {["name"] = "brake0", 							["label"] = "Standard Bremse", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_a.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Standard Bremse"},
	["brake1"] 		 	 	      = {["name"] = "brake1", 							["label"] = "Tunet Bremse 1", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_b.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Bremse 1"},
	["brake2"] 		 	 		  = {["name"] = "brake2", 							["label"] = "Tunet Bremse 2", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_c.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Bremse 2"},
	["brake3"] 		 	 		  = {["name"] = "brake3", 							["label"] = "Tunet Bremse 3", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "brake_parts_d.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Bremse 3"},

	["transmission0"] 		 	  = {["name"] = "transmission0", 					["label"] = "Standard Transmission", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_a.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Standard Transmission"},
	["transmission1"] 		 	  = {["name"] = "transmission1", 					["label"] = "Tunet Transmission 1", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_b.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Transmission 1"},
	["transmission2"] 		 	  = {["name"] = "transmission2", 					["label"] = "Tunet Transmission 2", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_c.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Transmission 2"},
	["transmission3"] 		 	  = {["name"] = "transmission3", 					["label"] = "Tunet Transmission 3", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "transmission_parts_d.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Transmission 3"},

	
	["suspension0"] 		 	  = {["name"] = "suspension0", 						["label"] = "Standard Affjedring", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension0.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Standard Affjedring"},
	["suspension1"] 		 	  = {["name"] = "suspension1", 						["label"] = "Tunet Affjedring 1", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension1.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Affjedring 1"},
	["suspension2"] 		 	  = {["name"] = "suspension2", 						["label"] = "Tunet Affjedring 2", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "stock_suspension2.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Affjedring 2"},
	["suspension3"] 		 	  = {["name"] = "suspension3", 						["label"] = "Tunet Affjedring 3", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "race_suspension3.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Affjedring 3"},
	["suspension4"] 		 	  = {["name"] = "suspension4", 						["label"] = "Tunet Affjedring 4", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "race_suspension4.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tunet Affjedring 4"},


	["turbo0"] 		 	 		  = {["name"] = "turbo0", 							["label"] = "Fjern Turbu", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "turbo0.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fjern den turbo der sidder i bilen"},
	["turbo1"] 		 	 		  = {["name"] = "turbo1", 							["label"] = "Turbo", 							["weight"] = 125, 		["type"] = "item", 		["image"] = "turbo1.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tilføj en turbo til bilen"},

```
## License
[Apache 2.0](https://choosealicense.com/licenses/apache-2.0/)
