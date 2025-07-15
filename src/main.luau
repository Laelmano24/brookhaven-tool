local modules = {}
local configs = getgenv().brookhavenTollConfig or {}
local logsError = configs.logsError or true

local Players = game.Players
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Houses = workspace["001_Lots"]
local Vehicles = workspace.Vehicles

if shared.eventMonitoringCharacter then shared.eventMonitoringCharacter:Disconnect() end

shared.eventMonitoringCharacter = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    HumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

function modules:teleport(position: Vector3)

    local function infoErro(text: string)
        if logsError then return warn("[teleport Error] " .. text) end
    end

    if not position then infoErro("Ensira um valor do tipo string") return end

    HumanoidRootPart.CFrame = CFrame.new(position)
    return true
end

function modules:teleportToPlayer(targetName: string)

    local function infoErro(text: string)
        if logsError then return warn("[teleportToPlayer Error] " .. text) end
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
        if logsError then return warn("[spectatePlayer Error] " .. text) end
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

function modules:checkPlayerSittingCar(tableInfo: table)

    local targetName = tableInfo[1] or tableInfo.targetName
    local targetVehicleName = tableInfo[2] or tableInfo.targetVehicleName
    local onlyVehicleSeat = tableInfo[3] or tableInfo.onlyVehicleSeat

    local function infoErro(text: string)
        if logsError then return warn("[checkPlayerSittingCar Error] " .. text) end
    end

    if not targetName or not targetVehicleName then return infoErro("Tem valores que não foram passados") end

    local targetVehicle = Vehicles:FindFirstChild(targetVehicleName .. "Car")
    if not targetVehicle then infoErro("O carro não existe") return end

    local targetBody = targetVehicle:FindFirstChild("Body", true)
    if not targetBody then infoErro("O body do vehicle não existe") return end

    local function checkPlayerToWeld(seatWeld)
        if not seatWeld or not seatWeld.Part1 then return false end

        local targetRootPart = seatWeld.Part1
        local targetCharacter = targetRootPart:FindFirstAncestorWhichIsA("Model")
        if not targetCharacter then return false end

        return targetCharacter.Name == targetName
    end

    for _, seat in ipairs(targetBody:GetChildren()) do
        if seat:IsA("VehicleSeat") or seat:IsA("Seat") then
            local seatWeld = seat:FindFirstChild("SeatWeld")
            if not seatWeld then continue end

            local isCorrectPlayer = checkPlayerToWeld(seatWeld)
            if isCorrectPlayer and onlyVehicleSeat and seat:IsA("VehicleSeat") then return true end
            if isCorrectPlayer and not onlyVehicleSeat then return true end
        end
    end

    return false
end

function modules:teleportVehicle(position: Vector3)

    local function infoErro(text: string)
         if logsError then return warn("[teleportVehicle Error] " .. text) end
    end

    if not position then infoErro("Ensira um valor do tipo Vector3") return end

    for _, vehicle in ipairs(Vehicles:GetChildren()) do
        local textFormat = string.gsub(vehicle.Name, "Car", "")
        if modules:checkPlayerSittingCar({LocalPlayer.Name, textFormat, true}) then
            vehicle:SetPrimaryPartCFrame(CFrame.new(position))
            return true
        end
    end

    infoErro("Você não está sentado em nenhum veiculo")
    return false
end

return modules