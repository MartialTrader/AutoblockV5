--[[

V2.
Using Region3 and Magnitude. (Used .Touched before but always broke)

For Team Demolish.

Made by Martial / DemolishSanity

Say 'Hello' to power.

DON'T LEAK.
If you leak, i'll be adding your name to the banlist.
Script Auto-Updates ;)
]]--

print("Loaded")

-- Region3 Variable

local blockRegion = Region3.new(Vector3.new(), Vector3.new())
local blockRangeInStuds = 5
-- Normal Variables:

local Player = game.Players.LocalPlayer
local Character = Player.Character
local HumanoidRootPart = Character.HumanoidRootPart

-- Tables:

local SPELLS_TO_BLOCK = {
	"avada kedavra",
	"crucio",
	"imperio"
}

-- Functions:

local function BlockSpell()
	game:GetService("ReplicatedStorage").Events.WandEvent:FireServer(3)
	wait(1)
end
local function CheckIfAble(plr, arguments)
	local char = plr.Character
	if char.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
		return false
	else
		return true
	end
end

-- Main Functions:

workspace.DescendantAdded:Connect(function(descendant)
	local MAIN_FUNCTION = coroutine.create(function()
		while wait() do
			if (HumanoidRootPart.Position - descendant.Position).magnitude <= blockRangeInStuds then
				BlockSpell()
				break
			end
		end
	end)
	coroutine.resume(MAIN_FUNCTION)
end)
