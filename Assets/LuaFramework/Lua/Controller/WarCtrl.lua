local babys = require "Common/baby"
local event = {}

WarCtrl = {}
local this = WarCtrl

local gameObject
local transform
local behaviour
local panel
local player1 = {}
local player2 = {}

function WarCtrl.Awake(player1_data, player2_data)
	message.handler(event)
	player1.data = player1_data
	player2.data = player2_data
	panelMgr:CreatePanel(Panels.War, this.OnCreate)
end

function WarCtrl.Start()
end

function WarCtrl.Update()
end

--启动事件--
function WarCtrl.OnCreate(obj)
	gameObject = obj
	transform = obj.transform
	panel = PanelManager.GetPanel(Panels.War)

	--gameObject:AddComponent(classtype('DropMe'))
	behaviour = transform:GetComponent('LuaBehaviour')
	behaviour.onStart = this.Start
	behaviour.onUpdate = this.Update

	resMgr:LoadPrefab('war', { 'Cell', 'Baby-water', 'Baby-fire', 'Baby-wood', 'Baby-light', 'Baby-dark', 'Card' }, this.InitForm)

	panel.name1.text = player1.data.username
	panel.name2.text = player2.data.username
end

local form = { 
	0, 0, 0, 0, 0, 
	0, 1, 1, 1, 0, 
	0, 1, 1, 1, 0, 
	0, 1, 1, 1, 0, 
	0, 0, 0, 0, 0, 
} 
local name_to_index = {}
local face_index = {
	[1] = 25, [2] = 22, [3] = 23, [4] = 24, [5] = 21,
	[6] = 10, 								[10] = 6,
	[11] = 15, 								[15] = 11,
	[16] = 20, 								[20] = 16,
	[21] = 5, [22] = 2, [23] = 3, [24] = 4, [25] = 1,
}

local cards = { 'water', 'fire', 'wood', 'light', 'dark' }

function WarCtrl.InitForm(objs)
	math.randomseed(os.time())
	local parent = panel.formGrid
	for i = 1, 25 do
		local go = newObject(objs[0])
		go.name = 'Item'..tostring(i)
		name_to_index[go.name] = i
		go.transform:SetParent(parent)
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero
		if form[i] == 1 then
			resMgr:LoadSprite('war_asset', { cards[math.random(5)] }, function (objs)
				local image = go.transform:FindChild("Image")
				image:GetComponent('Image').sprite = objs[0]
				image.gameObject:SetActive(true)
				end)
		else
			go:AddComponent(classtype('DropMe'))
			local dropMe = go.transform:GetComponent("DropMe")
			dropMe.luafunc = this.Drop
		end
	end

	for i = 1, 5 do
		local baby = babys[math.random(#babys)] 
		local go = newObject(objs[baby.attr])
		go.name = 'Baby'
		go.transform:SetParent(panel.babys[i])
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero
		resMgr:LoadSprite('baby_asset', { baby.sprite }, function (objs)
			go.gameObject:GetComponent('Image').sprite = objs[0]
		end)
	end

	for i=1, 4 do
		local go = newObject(objs[6])
		go.name = 'Card'
		go.transform:SetParent(panel.cards[i])
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero
		resMgr:LoadSprite('war_asset', { cards[math.random(5)] }, function (objs)
			local image = go.transform:FindChild('Image')
			image:GetComponent('Image').sprite = objs[0]
			image.gameObject:AddComponent(classtype('DragMe'))
		end)
	end

	resMgr:LoadPrefab('war', {'Role1', 'Role2'}, function (objs)
		local go = newObject(objs[player1.data.sex])
		go.name = 'Player1'
		go.transform:SetParent(transform)
		go.transform.localPosition = Vector3(-400, 55, 0)
		go.transform.localScale = Vector3(0.6, 0.6, 1)
		player1.gameObject = go

		go = newObject(objs[player2.data.sex])
		go.name = 'Player2'
		go.transform:SetParent(transform)
		go.transform.localPosition = Vector3(400, 55, 0)
		go.transform.localScale = Vector3(0.6, 0.6, 1)
		player2.gameObject = go
	end)
end

local used_cards = {}
function WarCtrl.Drop(...)
	local go, name = ...
	used_cards[#used_cards + 1] = name
	local index = name_to_index[go.name]
	local face = face_index[index]
	local parent = panel.formGrid
	for k, v in pairs(face_index) do
		if k ~= face then
			destroy(parent:FindChild('Item'..tostring(k)):GetComponent('DropMe'))
		end
	end
	--[[
	if #used_cards == 2 then
		for i = 1, 4 do
			destroy(panel.cards[i]:FindChild('Card/Image'):GetComponent('DragMe')
		end
	end
	]]
end

--关闭事件--
function WarCtrl.Close()
	panelMgr:ClosePanel(Panels.War)
end

return WarCtrl