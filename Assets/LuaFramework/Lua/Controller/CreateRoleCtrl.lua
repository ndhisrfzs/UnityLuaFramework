local event = {}

local CreateRoleCtrl = {}
local this = CreateRoleCtrl

local CreateRolePanel
local createRole
local transform
local gameObject

function CreateRoleCtrl.Awake()
	panelMgr:CreatePanel(Panels.CreateRole, this.OnCreate)
end

--启动事件--
function CreateRoleCtrl.OnCreate(obj)
	message.handler(event)
	gameObject = obj
	transform = obj.transform
	CreateRolePanel = PanelManager.GetPanel(Panels.CreateRole)

	createRole = transform:GetComponent('LuaBehaviour')
	createRole:AddButtonClick(CreateRolePanel.randName, this.RandName)
	createRole:AddButtonClick(CreateRolePanel.btnLogin, this.Login)

	message.request("rolename")
end

function CreateRoleCtrl.RandName(go)
	message.request("rolename")
end

function CreateRoleCtrl.Login(go)
	local sex = 0
	if CreateRolePanel.btnSex1.interactable then
		sex = 0 
	else
		sex = 1 
	end
	message.request("rolecreate", { sex = sex, rolename=CreateRolePanel.roleName.text })
end

function event.rolename(_, resp)
	CreateRolePanel.roleName.text = resp.rolename
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
		destroy(gameObject)
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