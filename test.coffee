
edge = require 'edge'

F = (methodName)->
	source = 'NodeAHK.cs'
	references = ['IronAHK/Rusty/bin/Debug/IronAHK.Rusty.dll']
	edge.func {source, methodName, references}
		
GetMousePosition = F 'GetMousePosition'
AddHotkey = F 'AddHotkey'
SendInput = F 'SendInput'
MouseClickDrag = F 'MouseClickDrag'

TestGetMousePosition = ->
	setInterval ->
		GetMousePosition '!!!', (err, res)->
			throw err if err
			console.log err, res
			#SendInput "GetMousePosition returned #{res} (x: #{res.x}, y: #{res.y})\n"
			#SendInput "{left}{up 2}{right}{down 2}hjkhjkhjkhjk"
	, 100

TestAddHotkey = ->
	callback = (data, useless_callback_callback)->
		console.log 'Hotkey callback!!!!', data, useless_callback_callback
		useless_callback_callback null, 42
	
	AddHotkey {hotkey: "^S", callback}, (err, res)->
		console.log '(AddHotkey callback)', err, res
	
	process.stdin.resume()

do TestMouseClickDrag = ->
	Drag = (x1, y1, x2, y2)->
		MouseClickDrag {button: "left", x1, y1, x2, y2}, (err, res)->
			throw err if err
			console.log err, res

console.log "Hello..."
