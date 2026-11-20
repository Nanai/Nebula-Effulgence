/datum/map/tradeship
	name = "Tradeship"
	full_name = "Global Assembly Vessel Lamplighter"
	path = "tradeship"
	ground_noun = "deck"

	station_name  = "GAV Lamplighter"
	station_short = "Lamplighter"

	dock_name     = "FTS Harbor"
	boss_name     = "Global Assembly Stellar Commission"
	boss_short    = "Merchant Admiral"
	company_name  = "Global Assembly"
	company_short = "GA"
	lobby_screens = list('maps/tradeship/lobby/bloodmoney.png','maps/tradeship/lobby/vapormoney.png')
	overmap_ids = list(OVERMAP_ID_SPACE)
	num_exoplanets = 1
	welcome_sound = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%."
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."
	default_telecomms_channels = list(COMMON_FREQUENCY_DATA)

/datum/map/tradeship/get_map_info()
	return "You're aboard the <b>[station_name],</b> a cheap and efficient survey vehicle obtained. \
	by the Gaian Global Assembly. Do your best to explore space with a substandard vehicle."
