/decl/sprite_accessory/ears/anthrope
	abstract_type = /decl/sprite_accessory/ears/anthrope
	color_blend = null

/decl/sprite_accessory/ears/anthrope/feline
	name = "Feline Ears"
	icon = 'mods/species/anthrope/icons/ears_tajaran.dmi'
	icon_state = "ears_plain"
	species_allowed = list(/decl/species/anthrope/feline::uid)
	uid = "acc_ears_anthrope_feline"

/decl/sprite_accessory/ears/anthrope/canid
	name = "Canid Ears"
	icon = 'mods/species/anthrope/icons/ears_biomods.dmi'
	icon_state = "wolf"
	species_allowed = list(/decl/species/anthrope/canid::uid)
	uid = "acc_ears_anthrope_canid"

/decl/sprite_accessory/ears/anthrope/fox
	name = "Fox Ears"
	icon = 'mods/species/anthrope/icons/ears_biomods.dmi'
	icon_state = "fox"
	species_allowed = list(/decl/species/anthrope/fox::uid)
	uid = "acc_ears_anthrope_fox"

/decl/sprite_accessory/tail/anthrope
	abstract_type = /decl/sprite_accessory/tail/anthrope
	color_blend = null

/decl/sprite_accessory/tail/anthrope/feline
	name = "Feline Tail"
	icon = 'mods/species/anthrope/icons/tails.dmi'
	icon_state = "straight"
	species_allowed = list(/decl/species/anthrope/feline::uid)
	uid = "acc_tail_anthrope_feline"

/decl/sprite_accessory/tail/anthrope/canid
	name = "Canid Tail"
	icon = 'mods/species/anthrope/icons/tails.dmi'
	icon_state = "straightbushy"
	species_allowed = list(/decl/species/anthrope/canid::uid, /decl/species/anthrope/fox::uid)
	uid = "acc_tail_anthrope_canid"
