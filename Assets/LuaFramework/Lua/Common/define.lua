message = require "Common/message"
PanelManager = require "Logic/PanelManager"
CtrlManager = require "Logic/CtrlManager"

Ctrls = {}
Panels = {}

Util = LuaFramework.Util
AppConst = LuaFramework.AppConst
LuaHelper = LuaFramework.LuaHelper
ByteBuffer = LuaFramework.ByteBuffer

panelMgr = LuaHelper.GetPanelManager()
soundMgr = LuaHelper.GetSoundManager()
networkMgr = LuaHelper.GetNetManager()
resMgr = LuaHelper.GetResManager()

WWW = UnityEngine.WWW
GameObject = UnityEngine.GameObject

UserData = {}