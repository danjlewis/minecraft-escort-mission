effect clear @e[tag=escort.mob] minecraft:glowing
effect give @e[tag=escort.mob] minecraft:invisibility infinite 0 true

scoreboard players set $dramaticExplosionCounter escort.data 10
function escort:internal/mob/despawn_dramatic_loop

function escort:internal/mob/despawn
