angledglass = {}

local S = core.get_translator(core.get_current_modname())

-- Angled place function
-- To use put "on_place = angledglass.angled_place" in the node def
function angledglass.angled_place(itemstack, placer, pointed_thing)
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

--Register angledglass.
--Node will be called angledglass:glass_<subname>

local ALPHA_CLIP = core.features.use_texture_alpha_string_modes and "clip" or true

function angledglass.register_glass(subname, recipeitem, groups, images, description, sounds)
	groups.glass = 1

	core.register_node(":angledglass:glass" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "angled_glass.obj",
		tiles = images,
		use_texture_alpha = ALPHA_CLIP,
		paramtype = "light",
		sunlight_propogates = true,
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{0.375, -0.5, 0.375, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375},
				{-0.4375, -0.5, -0.4375, -0.3125, 0.5, -0.3125},
				{0.3125, -0.5, 0.3125, 0.4375, 0.5, 0.4375},
				{0.25, -0.5, 0.25, 0.375, 0.5, 0.375},
				{-0.375, -0.5, -0.375, -0.25, 0.5, -0.25},
				{0.1875, -0.5, 0.1875, 0.3125, 0.5, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, 0.5, -0.1875},
				{0.125, -0.5, 0.125, 0.25, 0.5, 0.25},
				{-0.25, -0.5, -0.25, -0.125, 0.5, -0.125},
				{0.0625, -0.5, 0.0625, 0.1875, 0.5, 0.1875},
				{-0.1875, -0.5, -0.1875, -0.0625, 0.5, -0.0625},
				{0, -0.5, 0, 0.125, 0.5, 0.125},
				{-0.125, -0.5, -0.125, 0, 0.5, 0},
				{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
			},
		},
		on_place = angledglass.angled_place,
	})
end

-- Register glass types

