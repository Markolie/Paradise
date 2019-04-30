/datum/nano_module/input
	name = "Input"

	var/title
	var/description

	var/list/items
	var/list/nanoui_items

	var/picked

/datum/nano_module/input/New(input_title, input_description, list/input_items)
	title = input_title
	description = input_description
	items = input_items

	for(var/item in items)
		if(isatom(item))
			var/atom/A = item
			nanoui_items += A.name
		else
			var/datum/D = item
			nanoui_items += D.type

/datum/nano_module/input/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/topic_state/state = always_state)
	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "input.tmpl", title, 400, 600)
		ui.open()

	return picked

datum/nano_module/input/ui_data(mob/user, ui_key = "main", datum/topic_state/state = always_state)
	var/data[0]
	data["description"] = description
	data["items"] = items

	return data

/datum/nano_module/input/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["choice"])
		picked = items[href_list["choice"]]