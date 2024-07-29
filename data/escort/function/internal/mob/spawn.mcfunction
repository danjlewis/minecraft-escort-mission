execute if entity @e[tag=escort.mob] run return 1

summon minecraft:creeper ~ ~ ~ {Tags: ["escort.mob"], Invulnerable: true, NoAI: true, PersistenceRequired: true, DeathLootTable: "minecraft:empty", ExplosionRadius: 24}
effect give @e[tag=escort.mob] minecraft:glowing infinite 0 true

execute at @e[tag=escort.mob] run summon minecraft:vex ~ ~-1 ~ {Tags: ["escort.ghost"], Invulnerable: true, NoAI: true, NoGravity: true, PersistenceRequired: true, DeathLootTable: "minecraft:empty"}
effect give @e[tag=escort.ghost] minecraft:invisibility infinite 0 true
