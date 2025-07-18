local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/V5/Source.lua"))()
local brookhavenTool = loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/brookhaven-tool/refs/heads/main/src/main.luau"))()

local Window = redzlib:MakeWindow({
    Title = "RH Hub",
    SubTitle = "by RH",
    SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = redzlib:GetIcon("rbxassetid://123968606273780"),
    Size = UDim2.fromOffset(60, 60),
    BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local Main = Window:MakeTab({"Main", "home"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

if shared.connectCharacter then shared.connectCharacter:Disconnect() end
shared.connectCharacter = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
end)

Main:AddSection({"Elementos"})

local playerValue
local dropdownPlayers = Main:AddDropdown({
  Name = "Players List",
  Description = "",
  Options = {},
  Default = "",
  Flag = "player list",
  Callback = function(value)
    playerValue = value
  end
})

function UptadePlayers()
  local TabPlayers = {}
  for _, player in ipairs(Players:GetPlayers()) do
    if player.Name ~= LocalPlayer.Name then
      table.insert(TabPlayers, player.Name)
    end
  end
  dropdownPlayers:Set(TabPlayers)
end

UptadePlayers()

Main:AddButton({"Atualizar lista", function()
  UptadePlayers()
end})

Main:AddButton({"Copiar skin", function()
  print("Está funcionado a função")
end})

