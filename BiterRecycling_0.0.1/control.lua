local function on_entity_died_drop(event)
	local min = 0
	local max = 1 + event.entity.pollution_bonus


	local drop_type = math.random(0, 4)
	local item_count = math.random() + event.entity.pollution_bonus * 0.1

	if (drop_type == 1) then
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

	-- local cooper = event.loot.insert { name = "copper-ore", probability = 0.5, count_min = min, count_max = max }
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
