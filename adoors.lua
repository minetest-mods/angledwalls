-- adoors by TumeniNodes (C) 2018

local screwdriver = rawget(_G, "screwdriver") or {}
local S = core.get_translator(core.get_current_modname())

adoors = {}

-- Register adoor nodes
adoors.door = {
	{
		"steel",
		S("Steel"),
		{cracky = 1, door = 1},
		default.node_sound_metal_defaults(),
		"doors_steel_door",
		{name = "doors_door_steel.png"},
		"default:steelblock",
	},

	{
		"glass",
		S("Glass"),
		{cracky = 3, door = 1},
		default.node_sound_glass_defaults(),
		"doors_glass_door",
		{name = "doors_door_glass.png"},
		"default:glass",
	},

	{
		"obsidian_glass",
		S("Obsidian Glass"),
		{cracky = 1, door = 1},
		default.node_sound_glass_defaults(),
		"doors_glass_door",
		{name = "doors_door_obsidian_glass.png"},
		"default:obsidian_glass",
	},

	{
		"wood",
		S("Wood"),
		{choppy = 2, door = 1},
		default.node_sound_wood_defaults(),
		"doors_door",
		{name = "doors_door_wood.png"},
		"default:wood",
	},
}

local ALPHA_CLIP = core.features.use_texture_alpha_string_modes and "clip" or true

