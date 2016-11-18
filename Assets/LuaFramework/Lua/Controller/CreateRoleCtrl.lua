local event = {}

local CreateRoleCtrl = {}
local this = CreateRoleCtrl

local panel
local createRole
local transform
local gameObject

function CreateRoleCtrl.Init()
	panelMgr:CreatePanel(Panels.CreateRole, this.Awake, this.Start, this.Update, this.Click)
end

function CreateRoleCtrl.Awake(go)
	message.handler(event)
	gameObject = go
	transform = go.transform
	panel = PanelManager.GetPanel(Panels.CreateRole)
	panel:Awake(go)

	createRole = transform:GetComponent('LuaBehaviour')
	createRole:AddButtonClick(panel.randName, this.RandName)
	createRole:AddButtonClick(panel.btnLogin, this.Login)

	message.request("rolename")
end

function CreateRoleCtrl.RandName(go)
	message.request("rolename")
end

function CreateRoleCtrl.Login(go)
	local sex = 0
	if panel.btnSex1.interactable then
		sex = 0 
	else
		sex = 1 
	end
	message.request("rolecreate", { sex = sex, rolename=panel.roleName.text })
end

function event.rolename(_, resp)
	panel.roleName.text = resp.rolename
end

function event.rolecreate(req, resp)
	if resp.ok then
		message.request("rolelogin")
	else
		showmessage("创建角色失败")
	end
end

function event.rolelogin(_, resp)
	if resp.ok then
		UserData.uid = resp.uid
		UserData.sex = resp.sex
		UserData.rolename = resp.rolename
		this.Close()
		CtrlManager.ShowPanel(Ctrls.MainScene)
	else
		showmessage("角色登录失败")
	end
end

--关闭事件--
function CreateRoleCtrl.Close()
	panelMgr:ClosePanel(Panels.CreateRole)
end

return CreateRoleCtrl