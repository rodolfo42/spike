require.config 
    baseUrl: 'js'
    optimize: 'uglify'
    out: 'js/min/app.js'

require 'autofocus', 'validation', (autofocus, validation) ->
	if(autofocus && validation)
		alert('ae!')