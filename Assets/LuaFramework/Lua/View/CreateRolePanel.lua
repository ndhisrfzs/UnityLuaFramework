local transform
local gameObject

local CreateRolePanel = {}

--启动事件--
function CreateRolePanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
	logWarn("Awake lua--->>"..gameObject.name)
end

--初始化面板--
function CreateRolePanel:InitPanel()
	self.roleName = transform:FindChild("Form/RoleName"):GetComponent("InputField")
	self.randName = transform:FindChild("Form/RandBtn").gameObject
	self.btnSex1 = transform:FindChild("n1Btn"):GetComponent("Button")
	self.btnSex2 = transform:FindChild("n2Btn"):GetComponent("Button")
	self.btnLogin = transform:FindChild("BtnLogin").gameObject
end

--单击事件--
function CreateRolePanel.OnDestroy()
	logWarn("OnDestroy---->>>")
end

return CreateRolePanel