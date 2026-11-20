/decl/species/anthrope
	abstract_type = /decl/species/anthrope
	inherent_verbs = list(/mob/living/human/proc/change_anthrope_form)

	var/admix_bodytype_feminine
	var/admix_bodytype_masculine

/decl/species/anthrope/get_brute_mod(var/mob/living/human/H)
	. = ..()
	if(H && !H.get_anthrope_admix_bodytype())
		. *= 0.9

/decl/species/anthrope/get_burn_mod(var/mob/living/human/H)
	. = ..()
	if(H?.get_anthrope_admix_bodytype())
		. *= 0.9

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

/decl/species/anthrope/feline
	name = "Feline Anthrope"
	name_plural = "Feline Anthropes"
	uid = "species_anthrope_feline"
	spawn_flags = SPECIES_CAN_JOIN
	available_bodytypes = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine
	)
	admix_bodytype_feminine = /decl/bodytype/human/anthrope/admixture/feline_feminine
	admix_bodytype_masculine = /decl/bodytype/human/anthrope/admixture/feline_masculine

/decl/species/anthrope/canid
	name = "Canid Anthrope"
	name_plural = "Canid Anthropes"
	uid = "species_anthrope_canid"
	spawn_flags = SPECIES_CAN_JOIN
	available_bodytypes = list(
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine
	)
	admix_bodytype_feminine = /decl/bodytype/human/anthrope/admixture/canid_feminine
	admix_bodytype_masculine = /decl/bodytype/human/anthrope/admixture/canid_masculine

/decl/species/anthrope/fox
	name = "Fox Anthrope"
	name_plural = "Fox Anthropes"
	uid = "species_anthrope_fox"
	spawn_flags = SPECIES_CAN_JOIN
	available_bodytypes = list(
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
	admix_bodytype_feminine = /decl/bodytype/human/anthrope/admixture/canid_feminine
	admix_bodytype_masculine = /decl/bodytype/human/anthrope/admixture/canid_masculine
