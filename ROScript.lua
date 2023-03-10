Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

local RunService = game:GetService("RunService")

local ChosenSpeed = 0
local doSpeedLock

Window = Library:Create({
	Name = "Race Officals Panel", -- String
	Footer = "by anson :shrug:", -- String
	ToggleKey = Enum.KeyCode.RightShift, -- Enum.KeyCode
	LoadedCallback = function()
		-- Function
	end,
	
	KeySystem = true, -- Boolean
	Key = "JBMS", -- String
	MaxAttempts = 5, -- Integer
	DiscordLink = nil, -- String (Set it to nil if you do not have one, the button will not pop out)
	ToggledRelativeYOffset = 5 -- Number (Y Offset from bottom of your screen. Set it to nil if you want it to be centred)
})

PaceCarTab = Window:Tab({
	Name = "Pace Car", -- String
	Icon = "rbxassetid://12742814040", -- String
	Color = Color3.new(1, 0, 0) -- Color3
})

CruiseControlSec = PaceCarTab:Section({
	Name = "Cruise Control" -- String
})

SpeedSlider = CruiseControlSec:Slider({
	Name = "Cruise Control Speed", -- String
	Max = 400, -- Integer
	Min = 0, -- Integer
	Default = 0, -- Integer
	Callback = function(Value)
    		ChosenSpeed = Value
  	end
})

CuriseControlToggle = CruiseControlSec:Toggle({
	Name = "Toggle Cruise Control", -- String
	Default = false, -- Boolean
	Callback = function(Bool) 
		doSpeedLock = Bool
            while doSpeedLock do
                local CarSpeedNum = tonumber(game.Players.LocalPlayer.PlayerGui.AppUI.Speedometer.Top.Speed.Text)
                if CarSpeedNum < ChosenSpeed then
                    keypress(0x57)
                    task.wait()
                elseif CarSpeedNum > ChosenSpeed then
                    keyrelease(0x57)
                    task.wait()
                end
                task.wait()
                if not doSpeedLock then
                    keyrelease(0x57)
                end
            end
	end
})

