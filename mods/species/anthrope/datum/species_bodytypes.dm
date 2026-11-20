/decl/bodytype/human/anthrope
	abstract_type = /decl/bodytype/human/anthrope
	heat_level_1 = 380
	heat_level_2 = 420
	heat_level_3 = 1020
	heat_discomfort_level = 335

/decl/bodytype/human/anthrope/feline
	name = "feminine"
	uid = "bodytype_anthrope_feline_fem"
	default_sprite_accessories = list(
		SAC_EARS = list(/decl/sprite_accessory/ears/anthrope/feline = list()),
		SAC_TAIL = list(/decl/sprite_accessory/tail/anthrope/feline = list())
	)

/decl/bodytype/human/anthrope/feline/masculine
	name = "masculine"
	associated_gender = MALE
	icon_base = 'icons/mob/human_races/species/human/body_male.dmi'
	icon_deformed = 'icons/mob/human_races/species/human/deformed_body_male.dmi'
	onmob_state_modifiers = null
	uid = "bodytype_anthrope_feline_masc"

/decl/bodytype/human/anthrope/canid
	name = "feminine"
	uid = "bodytype_anthrope_canid_fem"
	default_sprite_accessories = list(
		SAC_EARS = list(/decl/sprite_accessory/ears/anthrope/canid = list()),
		SAC_TAIL = list(/decl/sprite_accessory/tail/anthrope/canid = list())
	)

/decl/bodytype/human/anthrope/canid/masculine
	name = "masculine"
	associated_gender = MALE
	icon_base = 'icons/mob/human_races/species/human/body_male.dmi'
	icon_deformed = 'icons/mob/human_races/species/human/deformed_body_male.dmi'
	onmob_state_modifiers = null
	uid = "bodytype_anthrope_canid_masc"

/decl/bodytype/human/anthrope/fox
	name = "feminine"
	uid = "bodytype_anthrope_fox_fem"
	default_sprite_accessories = list(
		SAC_EARS = list(/decl/sprite_accessory/ears/anthrope/fox = list()),
		SAC_TAIL = list(/decl/sprite_accessory/tail/anthrope/canid = list())
	)

/decl/bodytype/human/anthrope/fox/masculine
	name = "masculine"
	associated_gender = MALE
	icon_base = 'icons/mob/human_races/species/human/body_male.dmi'
	icon_deformed = 'icons/mob/human_races/species/human/deformed_body_male.dmi'
	onmob_state_modifiers = null
	uid = "bodytype_anthrope_fox_masc"

/decl/bodytype/human/anthrope/admixture
	abstract_type = /decl/bodytype/human/anthrope/admixture
	appearance_flags = 0
	cold_level_1 = 223
	cold_level_2 = 180
	cold_level_3 = 100
	cold_discomfort_level = 265

/decl/bodytype/human/anthrope/admixture/feline_feminine
	name = "feline admixture"
	icon_base = 'mods/species/anthrope/icons/feline_dark_body_female_admix.dmi'
	icon_deformed = 'mods/species/anthrope/icons/feline_dark_body_female_admix.dmi'
	associated_gender = FEMALE
	uid = "bodytype_anthrope_feline_admix_fem"

/decl/bodytype/human/anthrope/admixture/feline_masculine
	name = "feline admixture"
	icon_base = 'mods/species/anthrope/icons/feline_dark_body_male_admix.dmi'
	icon_deformed = 'mods/species/anthrope/icons/feline_dark_body_male_admix.dmi'
	associated_gender = MALE
	uid = "bodytype_anthrope_feline_admix_masc"

/decl/bodytype/human/anthrope/admixture/canid_feminine
	name = "canid admixture"
	icon_base = 'mods/species/anthrope/icons/canid_dark_body_female_admix.dmi'
	icon_deformed = 'mods/species/anthrope/icons/canid_dark_body_female_admix.dmi'
	associated_gender = FEMALE
	uid = "bodytype_anthrope_canid_admix_fem"

/decl/bodytype/human/anthrope/admixture/canid_masculine
	name = "canid admixture"
	icon_base = 'mods/species/anthrope/icons/canid_dark_body_male_admix.dmi'
	icon_deformed = 'mods/species/anthrope/icons/canid_dark_body_male_admix.dmi'
	associated_gender = MALE
	uid = "bodytype_anthrope_canid_admix_masc"
