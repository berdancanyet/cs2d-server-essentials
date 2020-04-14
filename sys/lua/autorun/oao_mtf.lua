--"One and Only" and "May the force be with you" Script by BcY. 04/2020.
local triggered = false

addhook('leave', 'AA_die')
addhook('die', 'AA_die')
addhook('startround','AA_start')
function AA_die(id)
		local a = player(0,"team1living") --tt
		local b = player(0,"team2living") --ct
	 if #a == 1 and #b ~= 1 and not triggered then
	 for _,ax in pairs(a) do
          msg("\169255025000"..player(ax,"name").." \169150110100is one and only! t@C")
		parse("sv_sound \"kgb2d/quickplay/oneandonly.ogg\"")
		triggered = true
		  end
	elseif #b == 1 and #a ~= 1 and not triggered then
	for _,bx in pairs(b) do
		msg("\169050150255"..player(bx,"name").." \169110130150is one and only! ct@C")
		parse("sv_sound \"kgb2d/quickplay/oneandonly.ogg\"")
		triggered = true
end
	elseif #a == 1 and #b == 0 then
	return;
	elseif #b == 1 and #a == 0 then
	return;
end
	if #a == 1 and #b == 1 then
	for _,ax in pairs(a) do
		for _,bx in pairs(b) do
	msg("\169255025000"..player(ax,"name").." \169255255255VS \169050150255"..player(bx,"name").."@C")
	msg("\169255025000"..player(ax,"health").."HP \169255255255- \169050150255"..player(bx,"health").."HP@C")
	parse("sv_sound2 "..ax.." \"kgb2d/quickplay/maytheforce.ogg\"")
	parse("sv_sound2 "..bx.." \"kgb2d/quickplay/maytheforce.ogg\"")
end
end
end
end

function AA_start()
	triggered = false
	end
