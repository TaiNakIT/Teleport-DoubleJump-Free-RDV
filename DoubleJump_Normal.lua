local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- ===== THÔNG SỐ CÓ THỂ CHỈNH =====
local maxJumps = 2 -- số lần nhảy (2 = double jump, 3 = triple jump)
-- =================================

local jumpCount = 0

UserInputService.JumpRequest:Connect(function()

	local character = player.Character
	if not character then return end
	
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	
	if jumpCount < maxJumps then
		
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		
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
