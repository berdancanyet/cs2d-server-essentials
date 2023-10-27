--"One and Only" and "May the force be with you" Script by BcY. 04/2020.
--Updated 27/10/2023
local triggered = false

addhook('leave', 'AA_die')
addhook('die', 'AA_die')
addhook('startround', 'AA_start')

function AA_die(id)
	local tt, ct = player(0, "team1living"), player(0, "team2living")
	
	if not triggered then
		local function announceAndPlaySound(playerList, colorCode, colorCode2)
			for _, playerID in pairs(playerList) do
				msg(colorCode .. player(playerID, "name") .. ""..colorCode2.." is one and only!@C")
				parse("sv_sound \"kgbdd/oneandonly.ogg\"")
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
			for _, ax in pairs(tt) do
				for _, bx in pairs(ct) do
					msg(ttColor .. player(ax, "name") .. "  \169255255255VS " .. ctColor .. player(bx, "name") .. "@C")
					msg(ttColor .. player(ax, "health") .. "HP \169255255255- " .. ctColor .. player(bx, "health") .. "HP@C")
					parse("sv_sound2 " .. ax .. " \"kgbdd/maytheforce.ogg\"")
					parse("sv_sound2 " .. bx .. " \"kgbdd/maytheforce.ogg\"")
				end
			end
			triggered = true
		end
	end
end

function AA_start()
	triggered = false
end
