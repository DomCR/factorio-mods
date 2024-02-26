local function on_entity_died_drop(event)
	if
		event.entity.type == "unit-spawner" or
		event.entity.type == "turret"
	then
		local drop_type = math.random(0, 6)
		local item_count = math.floor(math.random(5, 10) + event.entity.pollution_bonus * 0.1)
		local item_name

		if drop_type == 0 then
			item_name = "automation-science-pack"
		elseif (drop_type == 1) then
			item_name = "chemical-science-pack"
		elseif (drop_type == 2) then
			item_name = "military-science-pack"
		elseif (drop_type == 3) then
			item_name = "chemical-science-pack"
		elseif (drop_type == 4) then
			item_name = "production-science-pack"
		elseif (drop_type == 5) then
			item_name = "logistic-science-pack"
		elseif (drop_type == 6) then
			item_name = "utility-science-pack"
		end

		event.loot.insert { name = item_name, probability = 0.5, count = item_count }
	else
		local drop_type = math.random(0, 4)
		local item_count = math.floor(math.random(0, 1) + event.entity.pollution_bonus * 0.1)

		if item_count == 0 then
		elseif (drop_type == 1) then
			event.loot.insert { name = "iron-ore", probability = 0.5, count = item_count }
		elseif (drop_type == 2) then
			event.loot.insert { name = "copper-ore", probability = 0.5, count = item_count }
		elseif (drop_type == 3) then
			event.loot.insert { name = "coal", probability = 0.5, count = item_count }
		elseif (drop_type == 4) then
			event.loot.insert { name = "stone", probability = 0.5, count = item_count }
		elseif (drop_type == 5) then
			event.loot.insert { name = "uranium-ore", probability = 0.5, count = item_count }
		end
	end
	
end

script.on_event(
	defines.events.on_entity_died,
	on_entity_died_drop,
	{
		{ filter = "type", type = "unit",         mode = "or" },
		{ filter = "type", type = "unit-spawner", mode = "or" },
		{ filter = "type", type = "turret",       mode = "or" }
	}
)
