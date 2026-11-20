/mob/living/human/set_psi_rank(var/faculty, var/rank, var/take_larger, var/defer_update, var/temporary)
	if(rank && istype(species, /decl/species/anthrope))
		return
	return ..()

#ifdef MODPACK_STANDARD_JOBS
/datum/job/standard/counselor/is_species_allowed(var/decl/species/S)
	if(istype(S, /decl/species/anthrope))
		return FALSE
	return ..()

/datum/preferences/CorrectLevel(var/datum/job/job, var/level)
	if(istype(get_species_decl(), /decl/species/anthrope) && istype(job, /datum/job/standard/counselor))
		return FALSE
	return ..()
#endif
