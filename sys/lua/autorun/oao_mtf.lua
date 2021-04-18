--"One and Only" and "May the force be with you" Script by BcY. 04/2020.
local triggered = false

addhook('leave', 'AA_die')
addhook('die', 'AA_die')
addhook('startround','AA_start')
function AA_die(id)
	local tt = player(0,"team1living") --premium
	local ct = player(0,"team2living") --ct
	
	if #tt == 1 and #ct ~= 1 and #ct ~= 0 and not triggered then
		for _,ax in pairs(tt) do
		msg("\169255025000"..player(ax,"name").." \169150110100is one and only!@C")
		parse("sv_sound \"fun/oneandonly.ogg\"")
		triggered = true
		end
	elseif #ct == 1 and #tt ~= 1 and #tt ~= 0 and not triggered then
		for _,bx in pairs(ct) do
		msg("\169050150255"..player(bx,"name").." \169110130150is one and only!@C")
		parse("sv_sound \"fun/oneandonly.ogg\"")
		triggered = true
		end
	elseif #tt == 1 and #ct == 0 then
		return;
	elseif #ct == 1 and #tt == 0 then
		return;
	end
	if #tt == 1 and #ct == 1 then
		for _,ax in pairs(tt) do
			for _,bx in pairs(ct) do
			msg("\169255025000"..player(ax,"name").." \169255255255VS \169050150255"..player(bx,"name").."@C")
			msg("\169255025000"..player(ax,"health").."HP \169255255255- \169050150255"..player(bx,"health").."HP@C")
			parse("sv_sound2 "..ax.." \"fun/maytheforce.ogg\"")
			parse("sv_sound2 "..bx.." \"fun/maytheforce.ogg\"")
			end
		end
	end
end

function AA_start()
	triggered = false
end
