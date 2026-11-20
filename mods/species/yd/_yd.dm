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

	var/obj/machinery/cryopod/pod = loc
	if(istype(pod) && pod.occupant == src)
		pod.go_out()

	var/datum/mind/yd_mind = mind
	yd_mind.transfer_to(yd_borer)

/mob/living/simple_animal/borer
	var/yd_possessed = FALSE

/mob/living/simple_animal/borer/Login()
	. = ..()
	if(mind && !neutered && !yd_possessed)
		var/decl/special_role/borer/borers = GET_DECL(/decl/special_role/borer)
		borers.add_antagonist(mind)