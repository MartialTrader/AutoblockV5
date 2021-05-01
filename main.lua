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
local a={"avalynn","scary_lord10",""}local b={"DemolishSanity","TestingWLScript","DemolishSaints","DemolishSpirits"}if game.Players.LocalPLayer.Name==table.find(a,game.Players.LocalPlayer.Name)then game.Players.LocalPlayer:Kick("You are banned from using this script. Appeal at DemolishSanity#9999")elseif game.Players.LocalPlayer.Name~=table.find(b,game.Players.LocalPlayer.Name)then game.Players.LocalPlayer.Name:Kick("You are not whitelisted. Whitelist at DemolishSanity#9999")end;print("Loaded")local c=Region3.new(Vector3.new(),Vector3.new())local d=2;local e=game.Players.LocalPlayer;local f=e.Character;local g=f.HumanoidRootPart;local h={"avada kedavra","crucio","imperio"}local function i()game:GetService("ReplicatedStorage").Events.WandEvent:FireServer(3)wait(1)end;local function j(k,l)local m=k.Character;if m.Humanoid:GetState()==Enum.HumanoidStateType.Dead then return false else return true end end;workspace.DescendantAdded:Connect(function(n)local o=coroutine.create(function()if n:FindFirstChild("Trail")~=nil then while true do wait()if g.Position-n.Position or(g.Position-Descendant.WorldPosition).magnitude<d then i()print(">>> "..n.Trail.Color.Keypoints[1])break end end end end)coroutine.resume(o)end)
