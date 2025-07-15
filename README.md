# 🧰 Brookhaven Tool - Roblox Script

Este repositório contém uma ferramenta personalizada para o jogo Brookhaven 🏡RP, criada em Luau (linguagem usada no Roblox). 
A ferramenta permite você usar funcionalidades prontas para o seu script de brookhaven.

## 📦 Codigo de importação

```lua
local brookhavenTool = loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/brookhaven-tool/refs/heads/main/main.luau"))()
```

Esse comando faz o seguinte:
- Baixa o script principal diretamente do GitHub.
- Executa o script e retorna um objeto com funções utilitárias.

## 🛠️ Funcionalidades

**spectatePlayer**

📌 Sintaxe:
```lua
brookhavenTool:spectatePlayer({isActive, playerName})
```

🔍 Parâmetros:

- isActive (boolean): Se true, inicia o espectador. Se false, para de espectar.
- playerName (string): Nome exato do jogador que você deseja espectar.

✅ Exemplo de uso:

```lua
brookhavenTool:spectatePlayer({true, "Laelmano24"})
```

⚠️ Aviso

Este script é feito para fins educacionais e experimentais. O uso de scripts de terceiros pode violar os Termos de Serviço da Roblox, podendo resultar em banimento. Use por sua conta e risco.

🛠 Autor
Laelmano24 - https://github.com/Laelmano24
