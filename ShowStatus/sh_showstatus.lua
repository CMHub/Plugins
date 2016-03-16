PLUGIN.name = "ShowStatus"
PLUGIN.desc = "It make your server show client's HP, Armor, Hunger, Thirst, Stamina on F1 menu."
PLUGIN.author = "Camaro"

nut.config.showStatus = true
nut.config.showStamina = true
nut.config.showHT = true -- Hunger and Thirst will be shown as 0 without buffs or cookfood plugin.

function PLUGIN:CreateSideMenu(menu)
	if (nut.config.showStamina) then
	    menu.status = menu:Add("DLabel")
		menu.status:Dock(BOTTOM)
		menu.status.Think = function(label)
		   label:SetText("Stamina: "..LocalPlayer().character:GetVar("stamina", 0) or "Unknown")
		end
		menu.status:SetContentAlignment(6)
		menu.status:SetTextColor(color_white)
		menu.status:SetExpensiveShadow(1, color_black)
		menu.status:SetFont("nut_TargetFont")
		menu.status:DockMargin(4, 4, 4, 4)
	end
	
	if (nut.config.showHT) then
		menu.status = menu:Add("DLabel")
		menu.status:Dock(BOTTOM)
		menu.status.Think = function(label)
		   label:SetText("Thirst: "..LocalPlayer().character:GetVar("thirst", 0) or "Unknown")
		end
		menu.status:SetContentAlignment(6)
		menu.status:SetTextColor(color_white)
		menu.status:SetExpensiveShadow(1, color_black)
		menu.status:SetFont("nut_TargetFont")
		menu.status:DockMargin(4, 4, 4, 4)
		
		menu.status = menu:Add("DLabel")
		menu.status:Dock(BOTTOM)
		menu.status.Think = function(label)
		   label:SetText("Hunger: "..LocalPlayer().character:GetVar("hunger", 0) or "Unknown")
		end
		menu.status:SetContentAlignment(6)
		menu.status:SetTextColor(color_white)
		menu.status:SetExpensiveShadow(1, color_black)
		menu.status:SetFont("nut_TargetFont")
		menu.status:DockMargin(4, 4, 4, 4)
	end
	
	   if (nut.config.showStatus) then
		menu.status = menu:Add("DLabel")
		menu.status:Dock(BOTTOM)
		menu.status.Think = function(label)
		   label:SetText("Armor: "..LocalPlayer():Armor() or "Unknown")
		end
		menu.status:SetContentAlignment(6)
		menu.status:SetTextColor(color_white)
		menu.status:SetExpensiveShadow(1, color_black)
		menu.status:SetFont("nut_TargetFont")
		menu.status:DockMargin(4, 4, 4, 4)
		
		menu.status = menu:Add("DLabel")
		menu.status:Dock(BOTTOM)
		menu.status.Think = function(label)
		   label:SetText("Health: "..LocalPlayer():Health() or "Unknown")
		end
		menu.status:SetContentAlignment(6)
		menu.status:SetTextColor(color_white)
		menu.status:SetExpensiveShadow(1, color_black)
		menu.status:SetFont("nut_TargetFont")
		menu.status:DockMargin(4, 4, 4, 4)
	end
end