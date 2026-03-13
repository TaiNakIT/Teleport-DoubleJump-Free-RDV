local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

--============================--
--        CONFIG               --
--============================--

local MAX_JUMPS = 2

local USE_CUSTOM_ATTACHMENT = true
local ATTACHMENT_NAME = "DoubleJumpEffect"

local PARTICLE_TEXTURE = "rbxassetid://0"

--============================--

local jumpCount = 0

local function playVFX(root)

	if USE_CUSTOM_ATTACHMENT then

		local template = ReplicatedStorage.VFX:FindFirstChild(ATTACHMENT_NAME)

		if template then

			local clone = template:Clone()
			clone.Parent = root

			game.Debris:AddItem(clone,2)

		end

	else

		local particle = Instance.new("ParticleEmitter")

		particle.Texture = PARTICLE_TEXTURE
		particle.Rate = 150
		particle.Lifetime = NumberRange.new(0.5)

		particle.Parent = root

		game.Debris:AddItem(particle,1)

	end

end

UserInputService.JumpRequest:Connect(function()

	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")

	if not humanoid or not root then return end

	if jumpCount < MAX_JUMPS then

		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

		playVFX(root)

		jumpCount += 1

	end

end)

player.CharacterAdded:Connect(function(character)

	local humanoid = character:WaitForChild("Humanoid")

	humanoid.StateChanged:Connect(function(_,state)

		if state == Enum.HumanoidStateType.Landed then
			jumpCount = 0
		end

	end)

end)
