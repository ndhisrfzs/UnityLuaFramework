local event = {}

local MainSceneCtrl = {}
local this = MainSceneCtrl

local gameObject
local transform
local behaviour
local panel
local load = false

function MainSceneCtrl.Load()
	load = true
	panelMgr:CreatePanel(Panels.MainScene, this.Awake, this.Start, this.Update, this.Click)
end

function MainSceneCtrl.Init()
	message.handler(event)
	if prestrain == false then
		this.Load()
		--panelMgr:CreatePanel(Panels.MainScene, this.Awake, this.Start, this.Update, this.Click)
	else
		load = false
		gameObject:SetActive(true)
	end
end

function MainSceneCtrl.Awake(go)
	if load then
		go:SetActive(false)
	end
	gameObject = go
	transform = go.transform
	panel = PanelManager.GetPanel(Panels.MainScene)
	panel:Awake(go)

	behaviour = transform:GetComponent('LuaBehaviour')

	behaviour:AddButtonClick(panel.btnWar, this.BtnWar)
end

function MainSceneCtrl.BtnWar(go)
	this.Close()
	AppFacade.Instance:SendMessageCommand(NotiConst.SET_ACTIVE, true)
	AppFacade.Instance:SendMessageCommand(NotiConst.UPDATE_MESSAGE, "匹配对手中...")
	AppFacade.Instance:SendMessageCommand(NotiConst.SET_PROGRESS_MAX, 5)
	message.request("matching")
end

function event.matching(_, resp)
	if resp.ok then
		message.request("ping")
		CtrlManager.ShowPanel(Ctrls.War, {username=UserData.rolename, sex=UserData.sex}, {username=resp.rolename, sex=resp.sex})
	end
end

--关闭事件--
function MainSceneCtrl.Close()
	panelMgr:ClosePanel(Panels.MainScene)
end

return MainSceneCtrl