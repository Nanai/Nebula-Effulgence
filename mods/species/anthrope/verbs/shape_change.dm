#define ANTHROPE_FORM_SHIFT_NUTRITION_COST 25
#define ANTHROPE_FORM_SHIFT_MIN_NUTRITION_RATIO 0.3

/mob/living/human/proc/get_anthrope_admix_bodytype_for_gender()
	if(!istype(species, /decl/species/anthrope))
		return
	var/decl/bodytype/human/anthrope/root_bodytype = get_bodytype()
	if(!istype(root_bodytype))
		return
	var/decl/bodytype/admixture_feminine = GET_DECL(root_bodytype.admix_bodytype_feminine)
	var/decl/bodytype/admixture_masculine = GET_DECL(root_bodytype.admix_bodytype_masculine)
	if(!istype(admixture_feminine) || !istype(admixture_masculine))
		return
	return (get_gender() == MALE) ? admixture_masculine : admixture_feminine

/mob/living/human/proc/apply_anthrope_form(start_in_admix)
	if(!istype(species, /decl/species/anthrope))
		return FALSE
	var/decl/bodytype/human/anthrope/root_bodytype = get_bodytype()
	if(!istype(root_bodytype))
		return FALSE
	var/decl/bodytype/admixture_feminine = GET_DECL(root_bodytype.admix_bodytype_feminine)
	var/decl/bodytype/admixture_masculine = GET_DECL(root_bodytype.admix_bodytype_masculine)
	if(!istype(admixture_feminine) || !istype(admixture_masculine))
		return FALSE
	var/decl/bodytype/target_bodytype = start_in_admix ? get_anthrope_admix_bodytype_for_gender() : null
	if(start_in_admix && !istype(target_bodytype))
		return FALSE

	var/changed
	for(var/obj/item/organ/external/limb in get_external_organs())
		if(BP_IS_PROSTHETIC(limb))
			continue
		if(limb.appearance_bodytype && limb.appearance_bodytype != admixture_feminine && limb.appearance_bodytype != admixture_masculine)
			continue
		if(limb.set_organ_appearance_bodytype(target_bodytype, skip_owner_update = TRUE))
			changed = TRUE
	if(changed)
		update_body()
	return changed

/mob/living/human/proc/get_anthrope_form_shift_message(form)
	var/decl/pronouns/pronouns = get_pronouns()
	switch(form)
		if("Admix")
			return "[name] grows fur and shifts, [pronouns.his] body transforming into admix form."
		if("Humanoid")
			return "[name] slims and retracts fur, [pronouns.his] body transforming into humanoid form."
		if("Beastial")
			return "[name] rips through clothing and goes quadruped, [pronouns.his] body transforming into beastial form."

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

	var/decl/bodytype/target_admixture = get_anthrope_admix_bodytype_for_gender()
	if(!istype(target_admixture))
		to_chat(src, SPAN_WARNING("Your Admix form is not available right now."))
		return

	var/current_admixture = get_anthrope_admix_bodytype()
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

	if(!apply_anthrope_form(selected_form == "Admix"))
		to_chat(src, SPAN_WARNING("Your shape cannot change right now."))
		return

	adjust_nutrition(-ANTHROPE_FORM_SHIFT_NUTRITION_COST)
	visible_message(SPAN_NOTICE(get_anthrope_form_shift_message(selected_form)))

#undef ANTHROPE_FORM_SHIFT_NUTRITION_COST
#undef ANTHROPE_FORM_SHIFT_MIN_NUTRITION_RATIO
