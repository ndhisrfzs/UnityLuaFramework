local transform
local gameObject

local LoginPanel = {}

--启动事件--
function LoginPanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
	logWarn("Awake lua--->>"..gameObject.name)
end

--初始化面板--
function LoginPanel:InitPanel()
	self.loginPanel = transform:FindChild("Login").gameObject
	self.btnLogin = transform:FindChild("BtnLogin").gameObject
	self.login_userName = transform:FindChild("Login/UserName"):GetComponent("InputField")
	self.login_password = transform:FindChild("Login/Password"):GetComponent("InputField")
	self.login_btnRegister = transform:FindChild("Login/BtnRegister").gameObject
	self.login_btnModify = transform:FindChild("Login/BtnModify").gameObject

	self.registerPanel = transform:FindChild("Register").gameObject
	self.register_userName = transform:FindChild("Register/UserName"):GetComponent("InputField")
	self.register_password = transform:FindChild("Register/Password"):GetComponent("InputField")
	self.register_repeatpassword = transform:FindChild("Register/RepeatPassword"):GetComponent("InputField")
	self.register_btnRegister = transform:FindChild("Register/BtnRegister").gameObject
	self.register_btnCancel = transform:FindChild("Register/BtnCancel").gameObject

	self.modifyPanel = transform:FindChild("Modify").gameObject
	self.modify_userName = transform:FindChild("Modify/UserName"):GetComponent("InputField")
	self.modify_password = transform:FindChild("Modify/Password"):GetComponent("InputField")
	self.modify_newpassword = transform:FindChild("Modify/NewPassword"):GetComponent("InputField")
	self.modify_btnOk = transform:FindChild("Modify/BtnOk").gameObject
	self.modify_btnCancel = transform:FindChild("Modify/BtnCancel").gameObject
end

--单击事件--
function LoginPanel.OnDestroy()
	logWarn("OnDestroy---->>>")
end

return LoginPanel