-- [MOD] Angled Walls [angledwalls] [1.2] by TumeniNodes 6-24-2016

angledwalls = {}

-- Angled place function
-- To use put "on_place = angledwalls.angled_place" in the node def

function angledwalls.angled_place(itemstack, placer, pointed_thing)
	local placer_pos = placer:get_pos()
	local pos = pointed_thing.above
	local param2
	if pos.x > placer_pos.x then
		if pos.z > placer_pos.z then
			param2 = 1
		else
			param2 = 2
		end
	else
		if pos.z > placer_pos.z then
			param2 = 0
		else
			param2 = 3
		end
	end
	return core.item_place(itemstack, placer, pointed_thing, param2)
end

local ALPHA_OPAQUE = core.features.use_texture_alpha_string_modes and "opaque" or false
local function fallback_fields(recipeitem, ndef)
	local rdef = core.registered_nodes[recipeitem]
	if not rdef then
		core.log("info", "[angledwalls] Recipe item '" .. recipeitem .. "' not found. Falling back to defaults...")
	end

	local defaults = {
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propogates = true,
		is_ground_content = false,
		tiles             = rdef and rdef.tiles  and table.copy(rdef.tiles),
		use_texture_alpha = rdef and rdef.use_texture_alpha or ALPHA_OPAQUE,
		sounds            = rdef and rdef.sounds and table.copy(rdef.sounds),
		groups            = rdef and rdef.groups and table.copy(rdef.groups) or {},
		-- Callbacks
		on_place = angledwalls.angled_place,
	}

	for k, v in pairs(defaults) do
		if ndef[k] == nil then
			ndef[k] = v
		end
	end
	return ndef
end

--Register angledwalls.
--Node will be called angledwalls:angled_wall_<subname>

