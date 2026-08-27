local utils = require("utils")

local actions = {}

actions.list = {}


function actions.build()

    actions.list = {}

    -- Atacar com espada
    local  swordAttack = {
        description = 'Atacar com a espada.',
        requirement = nil,
        execute = function (playerData, creatureData)
            -- Definição de chance de sucesso
            local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
            local success = math.random() <= successChance

            -- Calcular dano
            local rawDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            if success then
                -- Aplicar dano em caso de sucesso
                creatureData.health = creatureData.heath - damage

                -- Apresentar resultado como print
                print(string.format( "%s atacou a criatura e deu %d pontos de dano", playerData.name, damage ))
                local healthRate = math.floor((creatureData.heath / creatureData.maxHeath) * 10)
                print(string.format( "%s: %s", creatureData.name, utils.getProgressBar(healthRate)))

            else
                print(string.format( "%s tentou atacar, mas esqueceu a espada na mochila.", playerData.name))
            end
        end
    }

    -- Usar poção de regeneração
    local regenPotion = {
        description = "Tomar poção de regeneração",
        requirement = function ( playerData, creatureData )
            return playerData.potions >= 1
        end,
        execute = function(playerData, creatureData)
            -- Tirar poção do inventário
            playerData.potions = playerData.potions - 1

            -- Recuperar vida
            local regenPoints = 10
            playerData.health = math.min( playerData.maxHealth, playerData.health + regenPoints )
            print(string.format( "%s usou uma poção e recuperou alguns pontos de vida.", playerData.name))
        end
    }

    -- Populate list
    actions.list[#actions.list + 1] = swordAttack
    actions.list[#actions.list + 1] = regenPotion

end


--- Retorna uma lista de ações válidas
--- @param playerData table Definiçãp do jogador
--- @param creatureData table Definição da criatura
--- @return table
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end
    return validActions
end

return actions