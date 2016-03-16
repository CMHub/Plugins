PLUGIN.name = "Utility Commands"
PLUGIN.author = "Camaro"
PLUGIN.desc = "You can use scroll text and notify"

nut.command.Register({
	allowDead = true,
	syntax = "<string scrolltext>",
	onRun = function(client, arguments)

			local text = table.concat(arguments, " ")

			if (!text or #text < 1) then
				nut.util.Notify(nut.lang.Get("missing_arg", 1), client)

				return
			end

			nut.scroll.Send(text)
	end
}, "scrollsend")

nut.command.Register({
	allowDead = true,
	syntax = "<string notifytext>",
	onRun = function(client, arguments)

			local text = table.concat(arguments, " ")

			if (!text or #text < 1) then
				nut.util.Notify(nut.lang.Get("missing_arg", 1), client)

				return
			end

			nut.util.Notify(text)
	end
}, "notify")