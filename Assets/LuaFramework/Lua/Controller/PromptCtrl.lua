local event = {}

local PromptCtrl = {}
local this = PromptCtrl

local panel
local prompt
local transform
local gameObject
local PromptPanel

function PromptCtrl.Awake()
	message.handler(event)
	panelMgr:CreatePanel(Panels.Prompt, this.OnCreate)
end

--启动事件--
function PromptCtrl.OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	PromptPanel = PanelManager.GetPanel(Panels.Prompt)

	panel = transform:GetComponent('UIPanel')
	prompt = transform:GetComponent('LuaBehaviour')

	prompt:AddButtonClick(PromptPanel.btnOpen, this.OnClick)
	resMgr:LoadPrefab('prompt', { 'PromptItem' }, this.InitPanel)
end

--初始化面板--
function PromptCtrl.InitPanel(objs)
	local count = 100
	local parent = PromptPanel.gridParent
	for i = 1, count do
		local go = newObject(objs[0])
		go.name = 'Item'..tostring(i)
		go.transform:SetParent(parent)
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero
        prompt:AddButtonClick(go, this.OnItemClick)

	    local label = go.transform:FindChild('Text')
	    label:GetComponent('Text').text = tostring(i)
	end
end

--滚动项单击--
function PromptCtrl.OnItemClick(go)
    log(go.name)
end

--单击事件--
function PromptCtrl.OnClick(go)
    message.request("set", { what = "hello", value = "world" })
end

function event.handshake(_, resp)
	CtrlManager.ShowPanel(Ctrls.Message)
end

--关闭事件--
function PromptCtrl.Close()
	panelMgr:ClosePanel(Ctrls.Prompt)
end

return PromptCtrl