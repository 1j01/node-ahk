
# node-ahk

This project aims to use [IronAHK][] in [Node.js][] via [Edge.js][]
with the benefit of all the existing modules on [npm][].

There's a project that's further ahead in development called [RobotJS][].

The API would be fun, with clever usage of concatenation and optional globals:

```js
on(Ctrl+Alt+C, ()=>
    oldClipboard = getClipBoard();
    send(Ctrl+C);
    newClipboard = getClipBoard();
    setClipBoard(oldClipboard);
    send(Ctrl+V);
    setClipBoard(newClipboard);
);
```

All the keyboard constants would be strings with control characters at the start and end, to differenciate between e.g. `Ctrl+Esc` and `"Ctrl+Esc"``.
That would mean you wouldn't accidently send commands when you wanted to send text, but sending arbitrary user input would still be dangerous.
(So maybe that's not the best design decision anyways.)

I'm also thinking there could be "AutoHotQuery" (`ahq`)
with a semi-jQuery-like API for selecting and operating on windows.
(`$(/wow, no SetTitleMatchMode! amazing!/i, optional callback)`)

With Edge.js, everything can be [syncronous or asyncronous][sync vs async].

The creator of IronAHK did try to make it modular
(and let's face it, it could be infinitely worse)
but they did let paradigms like `ErrorLevel` and other global state
seep into the core.
IronAHK would need to be refactored or much more easily cannibalized in order to implement much of the functionality.
I only got a few functions more or less working
without modifying IronAHK.

At any rate, this project is not being actively worked on,
so definitely check out [RobotJS][].


[IronAHK]: https://github.com/polyethene/IronAHK
[Node.js]: https://nodejs.org/
[Edge.js]: http://tjanczuk.github.io/edge/
[sync vs async]: http://tjanczuk.github.io/edge/#/27
[npm]: https://www.npmjs.com/
[RobotJS]: https://github.com/octalmage/robotjs
