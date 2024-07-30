execute unless score $dramaticExplosionCounter escort.data matches 1.. run return run scoreboard players reset $dramaticExplosionCounter escort.data

execute at @e[tag=escort.mob] run summon minecraft:creeper ~ ~ ~ {Tags: ["escort.dramaticExplosionCreeper"], ExplosionRadius: 0, Fuse: 0s, ignited: true}
effect give @e[tag=escort.dramaticExplosionCreeper] minecraft:invisibility infinite 0 true

scoreboard players remove $dramaticExplosionCounter escort.data 1
function escort:internal/mob/despawn_dramatic_loop
