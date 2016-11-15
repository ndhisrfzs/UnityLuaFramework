local transform
local gameObject

local MessagePanel = {}

--启动事件--
function MessagePanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
end

--初始化面板--
function MessagePanel:InitPanel()
	self.message = transform:FindChild('Text'):GetComponent('Text')
end

--单击事件--
function MessagePanel.OnDestroy()
	logWarn("OnDestroy---->>>")
end

return MessagePanel