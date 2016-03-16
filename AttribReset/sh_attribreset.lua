PLUGIN.name = "Attributes Reset"
PLUGIN.desc = "Admin can reset character's attributes"
PLUGIN.author = "Camaro"

nut.command.Register({
    adminOnly = true,
    allowDead = true,
    syntax = "<string name> <string value>",
    onRun = function(client, arguments)
         local target = nut.command.FindPlayer(client, arguments[1])
		 local amount = tonumber(arguments[2])
         
         if (target) then
            if (!amount) then
            nut.util.Notify(nut.lang.Get("missing_arg", 2), client)
            return end
       
        target:UpdateAttrib(ATTRIB_SPD, amount)
		nut.util.Notify("You have set "..target:Name().."'s speed to "..amount, client)
        end
		end
}, "charsetspeed")

nut.command.Register({
    adminOnly = true,
    allowDead = true,
    syntax = "<string name> <string value>",
    onRun = function(client, arguments)
         local target = nut.command.FindPlayer(client, arguments[1])
		 local amount = tonumber(arguments[2])
         
         if (target) then
            if (!amount) then
            nut.util.Notify(nut.lang.Get("missing_arg", 2), client)
            return end
       
        target:UpdateAttrib(ATTRIB_ACR, amount)
		nut.util.Notify("You have set "..target:Name().."'s speed to "..amount, client)
        end
		end
}, "charsetacrobatic")

nut.command.Register({
    adminOnly = true,
    allowDead = true,
    syntax = "<string name> <string value>",
    onRun = function(client, arguments)
         local target = nut.command.FindPlayer(client, arguments[1])
		 local amount = tonumber(arguments[2])
         
         if (target) then
            if (!amount) then
            nut.util.Notify(nut.lang.Get("missing_arg", 2), client)
            return end
       
        target:UpdateAttrib(ATTRIB_END, amount)
		nut.util.Notify("You have set "..target:Name().."'s speed to "..amount, client)
        end
		end
}, "charsetendurance")

nut.command.Register({
    adminOnly = true,
    allowDead = true,
    syntax = "<string name> <string value>",
    onRun = function(client, arguments)
         local target = nut.command.FindPlayer(client, arguments[1])
		 local amount = tonumber(arguments[2])
         
         if (target) then
            if (!amount) then
            nut.util.Notify(nut.lang.Get("missing_arg", 2), client)
            return end
       
        target:UpdateAttrib(ATTRIB_STR, amount)
		nut.util.Notify("You have set "..target:Name().."'s speed to "..amount, client)
        end
		end
}, "charsetstrength")