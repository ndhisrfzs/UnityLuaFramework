local MessageCtrl = {}
local this = MessageCtrl

local message
local transform
local gameObject
local MessagePanel

local text
function MessageCtrl.Awake(msg)
	text = msg
	panelMgr:CreatePanel(Panels.Message, this.OnCreate)
end

--启动事件--
function MessageCtrl.OnCreate(obj)
	gameObject = obj
	MessagePanel = PanelManager.GetPanel(Panels.Message)

	--message = gameObject:GetComponent('LuaBehaviour')
	log(text)
	MessagePanel.message.text = text
end

--关闭事件--
function MessageCtrl.Close()
	panelMgr:ClosePanel(Ctrls.Message)
end

return MessageCtrl