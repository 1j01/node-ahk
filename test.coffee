
edge = require 'edge'

F = (methodName)->
	source = 'NodeAHK.cs'
	references = ['IronAHK/Rusty/bin/Debug/IronAHK.Rusty.dll']
	edge.func {source, methodName, references}
		
GetMousePosition = F 'GetMousePosition'
AddHotkey = F 'AddHotkey'
SendInput = F 'SendInput'
MouseClickDrag = F 'MouseClickDrag'

do TestGetMousePosition = ->
	setInterval ->
		GetMousePosition '!!!', (err, res)->
			if err
				console.error err
			else
				console.log res
				SendInput "(#{res.x}, #{res.y})\n"
				# SendInput "#{res}\n"
				#SendInput "{left}{up 2}{right}{down 2}hjkhjkhjkhjk"
	, 100

TestAddHotkey = ->
	callback = (data, useless_callback_callback)->
		console.log 'Hotkey callback!!!!', data, useless_callback_callback
		useless_callback_callback null, 42
	
	AddHotkey {hotkey: "^S", callback}, (err, res)->
		console.log '(AddHotkey callback)', err, res
	
	process.stdin.resume()

TestMouseClickDrag = ->
	Drag = (x1, y1, x2, y2)->
		MouseClickDrag {button: "left", x1, y1, x2, y2}, (err, res)->
			if err
				console.error err
			else
				console.log res

console.log "Hello..."
