execute at @e[tag=escort.ghost] run forceload add ~ ~

function escort:stop

data modify entity @e[tag=escort.mob, limit=1] Silent set value true
kill @e[tag=escort.mob]

title @a times 10 40 10
title @a title ["", {"text": "Game over!", "color": "red"}]
title @a times 10 70 20

execute store result score $previousGamemode escort.data run data get entity @a[limit=1] playerGameType
gamemode spectator @a

execute at @e[tag=escort.ghost] run summon minecraft:creeper ~ ~1 ~ {Tags: ["escort.dramaticExplosionCreeper"], ExplosionRadius: 24, Fuse: 0s, ignited: true}
effect give @e[tag=escort.dramaticExplosionCreeper] minecraft:invisibility infinite 0 true

execute as @e[tag=escort.ghost] at @s run tp ~ ~2 ~
effect give @e[tag=escort.ghost] minecraft:glowing infinite 0 true
effect clear @e[tag=escort.ghost] minecraft:invisibility