for _, row in ipairs(adoors.door) do
	local name = row[1]
	local desc = row[2]
	local mat_groups = row[3]
	local mat_sound = row[4]
	local door_sound = row[5]
	local door_tiles = row[6]
	local craft_material = row[7]

	core.register_node(":adoors:" .. name .. "_Ldoor", {
		description = S("@1 Door (left)", desc),
		inventory_image = "doors_item_" .. name .. ".png^[transformFXX",
		wield_image = "doors_item_" .. name .. ".png^[transformFXX",
		drawtype = "mesh",
		mesh = "adoors_Ldoor.obj",
		tiles = {door_tiles},
		use_texture_alpha = ALPHA_CLIP,
		paramtype = "light",
		paramtype2 = "facedir",
		on_rotate = screwdriver.rotate_simple,
		sunlight_propogates = true,
		is_ground_content = false,
		groups = mat_groups,
		sounds = mat_sound,
		selection_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.25, -0.5, 0.25, 0.375, 1.5, 0.375},
				{0.125, -0.5, 0.125, 0.25, 1.5, 0.25},
				{0, -0.5, 0, 0.125, 1.5, 0.125},
				{-0.125, -0.5, -0.125, 0, 1.5, 0},
				{-0.25, -0.5, -0.25, -0.125, 1.5, -0.125},
				{-0.375, -0.5, -0.375, -0.25, 1.5, -0.25},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.25, -0.5, 0.25, 0.375, 1.5, 0.375},
				{0.125, -0.5, 0.125, 0.25, 1.5, 0.25},
				{0, -0.5, 0, 0.125, 1.5, 0.125},
				{-0.125, -0.5, -0.125, 0, 1.5, 0},
				{-0.25, -0.5, -0.25, -0.125, 1.5, -0.125},
				{-0.375, -0.5, -0.375, -0.25, 1.5, -0.25},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		on_rightclick = function(pos, node, _)
			core.swap_node(pos, {name = "adoors:" .. name .. "_Ldoor_open", param2 = node.param2})
			core.sound_play(door_sound .. "_open", {gain = 0.20, max_hear_distance = 2})
		end,
	})

	core.register_node(":adoors:" .. name .. "_Ldoor_open", {
		drawtype = "mesh",
		mesh = "adoors_Ldoor_open.obj",
		tiles = {door_tiles},
		use_texture_alpha = ALPHA_CLIP,
		paramtype = "light",
		paramtype2 = "facedir",
		on_rotate = screwdriver.rotate_simple,
		legacy_facedir_simple = true,
		sunlight_propogates = true,
		is_ground_content = false,
		groups = mat_groups,
		drop = "adoors:" .. name .. "_Ldoor",
		sounds = mat_sound,
		selection_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, -1.375, 0.5, 1.5, -1.25},
				{0.25, -0.5, -1.25, 0.375, 1.5, -1.125},
				{0.125, -0.5, -1.125, 0.25, 1.5, -1},
				{0, -0.5, -1, 0.125, 1.5, -0.875},
				{-0.125, -0.5, -0.875, 0, 1.5, -0.75},
				{-0.25, -0.5, -0.75, -0.125, 1.5, -0.625},
				{-0.375, -0.5, -0.625, -0.25, 1.5, -0.5},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, -1.375, 0.5, 1.5, -1.25},
				{0.25, -0.5, -1.25, 0.375, 1.5, -1.125},
				{0.125, -0.5, -1.125, 0.25, 1.5, -1},
				{0, -0.5, -1, 0.125, 1.5, -0.875},
				{-0.125, -0.5, -0.875, 0, 1.5, -0.75},
				{-0.25, -0.5, -0.75, -0.125, 1.5, -0.625},
				{-0.375, -0.5, -0.625, -0.25, 1.5, -0.5},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		on_rightclick = function(pos, node, _)
			core.swap_node(pos, {name = "adoors:" .. name .. "_Ldoor", param2 = node.param2})
			core.sound_play(door_sound .. "_close", {gain = 0.20, max_hear_distance = 2})
		end,
	})

	core.register_node(":adoors:" .. name .. "_Rdoor", {
		description = S("@1 Door (right)", desc),
		inventory_image = "doors_item_" .. name .. ".png",
		wield_image = "doors_item_" .. name .. ".png",
		drawtype = "mesh",
		mesh = "adoors_Rdoor.obj",
		tiles = {door_tiles},
		use_texture_alpha = ALPHA_CLIP,
		paramtype = "light",
		paramtype2 = "facedir",
		on_rotate = screwdriver.rotate_simple,
		sunlight_propogates = true,
		is_ground_content = false,
		groups = mat_groups,
		sounds = mat_sound,
		selection_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.25, -0.5, 0.25, 0.375, 1.5, 0.375},
				{0.125, -0.5, 0.125, 0.25, 1.5, 0.25},
				{0, -0.5, 0, 0.125, 1.5, 0.125},
				{-0.125, -0.5, -0.125, 0, 1.5, 0},
				{-0.25, -0.5, -0.25, -0.125, 1.5, -0.125},
				{-0.375, -0.5, -0.375, -0.25, 1.5, -0.25},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.25, -0.5, 0.25, 0.375, 1.5, 0.375},
				{0.125, -0.5, 0.125, 0.25, 1.5, 0.25},
				{0, -0.5, 0, 0.125, 1.5, 0.125},
				{-0.125, -0.5, -0.125, 0, 1.5, 0},
				{-0.25, -0.5, -0.25, -0.125, 1.5, -0.125},
				{-0.375, -0.5, -0.375, -0.25, 1.5, -0.25},
				{-0.5, -0.5, -0.5, -0.375, 1.5, -0.375},
			},
		},
		on_rightclick = function(pos, node, _)
			core.swap_node(pos, {name = "adoors:" .. name .. "_Rdoor_open", param2 = node.param2})
			core.sound_play(door_sound .. "_open", {gain = 0.20, max_hear_distance = 2})
		end,
	})

	core.register_node(":adoors:" .. name .. "_Rdoor_open", {
		drawtype = "mesh",
		mesh = "adoors_Rdoor_open.obj",
		tiles = {door_tiles},
		use_texture_alpha = ALPHA_CLIP,
		paramtype = "light",
		paramtype2 = "facedir",
		on_rotate = screwdriver.rotate_simple,
		legacy_facedir_simple = true,
		sunlight_propogates = true,
		is_ground_content = false,
		groups = mat_groups,
		drop = "adoors:" .. name .. "_Rdoor",
		sounds = mat_sound,
		selection_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.5, -0.5, 0.25, 0.625, 1.5, 0.375},
				{0.625, -0.5, 0.125, 0.75, 1.5, 0.25},
				{0.75, -0.5, 0, 0.875, 1.5, 0.125},
				{0.875, -0.5, -0.125, 1, 1.5, 0},
				{1, -0.5, -0.25, 1.125, 1.5, -0.125},
				{1.125, -0.5, -0.375, 1.25, 1.5, -0.25},
				{1.25, -0.5, -0.5, 1.375, 1.5, -0.375},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 1.5, 0.5},
				{0.5, -0.5, 0.25, 0.625, 1.5, 0.375},
				{0.625, -0.5, 0.125, 0.75, 1.5, 0.25},
				{0.75, -0.5, 0, 0.875, 1.5, 0.125},
				{0.875, -0.5, -0.125, 1, 1.5, 0},
				{1, -0.5, -0.25, 1.125, 1.5, -0.125},
				{1.125, -0.5, -0.375, 1.25, 1.5, -0.25},
				{1.25, -0.5, -0.5, 1.375, 1.5, -0.375},
			},
		},
		on_rightclick = function(pos, node, _)
			core.swap_node(pos, {name = "adoors:" .. name .. "_Rdoor", param2 = node.param2})
			core.sound_play(door_sound .. "_close", {gain = 0.20, max_hear_distance = 2})
		end,
	})
end
