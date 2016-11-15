local gameObject
local transform

local MainScenePanel = {}

--启动事件--
function MainScenePanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
end

--初始化面板--
function MainScenePanel:InitPanel()
	self.btnWar = transform:FindChild("War").gameObject
end

--单击事件--
function MainScenePanel.OnDestroy()
	--logWarn("OnDestroy---->>>")
end

return MainScenePanel