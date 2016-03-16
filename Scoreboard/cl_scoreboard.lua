local gradient = surface.GetTextureID("gui/gradient")
local surface = surface

local PANEL = {}
	function PANEL:Init()
	if (LocalPlayer():IsAdmin()) then
		self:SetSize(ScrW() * 0.375, ScrH() * 0.85)
		self:Center()
		self:MakePopup()
		self:SetDrawBackground(false)

		self.title = self:Add("DLabel")
		self.title:Dock(TOP)
		self.title:DockMargin(8, 8, 8, 0)
		self.title:SetText(GetHostName())
		self.title:SetFont("nut_ScoreTitleFont")
		self.title:SetTextColor(color_white)
		self.title:SetExpensiveShadow(2, color_black)
		self.title:SizeToContents()

		self.list = self:Add("DScrollPanel")
		self.list:Dock(FILL)
		self.list:DockMargin(8, 8, 8, 8)
		self.list:DockPadding(4, 4, 4, 4)
		self.list.Paint = function(panel, w, h)
			surface.SetDrawColor(100, 100, 100, 5)
			surface.DrawOutlinedRect(0, 0, w, h)

			surface.SetDrawColor(50, 50, 50, 150)
			surface.DrawRect(0, 0, w, h)
		end

		self:PopulateList()

		self.lastUpdate = 0
		self.lastCount = #player.GetAll()
	else
	
	self:SetSize(ScrW() * 0.383, ScrH() * 0.145)
		self:Center()
		self:MakePopup()
		self:SetDrawBackground(false)

		self.title = self:Add("DLabel")
		self.title:Dock(TOP)
		self.title:DockMargin(8, 8, 8, 0)
		self.title:SetText(GetHostName())
		self.title:SetFont("nut_ScoreTitleFont")
		self.title:SetTextColor(color_white)
		self.title:SetExpensiveShadow(2, color_black)
		self.title:SizeToContents()
		
		local color = nut.config.mainColor

		self.list = self:Add("DPanel")
		self.list:Dock(FILL)
		self.list:DockMargin(8, 8, 8, 8)
		self.list:DockPadding(4, 4, 4, 4)
		self.list.Paint = function(panel, w, h)
			surface.SetDrawColor(color.r, color.g, color.b, 5)
			surface.DrawOutlinedRect(0, 0, w, h)

			surface.SetDrawColor(color.r, color.g, color.b, 150)
			surface.DrawRect(0, 0, w, h)
		end
		
		local p = self:Add( "nut_NoticePanel" )
		p:Dock( TOP )
		p:DockMargin( 0, 0, 0, 5 )
		p:SetType( 5 )
		p:SetText( "분쟁 방지 및 과도한 친목 방지 차원에서 점수판 확인은 서버 관리자만 가능합니다." ) -- to prevent fights and minging on the server, admins can only see the scoreboard.
	end
	end

	function PANEL:PopulateList()
	if (LocalPlayer():IsAdmin()) then
		self.teamList = {}

		local players = player.GetAll()

		table.sort(players, function(a, b)
			return a:Team() > b:Team()
		end)

		for k, v in ipairs(players) do
			if (v.character) then
				local customClass = v:GetNetVar("customClass")

				if (customClass == "") then
					customClass = nil
				end

				local teamName = customClass or team.GetName(v:Team())

				if (!IsValid(self.teamList[teamName])) then
					self.teamList[teamName] = self.list:Add("DPanel")
					self.teamList[teamName]:Dock(TOP)
					self.teamList[teamName]:SetDrawBackground(false)

					local title = self.teamList[teamName]:Add("DLabel")
					title:Dock(TOP)
					title:DockMargin(4, 0, 4, 4)
					title:SetText(teamName)
					title:SetFont("nut_ScoreTeamFont")
					title:SizeToContents()
					title:SetTextColor(color_white)
					title:SetExpensiveShadow(1, color_black)
				end

				local panel = self.teamList[teamName]

				if (IsValid(panel)) then
					local panel2 = panel:Add("nut_PlayerScore")
					panel2:DockMargin(4, 0, 4, 2)
					panel2:Dock(TOP)
					panel2:SetPlayer(v)
					panel:SetTall(panel:GetTall() + 68 + 8)
				end
			end
		end
		end
	end

	function PANEL:Think()
	if (LocalPlayer():IsAdmin()) then
		if (self.lastUpdate < CurTime()) then
			self.lastUpdate = CurTime() + 1

			if (self.lastCount != #player.GetAll()) then
				self.list:Clear(true)
				self:PopulateList()
			end

			self.lastCount = #player.GetAll()
		end
		end
	end

	function PANEL:Paint(w, h)
	if (LocalPlayer():IsAdmin()) then
		surface.SetDrawColor(25, 25, 25, 200)
		surface.DrawOutlinedRect(0, 0, w, h)

		surface.SetDrawColor(200, 200, 200, 100)
		surface.DrawOutlinedRect(1, 1, w - 2, h - 2)

		surface.SetDrawColor(0, 0, 0, 230)
		surface.DrawRect(0, 0, w, h)
	end
	end
vgui.Register("nut_Scoreboard", PANEL, "DPanel")

local PANEL = {}
	function PANEL:Init()
	if (LocalPlayer():IsAdmin()) then
		local width = (ScrW() * 0.375) - 32

		self:SetTall(68)

		self.model = vgui.Create("SpawnIcon", self)
		self.model:SetPos(2, 2)
		self.model:SetSize(64, 64)
		self.model:SetModel("models/error.mdl")
		self.model.DoClick = function()
			if (IsValid(self.player)) then
				self.player:ShowProfile()
			end
		end
		self.model:SetToolTip("Click to open their profile.")

		self.name = vgui.Create("DLabel", self)
		self.name:SetPos(68, 2)
		self.name:SetText("John Doe")
		self.name:SetFont("nut_TargetFont")
		self.name:SetTextColor(color_white)
		self.name:SetExpensiveShadow(1, color_black)

		self.desc = vgui.Create("DLabel", self)
		self.desc:SetPos(68, 22)
		self.desc:SetText("...")
		self.desc:SetTextColor(color_white)
		self.desc:SetExpensiveShadow(1, color_black)
		self.desc:SetWrap(true)
		self.desc:SetTall(38)
		self.desc:SetWide(width - 128)
		self.desc:SetContentAlignment(7)


		self.ping = vgui.Create("DLabel", self)
		self.ping:SetPos(width - 84, 24)
		self.ping:SetText("000")
		self.ping:SetTextColor(color_white)
		self.ping:SetExpensiveShadow(1, color_black)
		self.ping:SetFont("nut_TargetFont")
		self.ping:SetContentAlignment(6)
	end
	end

	function PANEL:SetPlayer(client)
	if (LocalPlayer():IsAdmin()) then
		self.player = client

		local recognized = hook.Run("IsPlayerRecognized", client)
		local name = ""
		local model = ""

		if (recognized) then
			name = hook.Run("GetPlayerName",client,"scoreboard")
			model = client:GetModel()
		else
			name = hook.Run("GetUnknownPlayerName", client) or "Unknown"
			model = "models/player/skeleton.mdl"
		end

		self.model:SetModel(model, client:GetSkin())
		self.model:SetToolTip("Click to open "..client:RealName().."'s Steam profile.")

		self.name:SetText(name)
		self.name:SizeToContents()

		local description = client.character:GetVar("description")

		if (description) then
			self.desc:SetText(description)
		end
		end
	end

	function PANEL:Think()
	if (LocalPlayer():IsAdmin()) then
		if (IsValid(self.player)) then
			self.ping:SetText(self.player:Ping())
		end
		end
	end

	function PANEL:Paint(w, h)
	if (LocalPlayer():IsAdmin()) then
		surface.SetDrawColor(5, 5, 5, 150)
		surface.DrawOutlinedRect(0, 0, w, h)

		surface.SetDrawColor(255, 255, 255, 10)
		surface.DrawOutlinedRect(1, 1, w - 2, h - 2)

		surface.SetDrawColor(125, 125, 125, 25)
		surface.DrawRect(0, 0, w, h)

		if (IsValid(self.player)) then
			local color = team.GetColor(self.player:Team())

			surface.SetDrawColor(color.r, color.g, color.b, 35)
			surface.SetTexture(gradient)
			surface.DrawTexturedRect(0, 0, w, h)
		end
		end
	end
vgui.Register("nut_PlayerScore", PANEL, "DPanel")

function GM:ScoreboardShow()
	if (!IsValid(nut.gui.score)) then
		nut.gui.score = vgui.Create("nut_Scoreboard")
	end
end

function GM:ScoreboardHide()
	if (IsValid(nut.gui.score)) then
		nut.gui.score:Remove()
	end
end
