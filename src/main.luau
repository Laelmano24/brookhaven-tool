local modules = {}
local Players = game.Players
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Houses = workspace["001_Lots"]

if shared.connectCharacter then shared.connectCharacter:Disconnect() end
shared.connectCharacter = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    HumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

function modules:teleport(position: Vector3)
    HumanoidRootPart.CFrame = CFrame.new(position)
end

function modules:teleportToPlayer(targetName: string)

    local function infoErro(text: string)
        return warn("[teleportToPlayer Error] " .. text)
    end

    if not targetName then return infoErro("Coloque o nome do jogador") end

    local targetPlayer = Players:FindFirstChild(targetName)
    local targetCharacter = (targetPlayer and (targetPlayer.Character or targetPlayer.CharacterAdded:Wait())) or nil
    if not targetPlayer or not targetCharacter then return infoErro("O target não existe") end

    local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetRootPart then return infoErro("O HumanoidRootPart do target não existe") end

    modules:teleport(targetRootPart.Position)
end

function modules:spectatePlayer(tableinfo: table)

    local value = tableinfo.value or tableinfo[1]
    local targetName = tableinfo.targetName or tableinfo[2]

    if not value or not targetName then print("Tem valores que não foram passado") end

    getgenv().spectatePlayer = value

    if not getgenv().spectatePlayer then Camera.CameraSubject = Humanoid end

    local function infoErro(text: string)
        Camera.CameraSubject = Humanoid
        warn("[spectatePlayer Error] " .. text)
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

function modules:removeBanHouses()
    
    for _, house in ipairs(Houses:GetChildren()) do
        if house.Name ~= "For Sale" then
            local bannedPart = house:FindFirstChild("BannedBlock", true)
            if bannedPart then bannedPart:Destroy() end
        end
    end

end

function modules:autoRemoveBanHouses(value: boolean)

    if value == nil then return warn("[autoRemoveBanHouses Error] Ensira o valor de ativação") end

    getgenv().autoRemoveBanHouses = value

    if not getgenv().autoRemoveBanHouses then return end

    while getgenv().autoRemoveBanHouses do
        modules:removeBanHouses()
        task.wait(0.1)
    end

end

return modules