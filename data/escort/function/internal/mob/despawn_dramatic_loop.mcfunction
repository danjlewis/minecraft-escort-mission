execute unless score $dramaticTntCounter escort.data matches 1.. run return 1

execute at @e[tag=escort.mob] run summon minecraft:tnt ~ ~ ~ {ExplosionRadius: 0}

scoreboard players remove $dramaticTntCounter escort.data 1
function escort:internal/mob/despawn_dramatic_loop
