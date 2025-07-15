# 🧰 Brookhaven Tool - Roblox Script

Este repositório contém uma ferramenta personalizada para o jogo Brookhaven 🏡RP, criada em Luau (linguagem usada no Roblox). 
A ferramenta permite você usar funcionalidades prontas para o seu script de brookhaven.

## 📦 Codigo de importação

```lua
local brookhavenTool = loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/brookhaven-tool/refs/heads/main/src/main.luau"))()
```

Esse comando faz o seguinte:
- Baixa o script principal diretamente do GitHub.
- Executa o script e retorna um objeto com funções utilitárias.

## 🛠️ Funcionalidades

**teleport, teleportVehicle e teleportToPlayer**

📌 Sintaxe do teleport:
```lua
brookhavenTool:teleport(position)
```

🔍 Argumentos:

- positon (Vector3): Um vector3, esse vector3 vai ser a posição dos exios x,y,z

✅ Exemplo de uso:

```lua
brookhavenTool:teleportVehicle(Vector3.new(100, 100, 100))
```

```lua
brookhavenTool:teleportVehicle(position)
```

🔍 Argumentos:

- positon (Vector3): Um vector3, esse vector3 vai ser a posição dos exios x,y,z

✅ Exemplo de uso:

```lua
brookhavenTool:teleportVehicle(Vector3.new(100, 100, 100))
```

📌 Sintaxe:
```lua
brookhavenTool:teleportToPlayer(targetName)
```

🔍 Argumentos:

- playerName (string): Nome do usuario que você quer teleportar.

✅ Exemplo de uso:

```lua
brookhavenTool:teleportToPlayer("Laelmano24")
```

**spectatePlayer**

📌 Sintaxe:
```lua
brookhavenTool:spectatePlayer({state, targetName})
```

🔍 Args da tabela:

- state (boolean): Se true, inicia o espectador. Se false, para de espectar.
- playerName (string): Nome exato do jogador que você deseja espectar.

✅ Exemplo de uso:

```lua
brookhavenTool:spectatePlayer({true, "Laelmano24"})
```

**removeBanHouses e autoRemoveBanHouses**

📌 Sintaxe do removeBanHouses:
```lua
brookhavenTool:removeBanHouses()
```

📌 Sintaxe do autoRemoveBanHouses:
```lua
brookhavenTool:autoRemoveBanHouses(state)
```

🔍 Argumentos:

- state (boolean): O valor true é para ativado e false é para desativado.

✅ Exemplo de uso:

```lua
brookhavenTool:autoRemoveBanHouses(true) --Ativar o autoRemoveBanHouse
```

**checkPlayerSittingCar**

📌 Sintaxe:
```lua
brookhavenTool:checkPlayerSittingCar({targetName, nameVehicle, onlyVehicleSeat})
```

🔍 Args da tabela:

- namePlayer (string): O nome do usuario que você quer verificar.
- playerName (string): o nome do veiculo do usuario.
- onlyVehicleSeat (boolean): O valor true é para verificar apenas o assento do piloto, caso seja false é para todos os assentos do veiculo.

✅ Exemplo de uso:

```lua
brookhavenTool:checkPlayerSittingCar({"SlaPow2025", "Laelmano24", false}) -- Saida: true
--Verificar se o usuario "SlaPow2025" está sentado no veiculo do "Laelmano24"

brookhavenTool:checkPlayerSittingCar({"SlaPow2025", "Laelmano24", true}) -- Saida: true
--Verificar se o usuario "SlaPow2025" está apenas sentado no VehicleSeat (assento do piloto) do veiculo do "Laelmano24"

```

⚠️ Aviso

Este script é feito para fins educacionais e experimentais. O uso de scripts de terceiros pode violar os Termos de Serviço da Roblox, podendo resultar em banimento. Use por sua conta e risco.

🛠 Autor
Laelmano24 - https://github.com/Laelmano24
