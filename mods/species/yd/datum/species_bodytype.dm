/decl/bodytype/human/yd
	name                  = "feminine"
	icon_base             = 'mods/species/yd/icons/body/body_female.dmi'
	limb_icon_intensity   = 0.7
	associated_gender     = FEMALE
	onmob_state_modifiers = list((slot_w_uniform_str) = "f")
	uid                   = "bodytype_yd_fem"
	age_descriptor = /datum/appearance_descriptor/age/yd

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
	)

/decl/bodytype/human/yd/masculine
	name                  = "masculine"
	icon_base             = 'mods/species/yd/icons/body/body_male.dmi'
	icon_deformed         = 'icons/mob/human_races/species/human/deformed_body_male.dmi'
	associated_gender     = MALE
	uid                   = "bodytype_yd_masc"
	age_descriptor = /datum/appearance_descriptor/age/yd
	onmob_state_modifiers = null
	override_emote_sounds = list(
		"cough" = list(
			'sound/voice/emotes/m_cougha.ogg',
			'sound/voice/emotes/m_coughb.ogg',
			'sound/voice/emotes/m_coughc.ogg'
		),
		"sneeze" = list(
			'sound/voice/emotes/m_sneeze.ogg'
		)
	)