function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function start (song)

end

function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)	
	if bounce then 
		for i=0,7 do
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.sin((currentBeat*2 * math.pi)), i)
		end
	end
	if morebounce then 
		for i=0,7 do
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.sin((currentBeat*2 * math.pi)), i)
		end
	end
	if lowbounce then 
		for i=0,7 do
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.sin((currentBeat*2 * math.pi)), i)
		end
	end
	if cambounce then
	camHudAngle = camHudAngle - 0.08 * math.cos((currentBeat*0.5 * math.pi))
	end
	if slowcambounce then
	camHudAngle = camHudAngle - 0.16 * math.cos((currentBeat*0.5 * math.pi))
	end
	if default then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'],i)
			setActorY(_G['defaultStrum'..i..'Y'],i)
        end
	end
end

function stepHit (step)
	if step == 480 then
		morebounce = true
	end
	if step == 608 then
		bounce = true
                morebounce = false
	end
	if difficulty == 2 and step == 736 then
            morebounce = true
            cambounce = true
            bounce = false
	end
	if step == 1049 then
            default = true
            morebounce = false
            cambounce = false
	end
end