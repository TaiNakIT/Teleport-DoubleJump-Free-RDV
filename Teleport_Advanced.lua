local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

--============================--
--        CONFIG               --
--============================--

local TELEPORT_KEY = Enum.KeyCode.T

local MAX_DISTANCE = 120 -- khoảng cách tối đa
local COOLDOWN = 2 -- thời gian cooldown
local HEIGHT_OFFSET = 3

local USE_ANIMATION = true
local ANIMATION_ID = "rbxassetid://0"

local USE_CUSTOM_ATTACHMENT = true
local ATTACHMENT_NAME = "TeleportEffect"

local PARTICLE_TEXTURE = "rbxassetid://0"

--============================--

local cooldown = false

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
		particle.Rate = 200
		particle.Lifetime = NumberRange.new(0.5)

		particle.Parent = root

		game.Debris:AddItem(particle,1)

	end

end

UserInputService.InputBegan:Connect(function(input,processed)

	if processed then return end
	if cooldown then return end

	if input.KeyCode == TELEPORT_KEY then

		local character = player.Character
		if not character then return end

		local root = character:FindFirstChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if not root or not humanoid then return end

		local target = mouse.Hit.Position
		local distance = (target - root.Position).Magnitude

		if distance <= MAX_DISTANCE then

			cooldown = true

			if USE_ANIMATION then

				local anim = Instance.new("Animation")
				anim.AnimationId = ANIMATION_ID

				local track = humanoid:LoadAnimation(anim)
				track:Play()

			end

			playVFX(root)

			root.CFrame = CFrame.new(target + Vector3.new(0,HEIGHT_OFFSET,0))

			task.wait(COOLDOWN)

			cooldown = false

		end

	end

end)
