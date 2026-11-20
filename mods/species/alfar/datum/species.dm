/datum/appearance_descriptor/height/alfar
	chargen_min_index = 1
	chargen_max_index = 3

/decl/species/alfar
	uid = "species_alfar"
	name = "Alfar"
	name_plural = "Alfar"
	description = "Hailing from the planet Ceres, the beguiling and psionically active human derivates known as the Alfar are a tragically shortlived, but communal and upbeat species from the Albia system. Their forms bear distinctive pointed ears and softly pink tinted skin, alongside relatively diminutive figures. Their people come from a land utterly enclosed from its furious star by a gigantic living tree network that calls itself by the nominal name of the planet as a curated, organic artificial intelligence that protects them from the searing light of their white sun, and turns the solar scorch into energy. Their capabilities of psionic contact are often used to prove intent in instances of conflict; A value that makes them occasionally prone to oversharing."
	hidden_from_codex = FALSE
	spawn_flags = SPECIES_CAN_JOIN
	brute_mod = 1.1
	burn_mod = 1.1
	toxins_mod = 1.1
	oxy_mod = 1.1
	available_bodytypes = list(
		/decl/bodytype/human/alfar,
		/decl/bodytype/human/alfar/masculine
	)
	preview_outfit = /decl/outfit/job/generic/assistant
	available_accessory_categories = list(
		SAC_HAIR)
/decl/species/alfar/handle_post_species_pref_set(datum/preferences/pref)
	. = ..()
	if(!islist(pref.sprite_accessories))
		pref.sprite_accessories = list()
	if(!islist(pref.sprite_accessories[SAC_EARS]))
		pref.sprite_accessories[SAC_EARS] = list()

	var/list/ear_accessories = pref.sprite_accessories[SAC_EARS]
	var/decl/sprite_accessory/selected_ear
	for(var/ear_type in ear_accessories)
		if(ear_type in list(
			/decl/sprite_accessory/ears/alfar/pointed,
			/decl/sprite_accessory/ears/alfar/pointed_long,
			/decl/sprite_accessory/ears/alfar/pointed_long_down,
			/decl/sprite_accessory/ears/alfar/pointed_longest
		))
			selected_ear = GET_DECL(ear_type)
			break

	ear_accessories.Cut()
	if(!selected_ear)
		selected_ear = GET_DECL(/decl/sprite_accessory/ears/alfar/pointed)
	ear_accessories[selected_ear.type] = selected_ear.get_default_accessory_metadata()

/decl/species/anthrope/Initialize()
	allow_specific_sprite_accessories = list()
	var/list/hair_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/hair)c
	for(var/hair_style in hair_styles)
		var/decl/sprite_accessory/hair/hair_accessory = hair_styles[hair_style]
		if(hair_accessory?.species_allowed && (/decl/species/human::uid in hair_accessory.species_allowed))
			allow_specific_sprite_accessories += hair_style
	return ..()
