local event = {}

MainSceneCtrl = {}
local this = MainSceneCtrl

local gameObject
local transform
local behaviour
local panel

function MainSceneCtrl.Awake()
	message.handler(event)
	panelMgr:CreatePanel(Panels.MainScene, this.OnCreate)
end

function MainSceneCtrl.Start()
end

function MainSceneCtrl.Update()
end

--启动事件--
function MainSceneCtrl.OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	panel = PanelManager.GetPanel(Panels.MainScene)

	behaviour = transform:GetComponent('LuaBehaviour')

	behaviour:AddButtonClick(panel.btnWar, this.BtnWar)
end

function MainSceneCtrl.BtnWar(go)
	message.request("matching")
end

function event.matching(_, resp)
	if resp.ok then
		destroy(gameObject)
		CtrlManager.ShowPanel(Ctrls.War)
	end
end

--关闭事件--
function MainSceneCtrl.Close()
	panelMgr:ClosePanel(Panels.MainScene)
end

return MainSceneCtrl