local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local flying = false
local speed = 50

local function fly()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if not humanoid then return end
    
    humanoid.PlatformStand = true
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = character
    
    while flying do
        local camera = workspace.CurrentCamera
        local direction = (camera.CFrame.LookVector) * speed
        bodyVelocity.Velocity = Vector3.new(direction.X, 50, direction.Z)
        wait(0.1)
    end
    
    bodyVelocity:Destroy()
    humanoid.PlatformStand = false
end

script.Parent.TouchTap:Connect(function()
    flying = not flying
    if flying then
        fly()
        end)
end
