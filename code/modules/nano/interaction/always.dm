/*
	This topic_state always allows interaction with the UI.
*/

/var/global/datum/topic_state/always_state/always_state = new()

/datum/topic_state/always_state/can_use_topic(var/src_object, var/mob/user)
	return STATUS_INTERACTIVE

