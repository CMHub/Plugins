local PLUGIN = PLUGIN
PLUGIN.name = "Show Status Quick"
PLUGIN.author = "Camaro"
PLUGIN.desc = "Adds animations that can be performed by players."
PLUGIN.sequences = {}


	function PLUGIN:CreateQuickMenu(panel, client)

		local label = panel:Add("DLabel")
		label:Dock(TOP)
		label:SetText("신체 상태")
		label:SetFont("nut_TargetFont")
		label:SetTextColor(Color(233, 233, 233))
		label:SizeToContents()
		label:SetExpensiveShadow(2, Color(0, 0, 0))
		local category = panel:Add("DPanel")
		category:Dock(TOP)
		category:DockPadding(5, 5, 5, 5)
		category:DockMargin(0, 5, 0, 5)
		category:SetTall(140)
		panel.stmenu = category:Add("DLabel")
		panel.stmenu:Dock(TOP)
		panel.stmenu:DockMargin(3, 3, 3, 3)
		if(LocalPlayer():Health() >= 0) then
		panel.stmenu:SetText("체력: "..LocalPlayer():Health()..", 위독합니다.")
		 if(LocalPlayer():Health() >= 25) then
		panel.stmenu:SetText("체력: "..LocalPlayer():Health()..", 불안합니다.")
		  if(LocalPlayer():Health() >= 50) then
		panel.stmenu:SetText("체력: "..LocalPlayer():Health()..", 평범합니다.")
		   if(LocalPlayer():Health() >= 75) then
		panel.stmenu:SetText("체력: "..LocalPlayer():Health()..", 건강합니다.")
		  if(LocalPlayer():Health() >= 100) then
		panel.stmenu:SetText("체력: "..LocalPlayer():Health()..", 매우 좋습니다.")
		end end end end end
		panel.stmenu:SetTextColor(Color(5, 5, 5))
		
		panel.stmenu = category:Add("DLabel")
		panel.stmenu:Dock(TOP)
		panel.stmenu:DockMargin(3, 3, 3, 3)
		if(LocalPlayer():Armor() >= 1) then
		panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 불안합니다.")
		 if(LocalPlayer():Armor() >= 25) then
		panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 미약합니다.")
		if(LocalPlayer():Armor() >= 50) then
		panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 평범합니다.")
		if(LocalPlayer():Armor() >= 75) then
		panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 든든합니다.")
		if(LocalPlayer():Armor() >= 100) then
		panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 튼실합니다.")
		end end end end elseif(LocalPlayer():Armor() <= 0) then
                          panel.stmenu:SetText("방어: "..LocalPlayer():Armor()..", 방호복이 없습니다.") end		
		panel.stmenu:SetTextColor(Color(5, 5, 5))
		
		panel.stmenu = category:Add("DLabel")
		panel.stmenu:Dock(TOP)
		panel.stmenu:DockMargin(3, 3, 3, 3)
		if(LocalPlayer().character:GetVar("stamina") >= 0) then
		panel.stmenu:SetText("기력: "..LocalPlayer().character:GetVar("stamina")..", 기진맥진합니다.")
		 if(LocalPlayer().character:GetVar("stamina") >= 50) then
		panel.stmenu:SetText("기력: "..LocalPlayer().character:GetVar("stamina")..", 평범합니다.")
		 if(LocalPlayer().character:GetVar("stamina") >= 100) then
		panel.stmenu:SetText("기력: "..LocalPlayer().character:GetVar("stamina")..", 활기찹니다.")
		end end end
		panel.stmenu:SetTextColor(Color(5, 5, 5))
		
		panel.stmenu = category:Add("DLabel")
		panel.stmenu:Dock(TOP)
		panel.stmenu:DockMargin(3, 3, 3, 3)
		if(LocalPlayer().character:GetVar("hunger") >= 0) then
		panel.stmenu:SetText("허기: "..LocalPlayer().character:GetVar("hunger")..", 배가 매우 고픕니다.")
		 if(LocalPlayer().character:GetVar("hunger") >= 50) then
		panel.stmenu:SetText("허기: "..LocalPlayer().character:GetVar("hunger")..", 배고픕니다.")
		 if(LocalPlayer().character:GetVar("hunger") >= 100) then
		panel.stmenu:SetText("허기: "..LocalPlayer().character:GetVar("hunger")..", 평범합니다.")
		end end end
		panel.stmenu:SetTextColor(Color(5, 5, 5))
		
		panel.stmenu = category:Add("DLabel")
		panel.stmenu:Dock(TOP)
		panel.stmenu:DockMargin(3, 3, 3, 3)
		if(LocalPlayer().character:GetVar("thirst") >= 0) then
		panel.stmenu:SetText("갈증: "..LocalPlayer().character:GetVar("thirst")..", 목이 매우 마릅니다.")
		 if(LocalPlayer().character:GetVar("thirst") >= 50) then
		panel.stmenu:SetText("갈증: "..LocalPlayer().character:GetVar("thirst")..", 목마릅니다.")
		 if(LocalPlayer().character:GetVar("thirst") >= 100) then
		panel.stmenu:SetText("갈증: "..LocalPlayer().character:GetVar("thirst")..", 평범합니다.")
		end end end
		panel.stmenu:SetTextColor(Color(5, 5, 5))
	end
