/decl/modpack/yd
	name = "Yddish Species"

/decl/modpack/yd/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/human/yd::uid

/mob/living/human
	var/yd_borer_attached = FALSE

/mob/living/human/Login()
	. = ..()
	if(yd_borer_attached || !mind || !istype(species, /decl/species/human/yd))
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
	yd_borer.host = src
	LAZYDISTINCTADD(head.implants, yd_borer)
	yd_borer.forceMove(head)
	if(!yd_borer.host_brain)
		yd_borer.host_brain = new(yd_borer)
	yd_borer.host_brain.SetName(real_name)
	yd_borer.host_brain.real_name = real_name

	var/datum/mind/yd_mind = mind
	yd_mind.transfer_to(yd_borer)