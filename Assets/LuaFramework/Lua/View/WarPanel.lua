local gameObject
local transform

local WarPanel = {}

--启动事件--
function WarPanel:Awake(obj)
	gameObject = obj
	transform = obj.transform

	self:InitPanel()
end

--初始化面板--
function WarPanel:InitPanel()
	self.formGrid = transform:FindChild("Form/Grid")
	self.babyGrid = transform:FindChild("Bar/BabyBar/Grid")
	self.babys = {}
	for i = 1, 5 do
		table.insert(self.babys, self.babyGrid:FindChild("Baby_"..tostring(i)))
	end
	self.cardGrid = transform:FindChild("Bar/CardBar/Grid")
	self.cards = {}
	for i = 1, 4 do
		table.insert(self.cards, self.cardGrid:FindChild("Card_"..tostring(i)))
	end
	self.role1 = transform:FindChild("Role1")
	self.role2 = transform:FindChild("Role2")
	self.name1 = transform:FindChild("Name1/Text"):GetComponent('Text')
	self.name2 = transform:FindChild("Name2/Text"):GetComponent('Text')
end

--单击事件--
function WarPanel.OnDestroy()
	--logWarn("OnDestroy---->>>")
end

return WarPanel