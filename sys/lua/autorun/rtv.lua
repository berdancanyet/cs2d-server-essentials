--Rock the Vote Script by BcY. 04/2020.

local rtved = {}
local ratio = 0.6 -- %60 of players should rtv to take action.

function setup()
rtv = 0
for id= 1, 32 do
rtved[id]=false
	end
end;setup()

function math.round(number)
    return number - number % 1
end

addhook("say","_srtv")
function _srtv(id,message)
	if (message == "rtv" or message == "!rtv" or message == "rockthevote") then
		if (rtved[id] == false) then
			rtv = rtv + 1 
			rtved[id]=true;	
			if (#player(0,"table")) <= 6 then
			son= #player(0,"table")*ratio - rtv
			local r= math.round(son)+1
				if r==1 then
						msg(""..player(id,"name").." used rtv command. "..tostring(r).." more player needed.")
						elseif r~=1 then
						msg(""..player(id,"name").." used rtv command. "..tostring(r).." more players needed.")
						end
			elseif (#player(0,"table")) > 6 then
			son= #player(0,"table")*ratio - rtv
			local r= math.round(son)
				if r==1 then
						msg(""..player(id,"name").." used rtv command. "..tostring(r).." more player needed.")
						else
						msg(""..player(id,"name").." used rtv command. "..tostring(r).." more players needed.")
				end
			end
			if (rtv >= #player(0,"table")*ratio) then
				parse("map "..game("nextmap").."") --mapcycle.cfg should be set correctly.
				--or any other action you want.
			end
		end
	return 1
	end
end
	
addhook("join","_rjoin")
function _rjoin(id)
rtved[id]=false
end

addhook("leave","_rleave")
function _rleave(id)
	if rtved[id] == true then
	rtv = rtv - 1
	end
end
