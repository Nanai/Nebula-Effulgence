/decl/species/anthrope
	name = "Anthrope"
	name_plural = "Anthropes"
	uid = "species_anthrope"
	spawn_flags = SPECIES_CAN_JOIN
	inherent_verbs = list(/mob/living/human/proc/change_anthrope_form)
	available_bodytypes = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine,
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine,
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
	default_bodytype = /decl/bodytype/human/anthrope/feline

/decl/species/anthrope/get_brute_mod(var/mob/living/human/H)
	. = ..()
	if(H && !H.get_anthrope_admix_bodytype())
		. *= 0.9

/decl/species/anthrope/get_burn_mod(var/mob/living/human/H)
	. = ..()
	if(H?.get_anthrope_admix_bodytype())
		. *= 0.9

/decl/species/anthrope/proc/get_anthrope_bodytype(anthrope_type, gender)
	var/target_gender = (gender == MALE) ? MALE : FEMALE
	for(var/decl/bodytype/human/anthrope/bodytype in available_bodytypes)
		if(bodytype.anthrope_variant == anthrope_type && bodytype.associated_gender == target_gender)
			return bodytype

/decl/species/anthrope/handle_post_species_pref_set(datum/preferences/pref)
	. = ..()
	if(!(pref.anthrope_type in list("feline", "canid", "fox")))
		pref.anthrope_type = "feline"
	var/decl/bodytype/human/anthrope/selected_bodytype = get_anthrope_bodytype(pref.anthrope_type, pref.gender)
	if(selected_bodytype)
		pref.bodytype = selected_bodytype.name

/mob/living/human/proc/get_anthrope_admix_bodytype() as /decl/bodytype
	if(!istype(species, /decl/species/anthrope))
		return
	for(var/obj/item/organ/external/limb in get_external_organs())
		var/decl/bodytype/appearance_bodytype = limb.get_organ_appearance_bodytype()
		if(istype(appearance_bodytype, /decl/bodytype/human/anthrope/admixture))
			return appearance_bodytype

/mob/living/human/get_mob_temperature_threshold(threshold, bodypart)
	if(istype(species, /decl/species/anthrope))
		var/decl/bodytype/appearance_bodytype
		if(bodypart)
			var/obj/item/organ/external/organ = get_organ(bodypart)
			appearance_bodytype = organ?.get_organ_appearance_bodytype()
		else
			appearance_bodytype = get_anthrope_admix_bodytype()
		if(istype(appearance_bodytype, /decl/bodytype/human/anthrope/admixture))
			return appearance_bodytype.get_body_temperature_threshold(threshold)
	return ..()

/decl/species/anthrope/legacy/feline
	name = "Feline Anthrope"
	uid = "species_anthrope_feline"
	spawn_flags = SPECIES_IS_RESTRICTED
	hidden_from_codex = TRUE

/decl/species/anthrope/legacy/canid
	name = "Canid Anthrope"
	uid = "species_anthrope_canid"
	spawn_flags = SPECIES_IS_RESTRICTED
	hidden_from_codex = TRUE

/decl/species/anthrope/legacy/fox
	name = "Fox Anthrope"
	uid = "species_anthrope_fox"
	spawn_flags = SPECIES_IS_RESTRICTED
	hidden_from_codex = TRUE
