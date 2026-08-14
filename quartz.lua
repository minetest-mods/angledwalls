-- Register wall types

local S = core.get_translator(core.get_current_modname())

angledwalls.register_angled_wall_and_low_angled_wall_and_corner(
	"quartzblock",
	"quartz:block",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"quartz_block.png"},
	S("Quartz Block Angled Wall"),
	S("Quartz Block Low Angled Wall"),
	S("Quartz Block Corner"),
	default.node_sound_stone_defaults()
)

angledwalls.register_angled_wall_and_low_angled_wall_and_corner(
	"quartzchiseled",
	"quartz:chiseled",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"quartz_chiseled.png"},
	S("Quartz Chiseled Angled Wall"),
	S("Quartz Chiseled Low Angled Wall"),
	S("Quartz Chiseled Corner"),
	default.node_sound_stone_defaults()
)

angledwalls.register_angled_wall_and_low_angled_wall_and_corner(
	"quartzpillar",
	"quartz:pillar",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"quartz_pillar_side.png"},
	S("Quartz Pillar Angled Wall"),
	S("Quartz Pillar Low Angled Wall"),
	S("Quartz Pillar Corner"),
	default.node_sound_stone_defaults()
)

-- Register glass types

angledglass.register_glass(
	"_quartz_block_glass",
	"quartz:block",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_glass.png", "quartz_block.png"},
	S("Quartz Block Glass"),
	default.node_sound_glass_defaults()
)

angledglass.register_glass(
	"_quartz_block_obsidian_glass",
	"quartz:block",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	{"default_obsidian_glass.png", "quartz_block.png"},
	S("Quartz Block Obsidian Glass"),
	default.node_sound_glass_defaults()
)

-- Only quartz:block glass, as all the quartz textures look the same for this node.
