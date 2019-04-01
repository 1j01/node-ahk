using System;
using System.Reflection;
#r "System.Windows.Forms.dll"
using System.Windows.Forms;
using System.Threading.Tasks;
using Core = IronAHK.Rusty.Core;
using Common = IronAHK.Rusty.Common;

public class Startup
{
	public async Task<object> GetMousePosition(object input)
	{
		int x, y;
		long win;
		string control;
		int mode = 0;
		Core.MouseGetPos(out x, out y, out win, out control, mode);
		return new { x = x, y = y };
	}
	
	public async Task<object> MouseClickDrag(dynamic input)
	{
		Core.MouseClickDrag(input.button, input.x1, input.y1, input.x2, input.y2, input.duration);
		return 0;
	}
	
	public async Task<object> AddHotkey(dynamic input)
	{
		Func<object, Task<object>> callback = input.callback;
		string sequence = input.hotkey;
		Core.GenericFunction proc = (object[] args) => callback(new {foo="bar"});
		// var hkdef = Common.Keyboard.HotkeyDefinition.Parse(sequence);
		// Core.InitKeyboardHook();
		// Common.Keyboard.KeyboardHook.Add(hkdef);
		return 0;
	}
	
	public async Task<object> SendInput(object input)
	{
		Core.Send(input.ToString());
		return 0;
	}
}

static class Random
{
	public static int GetRandomNumber() 
	{
		return 4; // chosen by fair dice roll.
		          // guaranteed to be random.
	}
}
