local MessageCtrl = {}
local this = MessageCtrl

local message
local transform
local gameObject
local panel
local text

function MessageCtrl.Init(msg)
	text = msg
	panelMgr:CreatePanel(Panels.Message, this.Awake, this.Start, this.Update, this.Click)
end

function MessageCtrl.Awake(go)
	gameObject = go
	panel = PanelManager.GetPanel(Panels.Message)
	panel:Awake(go)

	--behaviour = gameObject:GetComponent('LuaBehaviour')
	panel.message.text = text
end

--关闭事件--
function MessageCtrl.Close()
	panelMgr:ClosePanel(Ctrls.Message)
end

return MessageCtrl