local babys = require "Common/baby"
local event = {}

local WarCtrl = {}
local this = WarCtrl

local gameObject
local transform
local behaviour
local panel
local player1 = {}
local player2 = {}

function WarCtrl.Init(player1_data, player2_data)
	message.handler(event)
	player1.data = player1_data
	player2.data = player2_data
	panelMgr:CreatePanel(Panels.War, this.Awake, this.Start, this.Update, this.Click)
end

function WarCtrl.Awake(go)
	gameObject = go
	transform = go.transform
	panel = PanelManager.GetPanel(Panels.War)
	panel:Awake(go)
	
	behaviour = transform:GetComponent('LuaBehaviour')

	resMgr:LoadPrefab('war', { 'Cell' }, this.InitForm)

	panel.name1.text = player1.data.username
end

local handcard_to_index = {}
local cards = { 'water', 'fire', 'wood', 'light', 'dark' }
function event.initroom(_, resp)
	local parent = panel.formGrid
	for k,v in ipairs(resp.cards) do
		local go = parent:FindChild('Item'..tostring(k)).gameObject
		if v >= 1 then
			resMgr:LoadSprite('war_asset', { cards[v] }, function (objs)
				local image = go.transform:FindChild('Image')
				image:GetComponent('Image').sprite = objs[0]
				image.gameObject:SetActive(true)
			end)
		end
	end
	resMgr:LoadPrefab('war', { 'Baby-water', 'Baby-fire', 'Baby-wood', 'Baby-light', 'Baby-dark' }, function(objs)
		for k,v in ipairs(resp.p1babys) do
			local baby = babys[v] 
			local go = newObject(objs[baby.attr - 1])
			go.name = 'Baby'
			go.transform:SetParent(panel.babys[k])
			go.transform.localScale = Vector3.one
			go.transform.localPosition = Vector3.zero
			resMgr:LoadSprite('baby_asset', { baby.sprite }, function (objs)
				go.gameObject:GetComponent('Image').sprite = objs[0]
			end)
		end

		--P2
		for k, v in ipairs(resp.p2babys) do
			local baby = babys[v]
			local go = newObject(objs[baby.attr - 1])
			go.name = 'Baby'..tostring(k)
			go.transform:SetParent(panel.p2babys)
			go.transform.localScale = Vector3(0.9, 0.9, 1)
			go.transform.localPosition = Vector3.zero
			resMgr:LoadSprite('baby_asset', { baby.sprite }, function (objs)
				go.gameObject:GetComponent('Image').sprite = objs[0]
			end)
		end
	end)

	resMgr:LoadPrefab('war', { 'Card' }, function(objs)
		for k, v in ipairs(resp.p1handcards) do
			local go = newObject(objs[0])
			go.name = 'Card'
			handcard_to_index[panel.cards[k].name] = k
			go.transform:SetParent(panel.cards[k])
			go.transform.localScale = Vector3.one
			go.transform.localPosition = Vector3.zero
			resMgr:LoadSprite('war_asset', { cards[v] }, function (objs)
				local image = go.transform:FindChild('Image')
				image:GetComponent('Image').sprite = objs[0]
				image.gameObject:AddComponent(classtype('DragMe'))
			end)
		end
	end)

	--P2
	resMgr:LoadPrefab('war', { 'HandCard' }, function(objs)
		for k, v in ipairs(resp.p2handcards) do
			local go = newObject(objs[0])
			go.name = 'Card'..tostring(k)
			go.transform:SetParent(panel.p2handcards)
			go.transform.localScale =  Vector3.one
			go.transform.localPosition = Vector3.zero
			resMgr:LoadSprite('war_asset', { cards[v] }, function (objs)
				go.transform:GetComponent('Image').sprite = objs[0]
			end)
		end
	end)
end

function WarCtrl.Start()
end

function WarCtrl.Update()
end

function WarCtrl.Click(...)
end

local form = { 
	0, 0, 0, 0, 0, 
	0, 1, 1, 1, 0, 
	0, 1, 1, 1, 0, 
	0, 1, 1, 1, 0, 
	0, 0, 0, 0, 0, 
} 
local card_to_index = {}
local face_index = {
	[1] = 25, [2] = 22, [3] = 23, [4] = 24, [5] = 21,
	[6] = 10, 								[10] = 6,
	[11] = 15, 								[15] = 11,
	[16] = 20, 								[20] = 16,
	[21] = 5, [22] = 2, [23] = 3, [24] = 4, [25] = 1,
}

function WarCtrl.InitForm(objs)
	math.randomseed(os.time())
	local parent = panel.formGrid
	for i = 1, 25 do
		local go = newObject(objs[0])
		go.name = 'Item'..tostring(i)
		card_to_index[go] = i
		go.transform:SetParent(parent)
		go.transform.localScale = Vector3.one
		go.transform.localPosition = Vector3.zero
		if form[i] ~= 1 then
			go:AddComponent(classtype('DropMe'))
			local dropMe = go.transform:GetComponent('DropMe')
			dropMe.luafunc = this.Drop
		end
	end

	resMgr:LoadPrefab('war', {'Role2', 'Role1'}, function (objs)
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
		local info = go.transform:FindChild('Info')
		info:FindChild('Name'):GetComponent('Text').text = player2.data.username
		info.gameObject:SetActive(true)
		player2.gameObject = go
	end)
	
	message.request('initroom')
end

local used_cards = {}
function WarCtrl.Drop(...)
	local go, name = ...
	used_cards[#used_cards + 1] = name
	local index = card_to_index[go]
	local handcard_index = handcard_to_index[name]
	local face = face_index[index]
	local parent = panel.formGrid
	for k, v in pairs(face_index) do
		if k ~= face then
			destroy(parent:FindChild('Item'..tostring(k)):GetComponent('DropMe'))
		end
	end
	message.request("drag", { handcard = handcard_index, goalpos = index })
	--[[
	if #used_cards == 2 then
		for i = 1, 4 do
			destroy(panel.cards[i]:FindChild('Card/Image'):GetComponent('DragMe')
		end
	end
	]]
end

local function getcard(index)
	for k, v in pairs(card_to_index) do
		if v == index then
			return k
		end
	end
end

function event.dragdata(req)
	local card = getcard(req.goalpos)
	local dragmovie = panel.p2handcards:FindChild('Card'..tostring(req.handcard)):GetComponent('DragMovie')
	dragmovie:Move(card)
end

--关闭事件--
function WarCtrl.Close()
	panelMgr:ClosePanel(Panels.War)
end

return WarCtrl