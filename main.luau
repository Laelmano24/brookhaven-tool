local modules = {}
local Players = game.Players
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

if shared.connectCharacter then shared.connectCharacter:Disconnect() end
shared.connectCharacter = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    HumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

function modules:spectatePlayer(tableinfo: table)

    local value = tableinfo.value or tableinfo[1]
    local targetName = tableinfo.targetName or tableinfo[2]

    if not value or not targetName then print("Tem valores que não foram passado") end

    getgenv().spectatePlayer = value

    if not getgenv().spectatePlayer then Camera.CameraSubject = Humanoid end

    local function infoErro(text: string)
        Camera.CameraSubject = Humanoid
        warn("[Error] " .. text)
    end

    local targetPlayer = Players:FindFirstChild(targetName)
    local targetCharacter = (targetPlayer and (targetPlayer.Character or targetPlayer.CharacterAdded:Wait())) or nil
    if not targetPlayer or not targetCharacter then return infoErro("O target não existe") end

    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    if not targetHumanoid then return infoErro("O humanoid do target não existe") end

    while getgenv().spectatePlayer do
        
        local targetPlayer = Players:FindFirstChild(targetName)
        local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")

        if not targetPlayer and not targetHumanoid then return infoErro("Alvo do target deixou de existir") end

        Camera.CameraSubject = targetHumanoid
        task.wait()
    end
end

return modules