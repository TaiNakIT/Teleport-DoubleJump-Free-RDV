local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ===== THÔNG SỐ CÓ THỂ CHỈNH =====
local teleportKey = Enum.KeyCode.T -- phím teleport
local maxDistance = 120 -- khoảng cách teleport tối đa
local cooldownTime = 2 -- thời gian cooldown
local heightOffset = 3 -- độ cao sau teleport
-- =================================

local cooldown = false

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if cooldown then return end
	
	if input.KeyCode == teleportKey then
		
		local character = player.Character
		if not character then return end
		
		local root = character:FindFirstChild("HumanoidRootPart")
		if not root then return end
		
		local targetPosition = mouse.Hit.Position
		
		local distance = (targetPosition - root.Position).Magnitude
		
		if distance <= maxDistance then
			
			cooldown = true
			
			root.CFrame = CFrame.new(targetPosition + Vector3.new(0,heightOffset,0))
			
			task.wait(cooldownTime)
			
			cooldown = false
			
		end
		
	end
end)
