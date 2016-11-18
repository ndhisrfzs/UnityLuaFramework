local event = {}
local LoginCtrl = {}
local this = LoginCtrl

local login
local transform
local gameObject
local panel

function LoginCtrl.Init()
	message.handler(event)
	panelMgr:CreatePanel(Panels.Login, this.Awake, this.Start, this.Update, this.Click)
end

function LoginCtrl.Awake(go)
	gameObject = go
	transform = go.transform
	panel = PanelManager.GetPanel(Panels.Login)
	panel:Awake(go)

	login = transform:GetComponent('LuaBehaviour')
	login:AddButtonClick(panel.btnLogin, this.BtnLogin)
	login:AddButtonClick(panel.login_btnRegister, this.LoginBtnRegister)
	login:AddButtonClick(panel.login_btnModify, this.LoginBtnModify)
	login:AddButtonClick(panel.modify_btnCancel, this.ModifyBtnCancel)
	login:AddButtonClick(panel.register_btnRegister, this.RegisterAccount)
	login:AddButtonClick(panel.register_btnCancel, this.RegisterBtnCancel)
	--login:AddToggleClick(panel.remberme, this.OnRember)
	--login:AddInputChange(panel.userName.gameObject, this.OnChange)
	--login:AddInputEndEdit(panel.userName.gameObject, this.OnChangeEnd)
	--login:AddSliderChange(panel.slider, this.OnSliderChange)
	--login:AddScrollbarChange(panel.scrollbar, this.OnScrollbarChange)
	CtrlManager.LoadPanel(Ctrls.MainScene)
end

--单击事件--
function LoginCtrl.BtnLogin(go)
	message.request("login", { username=panel.login_userName.text, password=panel.login_password.text })
end

function LoginCtrl.LoginBtnRegister(go)
	panel.loginPanel:SetActive(false)
	panel.registerPanel:SetActive(true)
end

function LoginCtrl.LoginBtnModify(go)
	panel.loginPanel:SetActive(false)
	panel.modifyPanel:SetActive(true)
end

function LoginCtrl.ModifyBtnCancel(go)
	panel.loginPanel:SetActive(true)
	panel.modifyPanel:SetActive(false)
end

function LoginCtrl.RegisterAccount(go)
	message.request("register", { username=panel.register_userName.text, password=panel.register_password.text })
end

function LoginCtrl.RegisterBtnCancel(go)
	panel.loginPanel:SetActive(true)
	panel.registerPanel:SetActive(false)
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
	this.Close()
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
		panel.login_userName.text = panel.register_userName.text
		panel.login_password.text = panel.register_password.text
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