/datum/appearance_descriptor/age/yd
	name = "age"
	chargen_max_index = 9

	standalone_value_descriptors = list( //vatborns grow quickly and die young
		"an infant" =      1,
		"a toddler" =      2,
		"a child" =        3,
		"a teenager" =    4,
		"a young adult" = 6,
		"an adult" =      20,
		"middle-aged" =   35,
		"aging" =         50,
		"elderly" =       70,
		"ancient" =      91
	)


/decl/species/human/yd
	uid = "species_yd"
	name = "Yd Carrier"
	name_plural = "Yd Carriers"

	available_bodytypes = list(
		/decl/bodytype/human/yd,
		/decl/bodytype/human/yd/masculine,
		/decl/bodytype/prosthetic/basic_human
	)
	default_bodytype = /decl/bodytype/human/yd

	description = "While evidence of human seeding across the galaxy in many forms is visible, the Carriers are an instance of human failure. The symbiotes known as Yd have long transfigured their humanoids into docile hosts and extensions of themselves, with possession of one being originally a mark of leadership among the pods. Modern day Yd are genuinely stunned by galactic life and have had difficulty learning that most sophonts across the galaxy are, in fact, not composed generally of what is essentially a brain in and of itself where a body can be replaced, if at great pain and cost. The Carriers of Yd have slightly greenish skin, and the rise of cloning has made bodies more available, as has Gaian cybernetic technology made capable alternatives in machine form... Though they tend to be either cheap and unreliable, or experimental and cutting edge. Either way, the Yddish form a seat on the GASC that, while precarious, often operates with a deep concern for the long view."

	preview_outfit = /decl/outfit/job/generic/assistant

	toxins_mod = 1.1
	metabolism_mod = 1.15
