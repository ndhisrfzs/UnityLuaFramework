local resManager = LuaHelper.GetResManager()

local res = {}
local var = {
	max_session_id = 0,
	session_id = 0,
	session = {},
}

local function rescb(objs)
	if var.session_id < var.max_session_id then
		var.session_id = var.session_id + 1
		local session = var.session[var.session_id]
		if session then
		 	local f = assert(session.cb)
		 	f(objs, session.args)
		end
	end
end

function res:LoadPrefab(asset, names, cb, args)
	var.max_session_id = var.max_session_id + 1
	var.session[var.max_session_id] = { cb = cb, args = args }
	resManager:LoadPrefab(asset, names, rescb)
end

function res:LoadSprite(asset, names, cb, args)
	var.max_session_id = var.max_session_id + 1
	var.session[var.max_session_id] = { cb = cb, args = args }
	resManager:LoadSprite(asset, names, rescb)
end

return res