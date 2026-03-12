local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ===== THÔNG SỐ CÓ THỂ CHỈNH =====
local teleportKey = Enum.KeyCode.T -- đổi phím teleport
local heightOffset = 3 -- độ cao sau khi teleport
-- =================================

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	
	if input.KeyCode == teleportKey then
		
		local character = player.Character
		if not character then return end
		
		local root = character:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		local targetPosition = mouse.Hit.Position
		
		root.CFrame = CFrame.new(targetPosition + Vector3.new(0,heightOffset,0))
	end
end)
