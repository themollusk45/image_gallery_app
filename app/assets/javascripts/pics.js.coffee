jQuery ->

# Delete a comment
$(document)
	.on "ajax:beforeSend", ".thumb", ->
		$(this).fadeTo('fast', 0.5)
	.on "ajax:success", ".thumb", ->
		$(this).hide('fast')
	.on "ajax:error", ".thumb", ->
		$(this).fadeTo('fast', 1)