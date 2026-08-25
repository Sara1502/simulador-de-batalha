--[[
    | Prismarine Colossus
    | 
    | Enormes estátuas de prismarine que medem mais de 20 metros de altura. Sua aparência ameaçadora pode assustar até os mais bravos guerreiros.
    | Eles têm olhos turquesa brilhantes, mas um elogio não vai te ajudar muito durante uma batalha.
    | 
    | Atributos
    | Vida      ▰▰▰▰▰▰▰▰▰▰
    | Ataque    ▰▰▰▰▱▱▱▱▱▱
    | Defesa    ▰▰▰▰▰▰▰▰▰▰
    | Agilidade ▰▱▱▱▱▱▱▱▱▱

    O que você vai fazer?
    1. Atacar com a espada.
    2. Usar poção de regeneração.
    3. Atirar uma pedra.
    4. Se esconder.
    > 2

]]

-- Dependencies
local player = require("player.player")
local colossus = require("colossus.colossus")

-- Habilitar UTF-8 no terminal
os.execute("chcp 65001")


-- Header
print([[
=====================================================================
               _
    _         | |
   | | _______| |---------------------------------------------\
   |:-)_______|==[]============================================>
   |_|        | |---------------------------------------------/
              |_|

                -----------------------------------------

                        ⚔ SIMULADOR DE BATALHA ⚔

=====================================================================

            Você empunha sua espada e se prepara para lutar.
                            É hora da batalha!
                        
]])


-- Obter definição do monstro
local boss = colossus

-- Apresentar monstro

-- Loop