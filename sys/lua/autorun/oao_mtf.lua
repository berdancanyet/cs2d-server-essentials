--"One and Only" and "May the force be with you" Script by BcY. 04/2020.
--Updated 09/12/2023
local triggered, msg, parse, pairs = false, msg, parse, pairs

addhook('die', 'AA_die')
addhook('startround', 'AA_start')

function AA_die(id)
	local tt, ct = player(0, "team1living"), player(0, "team2living")
	
	if not triggered then
		local function announceAndPlaySound(playerList, colorCode, colorCode2)
			for _, playerID in pairs(playerList) do
				local message = colorCode .. player(playerID, "name") .. ""..colorCode2.." is one and only!@C"
				local sound = "fun/oneandonly.ogg"
				msg(message)
				parse("sv_sound "..sound)
			end
		end

		if #tt == 1 and #ct ~= 1 and #ct ~= 0 then
			announceAndPlaySound(tt, "\169255025000", "\169150110100")
			triggered = true
		elseif #ct == 1 and #tt ~= 1 and #tt ~= 0 then
			announceAndPlaySound(ct, "\169050150255", "\169110130150")
			triggered = true
		elseif #tt == 1 and #ct == 1 then
			local ttColor, ctColor = "\169255025000", "\169050150255"
					local msg1 = ttColor .. player(tt[1], "name") .. " \169255255255VS " .. ctColor .. player(ct[1], "name") .. "@C"
					local msg2 = ttColor .. player(tt[1], "health") .. "HP \169255255255- " .. ctColor .. player(ct[1], "health") .. "HP@C"
					local sound = "fun/maytheforce.ogg"
					msg(msg1)
					msg(msg2)
					parse("sv_sound2 " .. tt[1] .. " "..sound)
					parse("sv_sound2 " .. ct[1] .. " "..sound)
			triggered = true
		end
	end
end

function AA_start()
	triggered = false
end

function AA_start()
	triggered = false
end
