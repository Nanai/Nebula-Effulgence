/decl/modpack/yd
	name = "Yddish Species"

/decl/modpack/yd/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/human/yd::uid

/mob/living/human
	var/yd_borer_attached = FALSE
	var/yd_borer_setup_pending = FALSE

/mob/living/human/Login()
	. = ..()
	if(yd_borer_attached || yd_borer_setup_pending || !mind || !istype(species, /decl/species/human/yd))
		return
	yd_borer_setup_pending = TRUE
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/human, setup_yd_borer_possession)), 1)

/mob/living/human/proc/setup_yd_borer_possession()
	if(QDELETED(src))
		return
	yd_borer_setup_pending = FALSE
	if(yd_borer_attached || !client || !mind || !istype(species, /decl/species/human/yd))
		return
	var/obj/item/organ/external/head = GET_EXTERNAL_ORGAN(src, BP_HEAD)
	if(!head)
		to_chat(src, SPAN_WARNING("Your Yd Carrier body is missing a head organ, so you cannot enter your borer body. An administrator has been notified."))
		message_admins("Yd Carrier [key_name(src)] spawned without a head organ; cortical borer creation was skipped.")
		return
	var/mob/living/simple_animal/borer/yd_borer = has_brain_worms()
	if(!yd_borer)
		yd_borer = new /mob/living/simple_animal/borer/roundstart
	yd_borer_attached = TRUE
	yd_borer.yd_possessed = TRUE
	yd_borer.host = src
	LAZYDISTINCTADD(head.implants, yd_borer)
	yd_borer.forceMove(head)
	if(!yd_borer.host_brain)
		yd_borer.host_brain = new(yd_borer)
	yd_borer.host_brain.SetName(real_name)
	yd_borer.host_brain.real_name = real_name

	var/datum/mind/yd_mind = mind
	yd_mind.transfer_to(yd_borer)

/mob/living/simple_animal/borer
	var/yd_possessed = FALSE

/mob/living/simple_animal/borer/Login()
	. = ..()
	if(mind && !neutered)
		var/decl/special_role/borer/borers = GET_DECL(/decl/special_role/borer)
		borers.add_antagonist(mind, do_not_equip = yd_possessed)

/decl/special_role/borer/create_objectives(var/datum/mind/player)
	var/mob/living/simple_animal/borer/borer = player.current
	if(istype(borer) && borer.yd_possessed)
		return TRUE
	if(!..())
		return
	player.objectives += new /datum/objective/borer_survive()
	player.objectives += new /datum/objective/borer_reproduce()
	player.objectives += new /datum/objective/escape()