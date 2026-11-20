/decl/sprite_accessory/ears/anthrope
	abstract_type = /decl/sprite_accessory/ears/anthrope
	color_blend = null

/decl/sprite_accessory/ears/anthrope/feline
	name = "Feline Ears"
	icon = 'mods/species/anthrope/icons/ears_tajaran.dmi'
	icon_state = "ears_plain"
	species_allowed = list(/decl/species/anthrope::uid)
	bodytypes_allowed = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine
	)
	uid = "acc_ears_anthrope_feline"

/decl/sprite_accessory/ears/anthrope/canid
	name = "Canid Ears"
	icon = 'mods/species/anthrope/icons/ears_biomods.dmi'
	icon_state = "wolf"
	species_allowed = list(/decl/species/anthrope::uid)
	bodytypes_allowed = list(
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine
	)
	uid = "acc_ears_anthrope_canid"

/decl/sprite_accessory/ears/anthrope/fox
	name = "Fox Ears"
	icon = 'mods/species/anthrope/icons/ears_biomods.dmi'
	icon_state = "fox"
	species_allowed = list(/decl/species/anthrope::uid)
	bodytypes_allowed = list(
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
	uid = "acc_ears_anthrope_fox"

/decl/sprite_accessory/tail/anthrope
	abstract_type = /decl/sprite_accessory/tail/anthrope
	color_blend = null

/decl/sprite_accessory/tail/anthrope/feline
	name = "Feline Tail"
	icon = 'mods/species/anthrope/icons/tails.dmi'
	icon_state = "straight"
	species_allowed = list(/decl/species/anthrope::uid)
	bodytypes_allowed = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine
	)
	uid = "acc_tail_anthrope_feline"

/decl/sprite_accessory/tail/anthrope/canid
	name = "Canid Tail"
	icon = 'mods/species/anthrope/icons/tails.dmi'
	icon_state = "straightbushy"
	species_allowed = list(/decl/species/anthrope::uid)
	bodytypes_allowed = list(
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine,
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
	uid = "acc_tail_anthrope_canid"

/decl/sprite_accessory/ears/none
	bodytypes_denied = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine,
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine,
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)

/decl/sprite_accessory/tail/none
	bodytypes_denied = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine,
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine,
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
