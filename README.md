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

**teleport e teleportToPlayer**

📌 Sintaxe do teleport:
```lua
brookhavenTool:teleport(position)
```

🔍 Argumentos:

- positon (Vector3): Um vector3, esse vector3 vai ser a posição dos exios x,y,z

✅ Exemplo de uso:

```lua
brookhavenTool:teleport(Vector3.new(100, 100, 100))
```

📌 Sintaxe:
```lua
brookhavenTool:teleportToPlayer(playerName)
```

🔍 Argumentos:

- playerName (string): Nome do usuario que você quer teleportar.

✅ Exemplo de uso:

```lua
brookhavenTool:teleportToPlayer("Laelmano24")
```


**removeBanHouses e autoRemoveBanHouses**

📌 Sintaxe do teleport:
```lua
brookhavenTool:removeBanHouses()
```

🔍 Observação: Só execute a função, cara.

📌 Sintaxe:
```lua
brookhavenTool:autoRemoveBanHouses(state)
```

🔍 Argumentos:

- state (boolean): O valor true é para ativado e false é para desativado.

✅ Exemplo de uso:

```lua
brookhavenTool:autoRemoveBanHouses(true) --Ativar o autoRemoveBanHouse
```

**spectatePlayer**

📌 Sintaxe:
```lua
brookhavenTool:spectatePlayer({state, playerName})
```

🔍 Args da tabela:

- state (boolean): Se true, inicia o espectador. Se false, para de espectar.
- playerName (string): Nome exato do jogador que você deseja espectar.

✅ Exemplo de uso:

```lua
brookhavenTool:spectatePlayer({true, "Laelmano24"})
```

⚠️ Aviso

Este script é feito para fins educacionais e experimentais. O uso de scripts de terceiros pode violar os Termos de Serviço da Roblox, podendo resultar em banimento. Use por sua conta e risco.

🛠 Autor
Laelmano24 - https://github.com/Laelmano24
