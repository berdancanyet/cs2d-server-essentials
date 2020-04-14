--Public Server Script and AWP & Shield Limiter by BcY. 04.2020.

local money = "Disabled"
local fow = "Disabled"
local tbought = false
local ctbought = false
local shield = false
local m = msg2
local p = parse
local t = timer
local menuname = game("sv_name")

addhook("serveraction","_svac")		
	function _svac(id,act)
	if (act == 1) then
menu(id,""..tostring(menuname)..",Reset Score,,(Timeleft: "..game("mp_timelimit").."),(Nextmap: "..game("nextmap").."),,("..os.date("Time: %I:%M %p").."),("..os.date("Date: %A %d %b %Y")..")")
end 
end

addhook("menu","men")
function men(id,baslik,buton)
if baslik== tostring(menuname) then
if buton==1 then
	if player(id,"score") > 0 or player(id,"deaths") > 0 then
p("setscore "..id.. " 0")
p("setdeaths "..id.. " 0")
msg2(id,"\169000255000You have successfully nullified your score!@C")
else
msg2(id,"Error: Your score is already nullified!@C")
			end 
		end 
	end
end
	
addhook("startround","mneabled")
function mneabled(id)
	tbought = false
	ctbought = false
	shield = false
end

addhook("buy","_buy")
function _buy(id,weapon)
  if player(id,"team") == 1 and weapon == 35 and tbought == true then
	p("sv_sound2 "..id.." env/click2.wav")
    m(id,"Only one AWP per team allowed@C")
    return 1 
  elseif player(id,"team") == 1 and weapon == 35 and tbought == false then
    tbought = true
	return 0
end
  if player(id,"team") == 2 and weapon == 35 and ctbought == true then
	p("sv_sound2 "..id.." env/click2.wav")
    m(id,"Only one AWP per team allowed@C")
    return 1 
  elseif player(id,"team") == 2 and weapon == 35 and ctbought == false then
    ctbought = true
	return 0
end
	if player(id,"team") == 2 and weapon == 41 and shield == true then --make sure Tactical Shield is not in mp_unbuyable
	p("sv_sound2 "..id.." env/click2.wav")
	m(id,"Only one Tactical shield can be bought per round.@C")
	return 1
	elseif player(id,"team") == 2 and weapon == 41 and shield == false then
	shield = true
	return 0
	end
end