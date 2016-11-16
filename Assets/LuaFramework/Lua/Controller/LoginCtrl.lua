local event = {}
local LoginCtrl = {}
local this = LoginCtrl

local login
local transform
local gameObject
local LoginPanel

function LoginCtrl.Awake()
	message.handler(event)
	panelMgr:CreatePanel(Panels.Login, this.OnCreate)
end

--启动事件--
function LoginCtrl.OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	LoginPanel = PanelManager.GetPanel(Panels.Login)

	login = transform:GetComponent('LuaBehaviour')
	login:AddButtonClick(LoginPanel.btnLogin, this.BtnLogin)
	login:AddButtonClick(LoginPanel.login_btnRegister, this.LoginBtnRegister)
	login:AddButtonClick(LoginPanel.login_btnModify, this.LoginBtnModify)
	login:AddButtonClick(LoginPanel.modify_btnCancel, this.ModifyBtnCancel)
	login:AddButtonClick(LoginPanel.register_btnRegister, this.RegisterAccount)
	login:AddButtonClick(LoginPanel.register_btnCancel, this.RegisterBtnCancel)
	--login:AddToggleClick(LoginPanel.remberme, this.OnRember)
	--login:AddInputChange(LoginPanel.userName.gameObject, this.OnChange)
	--login:AddInputEndEdit(LoginPanel.userName.gameObject, this.OnChangeEnd)
	--login:AddSliderChange(LoginPanel.slider, this.OnSliderChange)
	--login:AddScrollbarChange(LoginPanel.scrollbar, this.OnScrollbarChange)
end

--单击事件--
function LoginCtrl.BtnLogin(go)
	message.request("login", { username=LoginPanel.login_userName.text, password=LoginPanel.login_password.text })
end

function LoginCtrl.LoginBtnRegister(go)
	LoginPanel.loginPanel:SetActive(false)
	LoginPanel.registerPanel:SetActive(true)
end

function LoginCtrl.LoginBtnModify(go)
	LoginPanel.loginPanel:SetActive(false)
	LoginPanel.modifyPanel:SetActive(true)
end

function LoginCtrl.ModifyBtnCancel(go)
	LoginPanel.loginPanel:SetActive(true)
	LoginPanel.modifyPanel:SetActive(false)
end

function LoginCtrl.RegisterAccount(go)
	message.request("register", { username=LoginPanel.register_userName.text, password=LoginPanel.register_password.text })
end

function LoginCtrl.RegisterBtnCancel(go)
	LoginPanel.loginPanel:SetActive(true)
	LoginPanel.registerPanel:SetActive(false)
end

function event.login(req, resp)
	if resp.ok then
		UserData.username = req.username
		UserData.password = req.password
		message.request("ping")
		message.request("rolelogin")
	else
		showmessage("帐号或密码错误")
	end
end

function event.rolelogin(_, resp)
	destroy(gameObject)
	if resp.ok then
		UserData.uid = resp.uid
		UserData.sex = resp.sex
		UserData.rolename = resp.rolename
		CtrlManager.ShowPanel(Ctrls.MainScene)
	else
		CtrlManager.ShowPanel(Ctrls.CreateRole)
	end
end

function event.register(_, resp)
	if resp.ok then
		LoginPanel.login_userName.text = LoginPanel.register_userName.text
		LoginPanel.login_password.text = LoginPanel.register_password.text
		LoginCtrl.RegisterBtnCancel()
	else
		showmessage("注册帐号失败")
	end
end

--关闭事件--
function LoginCtrl.Close()
	panelMgr:ClosePanel(Ctrls.Login)
end

return LoginCtrl