
-- FastFly.lua

-- Implements the whole plugin functionality

--[[
The FastFly plugin allows players to switch between normal-speed and fast-speed flying
by using the /fastfly command
--]]





local function ToggleFastFly(a_Player)
	local RelSpeed
	if (math.abs(a_Player:GetNormalMaxSpeed() - 1) < 0.00001) then
		-- The player is in normal speed, switch to fast:
		RelSpeed = 2.5
		Msg = "FastFly enabled"
	else
		-- The player is in fast speed, switch to normal:
		RelSpeed = 1
		Msg = "FastFly disabled"
	end
	
	-- Set the relative speeds in all 3 categories:
	a_Player:SetNormalMaxSpeed(RelSpeed)
	a_Player:SetSprintingMaxSpeed(RelSpeed * 1.3)  -- 1.3 because sprinting uses walking speed as base
	a_Player:SetFlyingMaxSpeed(RelSpeed)
	a_Player:SendMessage(cCompositeChat(Msg):SetMessageType(mtInformation))
end





function HandleCmdFastFly(a_Split, a_Player)
	-- If without params, toggle the FastFly mode
	if (a_Split[2] == nil) then
		ToggleFastFly(a_Player)
		return true
	end
	
	-- A parameters is given, set relative speed to its value:
	local RelSpeed = tonumber(a_Split[2])
	if (RelSpeed == nil) then
		a_Player:SendMessage(cCompositeChat("Relative speed must be a number"):SetMessageType(mtFailure))
		return true
	end

		-- Set the relative speeds in all 3 categories:
	a_Player:SetNormalMaxSpeed(RelSpeed)
	a_Player:SetSprintingMaxSpeed(RelSpeed * 1.3)  -- 1.3 because sprinting uses walking speed as base
	a_Player:SetFlyingMaxSpeed(RelSpeed)
	a_Player:SendMessage(cCompositeChat("Relative speed set to " .. RelSpeed):SetMessageType(mtInformation))
	return true
end





function Initialize(a_Plugin)
	-- Load the InfoReg library file for registering the Info.lua command table:
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
	
	-- Initialize in-game commands:
	RegisterPluginInfoCommands()
	
	LOG("FastFly enabled")
	return true
end




