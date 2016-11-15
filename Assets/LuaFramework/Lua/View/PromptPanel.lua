local transform
local gameObject

local PromptPanel = {}

--启动事件--
function PromptPanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
	logWarn("Awake lua--->>"..gameObject.name)
end

--初始化面板--
function PromptPanel:InitPanel()
	self.btnOpen = transform:FindChild("Open").gameObject
	self.gridParent = transform:FindChild('ScrollView/Grid')
end

--单击事件--
function PromptPanel.OnDestroy()
	logWarn("OnDestroy---->>>")
end

return PromptPanel