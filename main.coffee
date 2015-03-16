
edge = require 'edge'

source = 'NodeAHK.cs'
references = ['IronAHK/Rusty/bin/Debug/IronAHK.Rusty.dll']

for methodName in [
	'GetMousePosition'
	'AddHotkey'
	'SendInput'
	'MouseClickDrag'
]
	module.exports[methodName] = edge.func {source, methodName, references}
