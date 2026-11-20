/decl/modpack/anthrope
	name = "Anthrope Species"

/decl/modpack/anthrope/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/anthrope::uid