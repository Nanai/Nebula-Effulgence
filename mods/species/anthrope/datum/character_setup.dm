/datum/category_item/player_setup_item/background/anthrope_type
	name = "Anthrope Type"
	sort_order = 2

/datum/category_item/player_setup_item/background/anthrope_type/preload_character(datum/pref_record_reader/R)
	var/loaded_type = R.read("anthrope_type")
	pref.anthrope_type = loaded_type || initial(pref.anthrope_type)

/datum/category_item/player_setup_item/background/anthrope_type/save_character(datum/pref_record_writer/writer)
	writer.write("anthrope_type", pref.anthrope_type)

/datum/category_item/player_setup_item/background/anthrope_type/content(var/mob/user)
	var/decl/species/anthrope/species = pref.get_species_decl()
	if(!istype(species))
		return

	. = list("<b>Anthrope Type:</b> ")
	for(var/anthrope_type in list("feline", "canid", "fox"))
		var/type_name = capitalize(anthrope_type)
		if(pref.anthrope_type == anthrope_type)
			. += "<span class='linkOn'>[type_name]</span> "
		else
			. += "<a href='byond://?src=\ref[src];anthrope_type=[anthrope_type]'>[type_name]</a> "
	. = jointext(., null)

/datum/category_item/player_setup_item/background/anthrope_type/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(!href_list["anthrope_type"] || !CanUseTopic(user))
		return TOPIC_NOACTION

	var/decl/species/anthrope/species = pref.get_species_decl()
	var/anthrope_type = href_list["anthrope_type"]
	if(!istype(species) || !(anthrope_type in list("feline", "canid", "fox")))
		return TOPIC_NOACTION

	var/decl/bodytype/human/anthrope/new_bodytype = species.get_anthrope_bodytype(anthrope_type, pref.gender)
	if(!istype(new_bodytype))
		return TOPIC_NOACTION

	pref.anthrope_type = anthrope_type
	pref.set_bodytype(new_bodytype.name)
	return TOPIC_REFRESH_UPDATE_PREVIEW

/datum/category_item/player_setup_item/background/anthrope_type/sanitize_character()
	var/decl/species/mob_species = pref.get_species_decl()
	var/legacy_type
	switch(mob_species.uid)
		if("species_anthrope_feline")
			legacy_type = "feline"
		if("species_anthrope_canid")
			legacy_type = "canid"
		if("species_anthrope_fox")
			legacy_type = "fox"

	if(legacy_type)
		pref.anthrope_type = legacy_type
		pref.species = /decl/species/anthrope::uid
		mob_species = pref.get_species_decl()

	var/decl/species/anthrope/species = mob_species
	if(!istype(species))
		return

	if(!(pref.anthrope_type in list("feline", "canid", "fox")))
		pref.anthrope_type = "feline"
	var/decl/bodytype/human/anthrope/expected_bodytype = species.get_anthrope_bodytype(pref.anthrope_type, pref.gender)
	if(istype(expected_bodytype))
		pref.bodytype = expected_bodytype.name
		expected_bodytype.handle_post_bodytype_pref_set(pref)
