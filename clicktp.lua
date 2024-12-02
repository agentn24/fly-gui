local UserInputService = game:GetService("UserInputService")
local TextButton = script.Parent -- Assuming the TextButton is the parent of this script

local isTeleportEnabled = false

TextButton.MouseButton1Click:Connect(function()
    isTeleportEnabled = not isTeleportEnabled
    TextButton.Text = isTeleportEnabled and "Teleport On" or "Teleport Off"
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and isTeleportEnabled then
        local mouse = UserInputService:GetMouseLocation()
        local raycastResult = workspace:Raycast(workspace.CurrentCamera.ViewportPointToRay(mouse.X, mouse.Y))

        if raycastResult then
            local hitPosition = raycastResult.Position
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()

            character.HumanoidRootPart.CFrame = CFrame.new(hitPosition)
        end
    end
end)
