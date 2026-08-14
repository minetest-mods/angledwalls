-- [MOD] Angled Walls [angledwalls] [1.2] by TumeniNodes 6-24-2016

angledwalls = {}

local S = core.get_translator(core.get_current_modname())

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
		tiles = rdef and rdef.tiles and table.copy(rdef.tiles),
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
			},
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
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
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
			},
		},
	})
	ndef.groups.corner = 1

	core.register_node(":" .. wall_node_name, ndef)
end

-- Angled wall/low wall/corner registration function.
-- Nodes will be called angledwalls:{angled_wall,low_angled_wall,corner}_<subname>

function angledwalls.register_angled_wall_and_low_angled_wall_and_corner(
	subname,
	recipeitem,
	groups,
	images,
	desc_angled_wall,
	desc_low_angled_wall,
	desc_corner,
	sounds
)
	-- Convert "mod_name:node_name" to "node_name"
	subname = subname or string.match(recipeitem, "^[%w_]+:(.+)$")

	angledwalls.register_angled_wall(subname, recipeitem, groups, images, desc_angled_wall, sounds)
	angledwalls.register_low_angled_wall(subname, recipeitem, groups, images, desc_low_angled_wall, sounds)
	angledwalls.register_corner(subname, recipeitem, groups, images, desc_corner, sounds)
end

-- Register angled walls and low angled walls and corner
local register_all = angledwalls.register_angled_wall_and_low_angled_wall_and_corner

register_all(
	nil,
	"default:acacia_wood",
	nil,
	nil,
	S("Acacia Wood Angled Wall"),
	S("Acacia Wood Low Angled Wall"),
	S("Acacia Wood Corner"),
	nil
)

register_all(
	nil,
	"default:aspen_wood",
	nil,
	nil,
	S("Aspen Wood Angled Wall"),
	S("Aspen Wood Low Angled Wall"),
	S("Aspen Wood Corner"),
	nil
)

register_all(
	nil,
	"default:junglewood",
	nil,
	nil,
	S("Junglewood Angled Wall"),
	S("Junglewood Low Angled Wall"),
	S("junglewood Corner"),
	nil
)

register_all(
	nil,
	"default:pine_wood",
	nil,
	nil,
	S("Pine Wood Angled Wall"),
	S("Pine Wood Low Angled Wall"),
	S("Pine Wood Corner"),
	nil
)

register_all(
	nil,
	"default:wood",
	nil,
	nil,
	S("Wooden Angled Wall"),
	S("Wooden Low Angled Wall"),
	S("Wooden Corner"),
	nil
)

register_all(
	nil,
	"default:brick",
	nil,
	nil,
	S("Brick Angled Wall"),
	S("Brick Low Angled Wall"),
	S("Brick Corner"),
	nil
)

register_all(
	"bronze_block",
	"default:bronzeblock",
	nil,
	nil,
	S("Bronze Block Angled Wall"),
	S("Bronze Block Low Angled Wall"),
	S("Bronze Block Corner"),
	nil
)

register_all(
	nil,
	"default:clay",
	nil,
	nil,
	S("Clay Angled Wall"),
	S("Clay Low Angled Wall"),
	S("Clay Corner"),
	nil
)

register_all(
	"coal_block",
	"default:coalblock",
	nil,
	nil,
	S("Coal Block Angled Wall"),
	S("Coal Block Low Angled Wall"),
	S("Coal Block Corner"),
	nil
)

register_all(
	nil,
	"default:copperblock",
	nil,
	nil,
	S("Copper Block Angled Wall"),
	S("Copper Block Low_angled Wall"),
	S("Copper Block Corner"),
	nil
)

register_all(
	nil,
	"default:diamondblock",
	nil,
	nil,
	S("Diamond Block Angled Wall"),
	S("Diamond Block Low_angled Wall"),
	S("Diamond Block Corner"),
	nil
)

register_all(
	nil,
	"default:goldblock",
	nil,
	nil,
	S("Gold Block Angled Wall"),
	S("Gold Block Low_angled Wall"),
	S("Gold Block Corner"),
	nil
)

register_all(
	nil,
	"default:meseblock",
	nil,
	nil,
	S("Mese Block Angled Wall"),
	S("Mese Block Low_angled Wall"),
	S("Mese Block Corner"),
	nil
)

register_all(
	nil,
	"default:steelblock",
	nil,
	nil,
	S("Steel Block Angled Wall"),
	S("Steel Block Low_angled Wall"),
	S("Steel Block Corner"),
	nil
)

register_all(
	nil,
	"default:tinblock",
	nil,
	nil,
	S("Tin Block Angled Wall"),
	S("Tin Block Low_angled Wall"),
	S("Tin Block Corner"),
	nil
)

register_all(
	nil,
	"default:cobble",
	nil,
	nil,
	S("Cobblestone Angled Wall"),
	S("Cobblestone Low Angled Wall"),
	S("Cobblestone Corner"),
	nil
)

register_all(
	nil,
	"default:mossycobble",
	nil,
	nil,
	S("Mossycobble Angled Wall"),
	S("Mossycobble Low Angled Wall"),
	S("Mossycobble Corner"),
	nil
)

register_all(
	nil,
	"default:stone",
	nil,
	nil,
	S("Stone Angled Wall"),
	S("Stone Low Angled Wall"),
	S("Stone Corner"),
	nil
)

