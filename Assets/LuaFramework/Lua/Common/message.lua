local sproto = require "3rd/sproto/sproto"
local core = require "sproto.core"

local message = {}
local var = {
	session_id = 0,
	handler = {},
	session = {},
}

function message.register(name)
	local f = assert(io.open(name .. ".s2c.sproto"))
	local t = f:read("*all")
	f:close()
	var.host = sproto.parse(t):host "package"
	local f = assert(io.open(name .. ".c2s.sproto"))
	local t = f:read("*all")
	f:close()
	var.request = var.host:attach(sproto.parse(t))
end

function message.handler(handler)
	log("handler")
	var.handler = handler
end

local function send_package(pack)
    local buffer = ByteBuffer.New();
    buffer:WriteBuffer(pack);
    networkMgr:SendMessage(buffer);
end

function message.request(name, args)
	var.session_id = var.session_id + 1
	var.session[var.session_id] = { name = name, req = args }
	local str = var.request(name, args, var.session_id)
    send_package(str)
	return var.session_id
end

function message.update(buffer)
	local buf = buffer:ReadBuffer()
    local t, session_id, resp, err = var.host:dispatch(buf)
    if t == "REQUEST" then
    	local f = assert(var.handler[session_id])
    	if not err then
			f(resp)
		else
			log(string.format("session [%d] error : %s", session_id, err))
		end
    else
		assert(t == "RESPONSE")
		local session = var.session[session_id]
		var.session[session_id] = nil
		local f = assert(var.handler[session.name])
		if not err then
			f(session.req, resp, session_id)
		else
			log(string.format("session [%d] error : %s", session_id, err))
		end
	end
	return true
end

return message