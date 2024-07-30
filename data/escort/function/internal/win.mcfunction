function escort:stop
data modify entity @e[tag=escort.mob, limit=1] NoAI set value false

execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master

data modify entity @e[tag=escort.ghost, limit=1] Silent set value true
kill @e[tag=escort.ghost]

data modify entity @e[tag=escort.mob, limit=1] ExplosionRadius set value 0

# TODO: fine-tune levitation level
effect give @e[tag=escort.mob] minecraft:levitation infinite 1 true
schedule function escort:internal/mob/despawn_dramatic 5s

schedule function escort:reset 6s
