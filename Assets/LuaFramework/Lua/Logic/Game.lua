require "Common/define"
require "Common/functions"
require "Logic/LuaClass"

local panels = require "Common/panel"

message.register(Util.DataPath.."lua/Proto/proto")

--管理器--
Game = {}

local function InitFramework()
    for _,v in ipairs(panels) do
        Ctrls[v] = v
        Panels[v] = v
    end
end

--初始化完成，发送链接服务器信息--
function Game.OnInitOK()
    AppConst.SocketPort = 8888
    AppConst.SocketAddress = "192.168.0.111"
    networkMgr:SendConnect()

    --注册LuaView--
    InitFramework()

    PanelManager.Init()
    CtrlManager.Init()

    CtrlManager.ShowPanel(Panels.Login)

    --AppFacade.Instance:SendMessageCommand(NotiConst.UPDATE_MESSAGE, "hello")
       
    logWarn('LuaFramework InitOK--->>>')
end

--销毁--
function Game.OnDestroy()
	--logWarn('OnDestroy--->>>');
end
