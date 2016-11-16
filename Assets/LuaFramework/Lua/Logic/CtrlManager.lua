local CtrlManager = {}
local this = CtrlManager
local ctrlList = {}	--控制器列表--

function CtrlManager.Init()
	for k,v in pairs(Ctrls) do
        ctrlList[k] = require ("Controller/"..tostring(v).."Ctrl")
    end
end

--添加控制器--
function CtrlManager.AddCtrl(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj;
end

--获取控制器--
function CtrlManager.GetCtrl(ctrlName)
	return ctrlList[ctrlName];
end

function CtrlManager.ShowPanel(panel, ...)
	local ctrl = CtrlManager.GetCtrl(panel)
	if ctrl ~= nil then
		ctrl.Awake(...)
	end
end

--移除控制器--
function CtrlManager.RemoveCtrl(ctrlName)
	ctrlList[ctrlName] = nil;
end

return CtrlManager