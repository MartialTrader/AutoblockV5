--[[
V2.

For Team Demolish.
Made by Martial / DemolishSanity

Don't bother reverse engineering.
It's obfuscated and I made a Whitelist system for it.
Good luck.

- Using Region3 and Magnitude.
- Using GuiToLua 3.2
- Using yourmom

ALL CREDITS GO TO ME.
]]--

-- AntiLeak

local BAN_LIST = {"avalynn","scary_lord10","DemolishSaints"}
local WHITE_LIST = {"DemolishSanity","TestingWLScript","DemolishSaints","DemolishSpirits"}

local p = game.Players.LocalPlayer

if p.Name == table.find(BAN_LIST, p.Name) then
	p:Kick("You are banned / Not whitelisted from this script. Appeal/Whitelist at DemolishSanity#9999")
end

--[[
if p.Name ~= table.find(WHITE_LIST, p.Name) then
	p:Kick("You are not whitelisted. Whitelist at DemolishSanity#9999")		
else
	print("You are whitelisted.")
end
]]--

print("Loaded")

-- Region3 Variable

local blockRegion = Region3.new(Vector3.new(), Vector3.new())
local blockRangeInStuds = 2

-- Normal Variables

local Player = game.Players.LocalPlayer
local Character = Player.Character
local HumanoidRootPart = Character.HumanoidRootPart

-- Tables

local SPELLS_TO_BLOCK = {
	"avada kedavra", -- Color3 = not found
	"crucio", -- Color3 = not found
	"imperio" -- Color3 = not found
}

-- Functions

local function BlockSpell()
	game:GetService("ReplicatedStorage").Events.WandEvent:FireServer(3)
end
local function CheckIfAble(plr, arguments)
	local char = plr.Character
	if char.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
		return false
	else
		return true
	end
end

-- Main Functions

workspace.DescendantAdded:Connect(function(Descendant)
	if Descendant:IsA("Attachment") then
		local SPELL = Descendant
		local timer = 100
		
			spawn(function()
				while wait(0.1) do
					timer -= 1
					if (HumanoidRootPart.Position - SPELL.Position).magnitude < blockRangeInStuds then
						BlockSpell()
						break
					end
					if timer <= 0 then
						break
					end
				end
			end)
		end
end)
