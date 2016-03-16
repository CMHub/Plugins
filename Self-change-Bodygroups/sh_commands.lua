
nut.command.Register({
	syntax = "<string group> [int state]",
	onRun = function(client, arguments)
		

		local group = arguments[1]
		local active = tonumber(arguments[2]) or 0

		if (!group) then
			nut.util.Notify(nut.lang.Get("missing_arg", 1), client)

			return
		end

		for k, v in pairs(client:GetBodyGroups()) do
			local groups = client.character:GetData("groups", {})

			if (v.id > 0 and (tostring(v.id) == group or nut.util.StringMatches(group, v.name))) then
				if (active) then
					client:SetBodygroup(v.id, active)
					groups[v.id] = active
					client.character:SetData("groups", groups, nil, true)

					return nut.util.Notify(client:Name().." has set "..v.name.." bodygroup state to "..active..".", client)
				end
			end
		end

		nut.util.Notify("You provided an invalid bodygroup.", client)
	end
}, "setbodygroup")