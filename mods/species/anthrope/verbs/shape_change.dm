#define ANTHROPE_FORM_SHIFT_NUTRITION_COST 25
#define ANTHROPE_FORM_SHIFT_MIN_NUTRITION_RATIO 0.3

/mob/living/human/proc/change_anthrope_form()
	set name = "Change Shape"
	set category = "Abilities"

	if(!istype(species, /decl/species/anthrope))
		return

	var/selected_form = input(src, "Choose your form.", "Change Shape") as null|anything in list("Humanoid", "Admix", "Beastial")
	if(!selected_form || !istype(species, /decl/species/anthrope))
		return

	if(selected_form == "Beastial")
		to_chat(src, SPAN_NOTICE("Coming in a future update!"))
		return

	var/decl/species/anthrope/anthrope_species = species
	var/decl/bodytype/admixture_feminine = GET_DECL(anthrope_species.admix_bodytype_feminine)
	var/decl/bodytype/admixture_masculine = GET_DECL(anthrope_species.admix_bodytype_masculine)
	var/decl/bodytype/target_admixture = (get_gender() == MALE) ? admixture_masculine : admixture_feminine
	if(!istype(admixture_feminine) || !istype(admixture_masculine) || !istype(target_admixture))
		to_chat(src, SPAN_WARNING("Your Admix form is not available right now."))
		return

	var/decl/bodytype/current_admixture
	for(var/obj/item/organ/external/limb in get_external_organs())
		if(limb.appearance_bodytype == admixture_feminine || limb.appearance_bodytype == admixture_masculine)
			current_admixture = limb.appearance_bodytype
			break

	if(selected_form == "Humanoid" && !current_admixture)
		to_chat(src, SPAN_NOTICE("You are already in your Humanoid form."))
		return
	if(selected_form == "Admix" && current_admixture == target_admixture)
		to_chat(src, SPAN_NOTICE("You are already in your Admix form."))
		return

	var/minimum_nutrition = round(get_max_nutrition() * ANTHROPE_FORM_SHIFT_MIN_NUTRITION_RATIO) + ANTHROPE_FORM_SHIFT_NUTRITION_COST
	if(get_nutrition() < minimum_nutrition)
		to_chat(src, SPAN_WARNING("You are too hungry to change forms."))
		return

	var/decl/bodytype/appearance_bodytype = (selected_form == "Admix") ? target_admixture : null
	var/changed
	for(var/obj/item/organ/external/limb in get_external_organs())
		if(BP_IS_PROSTHETIC(limb))
			continue
		if(limb.appearance_bodytype && limb.appearance_bodytype != admixture_feminine && limb.appearance_bodytype != admixture_masculine)
			continue
		if(limb.set_organ_appearance_bodytype(appearance_bodytype, skip_owner_update = TRUE))
			changed = TRUE

	if(!changed)
		to_chat(src, SPAN_WARNING("Your shape cannot change right now."))
		return

	update_body()
	adjust_nutrition(-ANTHROPE_FORM_SHIFT_NUTRITION_COST)
	to_chat(src, SPAN_NOTICE("You shift into your [selected_form] form."))

#undef ANTHROPE_FORM_SHIFT_NUTRITION_COST
#undef ANTHROPE_FORM_SHIFT_MIN_NUTRITION_RATIO
