jQuery ->

# Delete a comment
$(document)
	.on "ajax:beforeSend", ".gallery", ->
		$(this).fadeTo('slow', 0.5)
	.on "ajax:success", ".gallery", ->
		$(this).hide('slow')
	.on "ajax:error", ".gallery", ->
		$(this).fadeTo('fast', 1)