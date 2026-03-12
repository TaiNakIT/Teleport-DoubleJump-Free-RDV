local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- ===== THÔNG SỐ CÓ THỂ CHỈNH =====
local maxJumps = 2 -- số lần nhảy
local boostPower = 60 -- lực nhảy lần thứ 2
-- =================================

local jumpCount = 0

UserInputService.JumpRequest:Connect(function()

	local character = player.Character
	if not character then return end
	
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	
	if not humanoid or not root then return end
	
	if jumpCount < maxJumps then
		
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		
		if jumpCount == 1 then
			root.Velocity = Vector3.new(root.Velocity.X, boostPower, root.Velocity.Z)
		end
		
		jumpCount += 1
		
	end
	
end)

player.CharacterAdded:Connect(function(character)

	local humanoid = character:WaitForChild("Humanoid")

	humanoid.StateChanged:Connect(function(_, new)
		
		if new == Enum.HumanoidStateType.Landed then
			jumpCount = 0
		end
		
	end)

end)
