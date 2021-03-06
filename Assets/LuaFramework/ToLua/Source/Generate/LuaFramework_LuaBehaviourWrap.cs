﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_LuaBehaviourWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.LuaBehaviour), typeof(View));
		L.RegFunction("AddButtonClick", AddButtonClick);
		L.RegFunction("RemoveButtonClick", RemoveButtonClick);
		L.RegFunction("ClearButtonClick", ClearButtonClick);
		L.RegFunction("AddToggleClick", AddToggleClick);
		L.RegFunction("RemoveToggleClick", RemoveToggleClick);
		L.RegFunction("ClearToggleClick", ClearToggleClick);
		L.RegFunction("AddInputChange", AddInputChange);
		L.RegFunction("RemoveInputChange", RemoveInputChange);
		L.RegFunction("ClearInputChange", ClearInputChange);
		L.RegFunction("AddInputEndEdit", AddInputEndEdit);
		L.RegFunction("RemoveInputEndEdit", RemoveInputEndEdit);
		L.RegFunction("ClearInputEndEdit", ClearInputEndEdit);
		L.RegFunction("AddSliderChange", AddSliderChange);
		L.RegFunction("RemoveSliderChange", RemoveSliderChange);
		L.RegFunction("ClearSliderChange", ClearSliderChange);
		L.RegFunction("AddScrollbarChange", AddScrollbarChange);
		L.RegFunction("RemoveScrollbarChange", RemoveScrollbarChange);
		L.RegFunction("ClearScrollbarChange", ClearScrollbarChange);
		L.RegFunction("AddDropdownChange", AddDropdownChange);
		L.RegFunction("RemoveDropdownChange", RemoveDropdownChange);
		L.RegFunction("ClearDropdownChange", ClearDropdownChange);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("onStart", get_onStart, set_onStart);
		L.RegVar("onUpdate", get_onUpdate, set_onUpdate);
		L.RegVar("onClick", get_onClick, set_onClick);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddButtonClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddButtonClick(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveButtonClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveButtonClick(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearButtonClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearButtonClick();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddToggleClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddToggleClick(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveToggleClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveToggleClick(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearToggleClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearToggleClick();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddInputChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddInputChange(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveInputChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveInputChange(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearInputChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearInputChange();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddInputEndEdit(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddInputEndEdit(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveInputEndEdit(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveInputEndEdit(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearInputEndEdit(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearInputEndEdit();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddSliderChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddSliderChange(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveSliderChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveSliderChange(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearSliderChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearSliderChange();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddScrollbarChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddScrollbarChange(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveScrollbarChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveScrollbarChange(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearScrollbarChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearScrollbarChange();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int AddDropdownChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 3);
			obj.AddDropdownChange(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RemoveDropdownChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			UnityEngine.GameObject arg0 = (UnityEngine.GameObject)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.GameObject));
			obj.RemoveDropdownChange(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearDropdownChange(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject(L, 1, typeof(LuaFramework.LuaBehaviour));
			obj.ClearDropdownChange();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_onStart(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaInterface.LuaFunction ret = obj.onStart;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onStart on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_onUpdate(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaInterface.LuaFunction ret = obj.onUpdate;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onUpdate on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_onClick(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaInterface.LuaFunction ret = obj.onClick;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onClick on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_onStart(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.onStart = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onStart on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_onUpdate(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.onUpdate = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onUpdate on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_onClick(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.onClick = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index onClick on a nil value" : e.Message);
		}
	}
}

