PLUGIN.name = "Points"
PLUGIN.desc = "Points for HL2RP!!"
PLUGIN.author = "Camaro"

function GM:PlayerSpawn(client)
client:SetNetVar("point", 0)
end

nut.command.Register({
	syntax = "<number amount>",
	onRun = function(client, arguments)
	if (!client:IsCombine()) then return nut.util.Notify("You are not the Combine!") end
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*84
			data.filter = client
		local trace = util.TraceLine(data)
		local entity = trace.Entity

		if (IsValid(entity) and entity:IsPlayer() and entity.character) then

			local amount = tonumber(arguments[1])

			if (!amount) then
				nut.util.Notify(nut.lang.Get("missing_arg", 1), client)

				return
			end
			
			local curPts = entity:GetNetVar("point")
			
			if (IsValid(entity)) then
			entity:SetNetVar("point", curPts+amount)
			nut.util.Notify("You have given "..amount.." points to the looking character.", client)
			end

		else
			nut.util.Notify("You are not looking at a valid player.", client)
		end
	end
}, "givepoint")

nut.command.Register({
	syntax = "<number amount>",
	onRun = function(client, arguments)
	if (!client:IsCombine()) then return nut.util.Notify("You are not the Combine!") end
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*84
			data.filter = client
		local trace = util.TraceLine(data)
		local entity = trace.Entity

		if (IsValid(entity) and entity:IsPlayer() and entity.character) then

			local amount = tonumber(arguments[1])

			if (!amount) then
				nut.util.Notify(nut.lang.Get("missing_arg", 1), client)

				return
			end
			
			local curPts = entity:GetNetVar("point")
			
			if (IsValid(entity)) then
			entity:SetNetVar("point", curPts-amount)
			nut.util.Notify("You have taken "..amount.." points to the looking character.", client)
			end

		else
			nut.util.Notify("You are not looking at a valid player.", client)
		end
	end
}, "takepoint")

nut.command.Register({
	onRun = function(client, arguments)
	local point = client:GetNetVar("point")
	client:ChatPrint("You have "..point.." points left.")

	end
}, "checkpoint")