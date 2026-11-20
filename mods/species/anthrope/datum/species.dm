/decl/species/anthrope
	name = "Anthrope"
	name_plural = "Anthropes"
	description = "One of three confirmable human derivates across habitable planets, the Anthropes of Terra show their bioengineering most visibly in animalistic traits across their humanoid forms. Redirected neural pathways show a complete psionic redirect to fuel metabolism shifts and inner biokinesis, allowing them to shift between intermediate states of species imprinted on them from ages ago. While fanciful mythological depictions of the rite exist, the actual tools to make new strains of Anthrope are lost to antiquity. While predatory species of anthrope tend to be some of the more upper class and ranking, anthropes come in a diaspora of species that have slowly sublimated between bloodlines or caused fertility issues against breeding. Finding the humans of Gaia through sent out space probes, the various nations and polities of Terra have boldly pressed into space- Where, admittedly, they have found their adaptions less advantageous until the time comes for planetary expeditions. Accordingly, many have sent their best (or most determined) to join GASC efforts."
	uid = "species_anthrope"
	spawn_flags = SPECIES_CAN_JOIN
	inherent_verbs = list(/mob/living/human/proc/change_anthrope_form)
	available_accessory_categories = list(
		SAC_HAIR,
		SAC_FACIAL_HAIR,
		SAC_EARS,
		SAC_TAIL,
		SAC_COSMETICS,
		SAC_MARKINGS
	)
	available_bodytypes = list(
		/decl/bodytype/human/anthrope/feline,
		/decl/bodytype/human/anthrope/feline/masculine,
		/decl/bodytype/human/anthrope/canid,
		/decl/bodytype/human/anthrope/canid/masculine,
		/decl/bodytype/human/anthrope/fox,
		/decl/bodytype/human/anthrope/fox/masculine
	)
	default_bodytype = /decl/bodytype/human/anthrope/feline

/decl/species/anthrope/Initialize()
	allow_specific_sprite_accessories = list()
	var/list/hair_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/hair)c
	for(var/hair_style in hair_styles)
		var/decl/sprite_accessory/hair/hair_accessory = hair_styles[hair_style]
		if(hair_accessory?.species_allowed && (/decl/species/human::uid in hair_accessory.species_allowed))
			allow_specific_sprite_accessories += hair_style
	return ..()

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

/decl/species/anthrope/legacy
	abstract_type = /decl/species/anthrope/legacy

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
