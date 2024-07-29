execute if entity @e[tag=escort.mob] run return 1

summon minecraft:creeper ~ ~ ~ {Tags: ["escort.mob"], Invulnerable: true, NoAI: true, PersistenceRequired: true, DeathLootTable: "minecraft:empty", ExplosionRadius: 24}
effect give @e[tag=escort.mob] minecraft:glowing infinite 1 true

execute at @e[tag=escort.mob] run summon minecraft:vex ~ ~2 ~ {Tags: ["escort.ghost"], Invulnerable: true, NoAI: true, NoGravity: true, PersistenceRequired: true, DeathLootTable: "minecraft:empty"}
effect give @e[tag=escort.ghost] minecraft:invisibility infinite 1 true

execute store result score $mobHealth escort.data run data get entity @e[tag=escort.mob, limit=1] Health

scoreboard players operation $damageTimer escort.data = $damageInterval escort.settings
scoreboard players operation $outOfRangeTimer escort.data = $outOfRangeBuffer escort.settings
scoreboard players set $previouslyOutOfRange escort.data 0