function angledwalls.register_angled_wall(subname, recipeitem, groups, images, description, sounds)
	local wall_node_name = "angledwalls:angled_wall" .. subname
	local ndef = fallback_fields(recipeitem, {
		description = description,
		drawtype = "mesh",
		mesh = "angled_wall.obj",
		tiles = images,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{0, -0.5, 0, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, 0, 0.5, 0},
				{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
				{-0.3125, -0.5, -0.1875, 0.3125, 0.5, 0.1875},
				{-0.1875, -0.5, -0.3125, 0.1875, 0.5, 0.3125},
				{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
				{-0.0625, -0.5, -0.4375, 0.0625, 0.5, 0.4375},
				{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
				{-0.4375, -0.5, -0.0625, 0.4375, 0.5, 0.0625},
			}
		},
	})
	ndef.groups.angledwall = 1

	core.register_node(":" .. wall_node_name, ndef)
end

-- Register angledwalls.
-- Node will be called angledwalls:low_angled_wall_<subname>

function angledwalls.register_low_angled_wall(subname, recipeitem, groups, images, description, sounds)
	local wall_node_name = "angledwalls:low_angled_wall" .. subname
	local ndef = fallback_fields(recipeitem, {
		description = description,
		drawtype = "mesh",
		mesh = "low_angled_wall.obj",
		tiles = images,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{0, -0.5, 0, 0.5, 0, 0.5},
				{-0.5, -0.5, -0.5, 0, 0, 0},
				{-0.25, -0.5, -0.25, 0.25, 0, 0.25},
				{-0.3125, -0.5, -0.1875, 0.3125, 0, 0.1875},
				{-0.1875, -0.5, -0.3125, 0.1875, 0, 0.3125},
				{-0.125, -0.5, -0.375, 0.125, 0, 0.375},
				{-0.0625, -0.5, -0.4375, 0.0625, 0, 0.4375},
				{-0.375, -0.5, -0.125, 0.375, 0, 0.125},
				{-0.4375, -0.5, -0.0625, 0.4375, 0, 0.062},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	ndef.groups.lowangledwall = 1

	core.register_node(":" .. wall_node_name, ndef)
end

--Register angledwalls.
--Node will be called angledwalls:corner_<subname>

function angledwalls.register_corner(subname, recipeitem, groups, images, description, sounds)
	local wall_node_name = "angledwalls:corner" .. subname
	local ndef = fallback_fields(recipeitem, {
		description = description,
		drawtype = "mesh",
		mesh = "angledwalls_corner.obj",
		tiles = images,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{0, -0.5, 0, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, 0, 0.5, 0},
				{-0.1875, -0.5, -0.1875, 0.3125, 0.5, 0.3125},
				{-0.125, -0.5, -0.125, 0.375, 0.5, 0.375},
				{-0.375, -0.5, -0.375, 0.125, 0.5, 0.125},
				{-0.4375, -0.5, -0.4375, 0.0625, 0.5, 0.0625},
				{-0.0625, -0.5, -0.0625, 0.4375, 0.5, 0.4375},
				{-0.25, -0.5, -0.3125, 0.1875, 0.5, 0.25},
				{-0.5, -0.5, -0.25, 0.25, 0.5, 0.5},
			}
		},
	})
	ndef.groups.corner = 1

	core.register_node(":" .. wall_node_name, ndef)
end

-- Angled wall/low wall/corner registration function.
-- Nodes will be called angledwalls:{angled_wall,low_angled_wall,corner}_<subname>

function angledwalls.register_angled_wall_and_low_angled_wall_and_corner(subname, recipeitem, groups, images,desc_angled_wall, desc_low_angled_wall, desc_corner, sounds)
	-- Convert "mod_name:node_name" to "node_name"
	subname = subname or string.match(recipeitem, "^[%w_]+:(.+)$")

	angledwalls.register_angled_wall(subname, recipeitem, groups, images, desc_angled_wall, sounds)
	angledwalls.register_low_angled_wall(subname, recipeitem, groups, images, desc_low_angled_wall, sounds)
	angledwalls.register_corner(subname, recipeitem, groups, images, desc_corner, sounds)
end


-- Register angled walls and low angled walls and corner
local register_all = angledwalls.register_angled_wall_and_low_angled_wall_and_corner

register_all(nil, "default:acacia_wood",
	nil,
	nil,
	"Acacia Wood Angled Wall",
	"Acacia Wood Low Angled Wall",
	"Acacia Wood Corner",
	nil
)

register_all(nil, "default:aspen_wood",
	nil,
	nil,
	"Aspen Wood Angled Wall",
	"Aspen Wood Low Angled Wall",
	"Aspen Wood Corner",
	nil
)

register_all(nil, "default:junglewood",
	nil,
	nil,
	"Junglewood Angled Wall",
	"Junglewood Low Angled Wall",
	"junglewood Corner",
	nil
)

register_all(nil, "default:pine_wood",
	nil,
	nil,
	"Pine Wood Angled Wall",
	"Pine Wood Low Angled Wall",
	"Pine Wood Corner",
	nil
)

register_all(nil, "default:wood",
	nil,
	nil,
	"Wooden Angled Wall",
	"Wooden Low Angled Wall",
	"Wooden Corner",
	nil
)

register_all(nil, "default:brick",
	nil,
	nil,
	"Brick Angled Wall",
	"Brick Low Angled Wall",
	"Brick Corner",
	nil
)

register_all("bronze_block", "default:bronzeblock",
	nil,
	nil,
	"Bronze Block Angled Wall",
	"Bronze Block Low Angled Wall",
	"Bronze Block Corner",
	nil
)

register_all(nil, "default:clay",
	nil,
	nil,
	"Clay Angled Wall",
	"Clay Low Angled Wall",
	"Clay Corner",
	nil
)

register_all("coal_block", "default:coalblock",
	nil,
	nil,
	"Coal Block Angled Wall",
	"Coal Block Low Angled Wall",
	"Coal Block Corner",
	nil
)

register_all(nil, "default:copperblock",
	nil,
	nil,
	"Copper Block Angled Wall",
	"Copper Block Low_angled Wall",
	"Copper Block Corner",
	nil
)

register_all(nil, "default:diamondblock",
	nil,
	nil,
	"Diamond Block Angled Wall",
	"Diamond Block Low_angled Wall",
	"Diamond Block Corner",
	nil
)

register_all(nil, "default:goldblock",
	nil,
	nil,
	"Gold Block Angled Wall",
	"Gold Block Low_angled Wall",
	"Gold Block Corner",
	nil
)

register_all(nil, "default:meseblock",
	nil,
	nil,
	"Mese Block Angled Wall",
	"Mese Block Low_angled Wall",
	"Mese Block Corner",
	nil
)

register_all(nil, "default:steelblock",
	nil,
	nil,
	"Steel Block Angled Wall",
	"Steel Block Low_angled Wall",
	"Steel Block Corner",
	nil
)

register_all(nil, "default:tinblock",
	nil,
	nil,
	"Tin Block Angled Wall",
	"Tin Block Low_angled Wall",
	"Tin Block Corner",
	nil
)

register_all(nil, "default:cobble",
	nil,
	nil,
	"Cobblestone Angled Wall",
	"Cobblestone Low Angled Wall",
	"Cobblestone Corner",
	nil
)

register_all(nil, "default:mossycobble",
	nil,
	nil,
	"Mossycobble Angled Wall",
	"Mossycobble Low Angled Wall",
	"Mossycobble Corner",
	nil
)

register_all(nil, "default:stone",
	nil,
	nil,
	"Stone Angled Wall",
	"Stone Low Angled Wall",
	"Stone Corner",
	nil
)

register_all(nil, "default:stone_block",
	nil,
	nil,
	"Stone Block Angled Wall",
	"Stone Block Low Angled Wall",
	"Stone Block Corner",
	nil
)

register_all(nil, "default:stonebrick",
	nil,
	nil,
	"Stone Brick Angled Wall",
	"Stone Brick Low Angled Wall",
	"Stone Brick Corner",
	nil
)

register_all(nil, "default:desertscobble",
	nil,
	nil,
	"Desert Cobble Angled Wall",
	"Desert Cobble Low Angled Wall",
	"Desert Cobble Corner",
	nil
)

register_all(nil, "default:desertstone",
	nil,
	nil,
	"Desert Stone Angled Wall",
	"Desert Stone Low Angled Wall",
	"Desert Stone Corner",
	nil
)

register_all(nil, "default:desert_stone_block",
	nil,
	nil,
	"Desert Stone Block Angled Wall",
	"Desert Stone Block Low Angled Wall",
	"Desert Stone Block Corner",
	nil
)

register_all(nil, "default:desert_stonebrick",
	nil,
	nil,
	"Desert Stone Brick Angled Wall",
	"Desert Stone Brick Low Angled Wall",
	"Desert Stone Brick Corner",
	nil
)

register_all(nil, "default:desert_sandstone",
	nil,
	nil,
	"Desert Sandstone Angled Wall",
	"Desert Sandstone Low Angled Wall",
	"Desert Sandstone Corner",
	nil
)

register_all(nil, "default:desert_sandstone_block",
	nil,
	nil,
	"Desert Sandstone Block Angled Wall",
	"Desert Sandstone Block Low Angled Wall",
	"Desert Sandstone Block Corner",
	nil
)

register_all(nil, "default:desert_sandstone_brick",
	nil,
	nil,
	"Desert Sandstone Brick Angled Wall",
	"Desert Sandstone Brick Low Angled Wall",
	"Desert Sandstone Brick Corner",
	nil
)

register_all(nil, "default:sandstone",
	nil,
	nil,
	"Sandstone Angled Wall",
	"Sandstone Low Angled Wall",
	"Sandstone Corner",
	nil
)

register_all(nil, "default:sandstone_block",
	nil,
	nil,
	"Sandstone Block Angled Wall",
	"Sandstone Block Low Angled Wall",
	"Sandstone Block Corner",
	nil
)

register_all(nil, "default:sandstonebrick",
	nil,
	nil,
	"Sandstone Brick Angled Wall",
	"Sandstone Brick Low Angled Wall",
	"Sandstone Brick Corner",
	nil
)

register_all(nil, "default:silver_sandstone",
	nil,
	nil,
	"Silver Sandstone Angled Wall",
	"Silver Sandstone Low Angled Wall",
	"Silver Sandstone Corner",
	nil
)

register_all(nil, "default:silver_sandstone_block",
	nil,
	nil,
	"Silver Sandstone Block Angled Wall",
	"Silver Sandstone Block Low Angled Wall",
	"Silver Sandstone Block Corner",
	nil
)

register_all(nil, "default:silver_sandstone_brick",
	nil,
	nil,
	"Silver Sandstone Brick Angled Wall",
	"Silver Sandstone Brick Low Angled Wall",
	"Silver Sandstone Brick Corner",
	nil
)

register_all(nil, "default:obsidian",
	nil,
	nil,
	"Obsidian Angled Wall",
	"Obsidian Low Angled Wall",
	"Obsidian Corner",
	nil
)

register_all(nil, "default:obsidian_block",
	nil,
	nil,
	"Obsidian Block Angled Wall",
	"Obsidian Block Low Angled Wall",
	"Obsidian Block Corner",
	nil
)

register_all(nil, "default:obsidian_brick",
	nil,
	nil,
	"Obsidian Brick Angled Wall",
	"Obsidian Brick Low Angled Wall",
	"Obsidian Brick Corner",
	nil
)

register_all(nil, "default:glass",
	nil,
	nil,
	"Glass Angled Wall",
	"Glass Low Angled Wall",
	"Glass Corner",
	nil
)

register_all("obsidianglass", "default:obsidian_glass",
	nil,
	nil,
	"Obsidian Glass Angled Wall",
	"Obsidian Glass Low Angled Wall",
	"Obsidian Glass Corner",
	nil
)

register_all(nil, "default:ice",
	nil,
	nil,
	"Ice Angled Wall",
	"Ice Low Angled Wall",
	"Ice Corner",
	nil
)

register_all(nil, "default:snow",
	nil,
	nil,
	"Snow Angled Wall",
	"Snow Low Angled Wall",
	"Snow Corner",
	nil
)
