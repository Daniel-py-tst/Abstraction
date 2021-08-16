local function levelup(player,amt)
	local MaxXp = player.leaderstats.MaxXp
	local Xp = player.leaderstats.Exp
	local Level = player.leaderstats.Level 
	
	local total = Xp.Value + amt
	if total >= MaxXp.Value then
		repeat
			total -= MaxXp.Value
			Level.Value += 1
			MaxXp.Value = 100 ^ (1 +(Level.Value * .1))
		until total < MaxXp.Value
	end
	Xp.Value = total	
end



local function GiveXp(player, am)
	local Xp = player.leaderstats.Exp
	local MaxXp = player.leaderstats.MaxXp
	local Level = player.leaderstats.Level

	if (am + Xp.Value) >= MaxXp.Value then
		levelup(player,am)
	else
		Xp.Value += am
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
script.Parent.ClickDetector.MouseClick:Connect(function(player)
	GiveXp(player, 200)
end)
