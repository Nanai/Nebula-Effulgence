#ifndef MODPACK_ANTHROPE_SPECIES
#define MODPACK_ANTHROPE_SPECIES
#endif

#include "datum\species_bodytypes.dm"
#include "datum\sprite_accessories.dm"
#include "datum\species.dm"
#include "datum\character_setup.dm"
#include "verbs\shape_change.dm"

/decl/modpack/anthrope
	name = "Anthrope Species"

/decl/modpack/anthrope/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= /decl/species/anthrope::uid