register_all(
	nil,
	"default:stone_block",
	nil,
	nil,
	S("Stone Block Angled Wall"),
	S("Stone Block Low Angled Wall"),
	S("Stone Block Corner"),
	nil
)

register_all(
	nil,
	"default:stonebrick",
	nil,
	nil,
	S("Stone Brick Angled Wall"),
	S("Stone Brick Low Angled Wall"),
	S("Stone Brick Corner"),
	nil
)

register_all(
	nil,
	"default:desertscobble",
	nil,
	nil,
	S("Desert Cobble Angled Wall"),
	S("Desert Cobble Low Angled Wall"),
	S("Desert Cobble Corner"),
	nil
)

register_all(
	nil,
	"default:desertstone",
	nil,
	nil,
	S("Desert Stone Angled Wall"),
	S("Desert Stone Low Angled Wall"),
	S("Desert Stone Corner"),
	nil
)

register_all(
	nil,
	"default:desert_stone_block",
	nil,
	nil,
	S("Desert Stone Block Angled Wall"),
	S("Desert Stone Block Low Angled Wall"),
	S("Desert Stone Block Corner"),
	nil
)

register_all(
	nil,
	"default:desert_stonebrick",
	nil,
	nil,
	S("Desert Stone Brick Angled Wall"),
	S("Desert Stone Brick Low Angled Wall"),
	S("Desert Stone Brick Corner"),
	nil
)

register_all(
	nil,
	"default:desert_sandstone",
	nil,
	nil,
	S("Desert Sandstone Angled Wall"),
	S("Desert Sandstone Low Angled Wall"),
	S("Desert Sandstone Corner"),
	nil
)

register_all(
	nil,
	"default:desert_sandstone_block",
	nil,
	nil,
	S("Desert Sandstone Block Angled Wall"),
	S("Desert Sandstone Block Low Angled Wall"),
	S("Desert Sandstone Block Corner"),
	nil
)

register_all(
	nil,
	"default:desert_sandstone_brick",
	nil,
	nil,
	S("Desert Sandstone Brick Angled Wall"),
	S("Desert Sandstone Brick Low Angled Wall"),
	S("Desert Sandstone Brick Corner"),
	nil
)

register_all(
	nil,
	"default:sandstone",
	nil,
	nil,
	S("Sandstone Angled Wall"),
	S("Sandstone Low Angled Wall"),
	S("Sandstone Corner"),
	nil
)

register_all(
	nil,
	"default:sandstone_block",
	nil,
	nil,
	S("Sandstone Block Angled Wall"),
	S("Sandstone Block Low Angled Wall"),
	S("Sandstone Block Corner"),
	nil
)

register_all(
	nil,
	"default:sandstonebrick",
	nil,
	nil,
	S("Sandstone Brick Angled Wall"),
	S("Sandstone Brick Low Angled Wall"),
	S("Sandstone Brick Corner"),
	nil
)

register_all(
	nil,
	"default:silver_sandstone",
	nil,
	nil,
	S("Silver Sandstone Angled Wall"),
	S("Silver Sandstone Low Angled Wall"),
	S("Silver Sandstone Corner"),
	nil
)

register_all(
	nil,
	"default:silver_sandstone_block",
	nil,
	nil,
	S("Silver Sandstone Block Angled Wall"),
	S("Silver Sandstone Block Low Angled Wall"),
	S("Silver Sandstone Block Corner"),
	nil
)

register_all(
	nil,
	"default:silver_sandstone_brick",
	nil,
	nil,
	S("Silver Sandstone Brick Angled Wall"),
	S("Silver Sandstone Brick Low Angled Wall"),
	S("Silver Sandstone Brick Corner"),
	nil
)

register_all(
	nil,
	"default:obsidian",
	nil,
	nil,
	S("Obsidian Angled Wall"),
	S("Obsidian Low Angled Wall"),
	S("Obsidian Corner"),
	nil
)

register_all(
	nil,
	"default:obsidian_block",
	nil,
	nil,
	S("Obsidian Block Angled Wall"),
	S("Obsidian Block Low Angled Wall"),
	S("Obsidian Block Corner"),
	nil
)

register_all(
	nil,
	"default:obsidian_brick",
	nil,
	nil,
	S("Obsidian Brick Angled Wall"),
	S("Obsidian Brick Low Angled Wall"),
	S("Obsidian Brick Corner"),
	nil
)

register_all(
	nil,
	"default:glass",
	nil,
	nil,
	S("Glass Angled Wall"),
	S("Glass Low Angled Wall"),
	S("Glass Corner"),
	nil
)

register_all(
	"obsidianglass",
	"default:obsidian_glass",
	nil,
	nil,
	S("Obsidian Glass Angled Wall"),
	S("Obsidian Glass Low Angled Wall"),
	S("Obsidian Glass Corner"),
	nil
)

register_all(
	nil,
	"default:ice",
	nil,
	nil,
	S("Ice Angled Wall"),
	S("Ice Low Angled Wall"),
	S("Ice Corner"),
	nil
)

register_all(
	nil,
	"default:snow",
	nil,
	nil,
	S("Snow Angled Wall"),
	S("Snow Low Angled Wall"),
	S("Snow Corner"),
	nil
)
