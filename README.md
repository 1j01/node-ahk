
# node-ahk

This project aims to use [IronAHK][] in [Node.js][] via [Edge.js][]
with the benefit of all the existing modules on [npm][].

There's a project that's further ahead in development called [RobotJS][].

It could have a playful API with clever usage of concatenation and optional globals.

The following example is in [CoffeeScript][], but you could use JavaScript,
[TypeScript, DogeScript, Python, Ruby, etc.][List of languages that compile to JS]

```coffee
on Ctrl+Alt+C, ->
    oldClipboard = getClipboard()
    send Ctrl+C
    newClipboard = getClipboard()
    setClipboard oldClipboard
    send Ctrl+V
    setClipBoard newClipboard
```

All the keyboard constants would be strings
with control characters at the start and end,
to differenciate between e.g. `Ctrl+Esc` and `"Ctrl+Esc"``.
That would mean you wouldn't accidently
send commands when you wanted to send text
(but sending arbitrary user input would still be dangerous).

There could also be "AutoHotQuery" (`ahq`)
with a jQuery-like API for selecting and operating on windows.

```coffee
$(/Google Chrome|Mozilla Firefox|Microsoft Edge/).focus()
.then -> Send Ctrl+T, "google.com", Enter
```

Look, no `SetTitleMatchMode`! Amazing.

That would open a new tab in one browser window.
To open new tabs in each matched window, you could do:

```coffee
$(/Google Chrome|Mozilla Firefox|Microsoft Edge/).send(Ctrl+T, "google.com", Enter)
```

With Edge.js, everything can be [syncronous or asyncronous][sync vs async].

The creator of IronAHK did try to make it modular
(and it could be much worse)
but they still let paradigms like `ErrorLevel` and other global state
seep into the core.
IronAHK would need to be refactored or more likely cannibalized in order to implement much of the functionality.
I only got a few functions more or less working
without modifying IronAHK.

At any rate, this project is not being actively worked on,
so definitely check out [RobotJS][].


[IronAHK]: https://github.com/polyethene/IronAHK
[Node.js]: https://nodejs.org/
[Edge.js]: http://tjanczuk.github.io/edge/
[sync vs async]: http://tjanczuk.github.io/edge/#/27
[npm]: https://www.npmjs.com/
[CoffeeScript]: http://coffeescript.org/
[List of languages that compile to JS]: https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-js
[RobotJS]: https://github.com/octalmage/robotjs