angledglass.register_glass(
	"_acacia_wood_glass",
	"default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "default_acacia_wood.png"},
	S("Acacia Wood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_acacia_wood_obsidian_glass",
	"default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "default_acacia_wood.png"},
	S("Acacia Wood Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_aspen_wood_glass",
	"default:aspen_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "default_aspen_wood.png"},
	S("Aspen Wood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_aspen_wood_obsidian_glass",
	"default:aspen_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "default_aspen_wood.png"},
	S("Aspen Wood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_junglewood_glass",
	"default:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "default_junglewood.png"},
	S("Junglewood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_junglewood_obsidian_glass",
	"default:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "default_junglewood.png"},
	S("Junglewood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_pine_wood_glass",
	"default:pine_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "default_pine_wood.png"},
	S("Pine Wood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_pine_wood_obsidian_glass",
	"default:pine_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "default_pine_wood.png"},
	S("Pine Wood Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_wooden_glass",
	"default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "default_wood.png"},
	S("Wooden Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_wooden_obsidian_glass",
	"default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "default_wood.png"},
	S("Wooden Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_brick_glass",
	"default:brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_brick.png"},
	S("Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_brick_obsidian_glass",
	"default:brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_brick.png"},
	S("Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_cobble_glass",
	"default:cobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_cobble.png"},
	S("Cobble Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_cobble_obsidian_glass",
	"default:cobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_cobble.png"},
	S("Cobble Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_mossycobble_glass",
	"default:mossycobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_mossycobble.png"},
	S("Mossycobble Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_mossycobble_obsidian_glass",
	"default:mossycobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_mossycobble.png"},
	S("Mossycobble Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_glass",
	"default:stone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_stone.png"},
	S("Stone Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_obsidian_glass",
	"default:stone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_stone.png"},
	S("Stone Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_block_glass",
	"default:stone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_stone_block.png"},
	S("Stone Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_block_obsidian_glass",
	"default:stone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_stone_block.png"},
	S("Stone Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_brick_glass",
	"default:stone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_stone_brick.png"},
	S("Stone Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_stone_brick_obsidian_glass",
	"default:stone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_stone_brick.png"},
	S("Stone Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_cobble_glass",
	"default:desert_cobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_cobble.png"},
	S("Desert Cobble Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_cobble_obsidian_glass",
	"default:desert_cobble",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_cobble.png"},
	S("Desert Cobble Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_glass",
	"default:desert_stone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_stone.png"},
	S("Desert Stone Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_obsidian_glass",
	"default:desert_stone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_stone.png"},
	S("Desert Stone Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_block_glass",
	"default:desert_stone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_stone_block.png"},
	S("Desert Stone Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_block_obsidian_glass",
	"default:desert_stone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_stone_block.png"},
	S("Desert Stone Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_brick_glass",
	"default:desert_stone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_stone_brick.png"},
	S("Desert Stone Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_stone_brick_obsidian_glass",
	"default:desert_stone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_stone_brick.png"},
	S("Desert Stone Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_glass",
	"default:desert_sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_sandstone.png"},
	S("Desert Sandstone Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_obsidian_glass",
	"default:desert_sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_sandstone.png"},
	S("Desert Sandstone Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_block_glass",
	"default:desert_sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_sandstone_block.png"},
	S("Desert Sandstone Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_block_obsidian_glass",
	"default:desert_sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_sandstone_block.png"},
	S("Desert Sandstone Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_brick_glass",
	"default:desert_sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_desert_sandstone_brick.png"},
	S("Desert Sandstone Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_desert_sandstone_brick_obsidian_glass",
	"default:desert_sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_desert_sandstone_brick.png"},
	S("Desert Sandstone Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_glass",
	"default:sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_sandstone.png"},
	S("Sandstone Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_obsidian_glass",
	"default:sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_sandstone.png"},
	S("Sandstone Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_block_glass",
	"default:sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_sandstone_block.png"},
	S("Sandstone Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_block_obsidian_glass",
	"default:sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_sandstone_block.png"},
	S("Sandstone Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_brick_glass",
	"default:sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_sandstone_brick.png"},
	S("Sandstone Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_sandstone_brick_obsidian_glass",
	"default:sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_sandstone_brick.png"},
	S("Sandstone Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_glass",
	"default:silver_sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_silver_sandstone.png"},
	S("Silver Sandstone Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_obsidian_glass",
	"default:silver_sandstone",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_silver_sandstone.png"},
	S("Silver Sandstone Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_block_glass",
	"default:silver_sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_silver_sandstone_block.png"},
	S("Silver Sandstone Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_block_obsidian_glass",
	"default:silver_sandstone_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_silver_sandstone_block.png"},
	S("Silver Sandstone Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_brick_glass",
	"default:silver_sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_silver_sandstone_brick.png"},
	S("Silver Sandstone Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_silver_sandstone_brick_obsidian_glass",
	"default:silver_sandstone_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_silver_sandstone_brick.png"},
	S("Silver Sandstone Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_bronze_block_glass",
	"default:bronze_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_bronze_block.png"},
	S("Bronze Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_bronze_block_obsidian_glass",
	"default:bronze_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_bronze_block.png"},
	S("Bronze Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_clay_glass",
	"default:clay",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_clay.png"},
	S("Clay Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_clay_obsidian_glass",
	"default:clay",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_clay.png"},
	S("Clay Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_coal_block_glass",
	"default:coal_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_coal_block.png"},
	S("Coal Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_coal_block_obsidian_glass",
	"default:coal_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_coal_block.png"},
	S("Coal Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_copper_block_glass",
	"default:copper_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_copper_block.png"},
	S("Copper Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_copper_block_obsidian_glass",
	"default:copper_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_copper_block.png"},
	S("Copper Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_diamond_block_glass",
	"default:diamond_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_diamond_block.png"},
	S("Diamond Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_diamond_block_obsidian_glass",
	"default:diamond_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_diamond_block.png"},
	S("Diamond Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_gold_block_glass",
	"default:gold_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_gold_block.png"},
	S("Gold Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_gold_block_obsidian_glass",
	"default:gold_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_gold_block.png"},
	S("Gold Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_mese_block_glass",
	"default:mese_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_mese_block.png"},
	S("Mese Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_mese_block_obsidian_glass",
	"default:mese_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_mese_block.png"},
	S("Mese Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_steel_block_glass",
	"default:steel_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_steel_block.png"},
	S("Steel Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_steel_block_obsidian_glass",
	"default:steel_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_steel_block.png"},
	S("Steel Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_tin_block_glass",
	"default:tin_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_tin_block.png"},
	S("Tin Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_tin_block_obsidian_glass",
	"default:tin_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_tin_block.png"},
	S("Tin Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_glass_glass",
	"default:glass",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_glass.png"},
	S("Glass Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_glass_obsidian_glass",
	"default:glass",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_glass.png"},
	S("Glass Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_glass",
	"default:obsidian",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_obsidian.png"},
	S("Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_obsidian_glass",
	"default:obsidian",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_obsidian.png"},
	S("Obsidian Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_block_glass",
	"default:obsidian_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_obsidian_block.png"},
	S("Obsidian Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_block_obsidian_glass",
	"default:obsidian_block",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_obsidian_block.png"},
	S("Obsidian Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_brick_glass",
	"default:obsidian_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_obsidian_brick.png"},
	S("Obsidian Brick Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_brick_obsidian_glass",
	"default:obsidian_brick",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_obsidian_brick.png"},
	S("Obsidian Brick Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_glass_glass",
	"default:obsidian_glass",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_obsidian_glass.png"},
	S("Obsidian Glass Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_obsidian_glass_obsidian_glass",
	"default:obsidian_glass",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_obsidian_glass.png"},
	S("Obsidian Glass Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_snow_glass",
	"default:snow",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_snow.png"},
	S("Snow Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_snow_obsidian_glass",
	"default:snow",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_snow.png"},
	S("Snow Obsidian Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_ice_glass",
	"default:ice",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_glass.png", "default_ice.png"},
	S("Ice Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_ice_obsidian_glass",
	"default:ice",
	{cracky = 2, oddly_breakable_by_hand = 2, stone = 1},
	{"default_obsidian_glass.png", "default_ice.png"},
	S("Ice Obsidian Glass"),
	default.node_sound_glass_defaults()
)
