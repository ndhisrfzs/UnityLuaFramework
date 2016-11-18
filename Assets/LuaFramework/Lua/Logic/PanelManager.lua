local PanelManager = {}
local this = PanelManager
local panelList = {}	--控制器列表--

function PanelManager.Init()
	for k,v in pairs(Panels) do
        panelList[k] = require ("View/"..tostring(v).."Panel")
    end
end

--添加控制器--
function PanelManager.AddPanel(panelName, panelObj)
	panelList[panelName] = panelObj
end

--获取控制器--
function PanelManager.GetPanel(panelName)
	return panelList[panelName]
end

--移除控制器--
function PanelManager.RemovePanel(panelName)
	panelList[panelName] = nil
end

return PanelManager