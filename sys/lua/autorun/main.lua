--Public Server Script and AWP & Shield Limiter by BcY. 04.2020.

local tbought, ctbought = false, false
local shield = false
local m, p, t = msg2, parse, timer
local menuname = game("sv_name")

addhook("serveraction","_svac")		
function _svac(id,act)
	if (act == 1) then
menu(id,""..tostring(menuname)..",Reset Score,,(Timeleft: "..game("mp_timelimit").."),(Nextmap: "..game("nextmap").."),,("..os.date("Time: %I:%M %p").."),("..os.date("Date: %A %d %b %Y")..")")
	end 
end

addhook("menu","men")
function men(id,title,button)
    if title == menuname and button == 1 then
        if player(id, "score") > 0 or player(id, "deaths") > 0 then
            p("setscore " .. id .. " 0")
            p("setassists " .. id .. " 0")
            p("setdeaths " .. id .. " 0")
            m(id, "\169000255000You have successfully nullified your score!@C")
        else
            m(id, "Error: Your score is already nullified!@C")
        end
    end
end
	
addhook("startround","mneabled")
function mneabled(id)
	tbought, ctbought, shield = false, false, false
end

addhook("buy","_buy")
function _buy(id,weapon)
    local team = player(id, "team")
    
    if weapon == 35 and ((team == 1 and tbought) or (team == 2 and ctbought)) then
        p("sv_sound2 " .. id .. " env/click2.wav")
        m(id, "Only one AWP per team allowed@C")
        return 1
    elseif weapon == 35 and team == 1 then
        tbought = true
    elseif weapon == 35 and team == 2 then
        ctbought = true
    end
    
    if weapon == 41 and team == 2 and shield then
        p("sv_sound2 " .. id .. " env/click2.wav")
        m(id, "Only one Tactical shield can be bought per round.@C")
        return 1
    elseif weapon == 41 and team == 2 then
        shield = true
    end
end
