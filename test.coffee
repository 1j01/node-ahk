
{
	GetMousePosition
	AddHotkey
	SendInput
	MouseClickDrag
} =
	require './main'

console.log "Hello..."

TestGetMousePosition = ->
	setInterval ->
		GetMousePosition '!!!', (err, res)->
			if err
				console.error err
			else
				console.log res
	, 100

TestAddHotkey = ->
	callback = (data, useless_callback_callback)->
		console.log 'Hotkey callback!!!!', data, useless_callback_callback
		useless_callback_callback null, 42
	
	AddHotkey {hotkey: "^S", callback}, (err, res)->
		console.log '(Edge.js callback for AddHotkey, i.e. registering the hotkey)', err, res
	
	process.stdin.resume()

do TestMouseClickDrag = ->
	Drag = (x1, y1, x2, y2, {duration, button}={})->
		button ?= "Left"
		MouseClickDrag {button, x1, y1, x2, y2, duration}, (err, res)->
			if err
				console.error err
			else
				console.log res
	
	Drag 500, 500, 600, 900, duration: 200
