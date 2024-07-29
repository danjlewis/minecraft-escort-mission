function escort:stop

title @a times 10 40 10
title @a title ["", {"text": "Game over!", "color": "red"}]
title @a times 10 70 20

data modify entity @e[tag=escort.ghost, limit=1] Silent set value true
kill @e[tag=escort.ghost]

# TODO: test whether this is necessary; does NoAI = true disable explosions already in progress?
data modify entity @e[tag=escort.mob, limit=1] ExplosionRadius set value 0

# TODO: fine-tune levitation level
effect give @e[tag=escort.mob] minecraft:levitation infinite 3 true
effect give @e[tag=escort.mob] minecraft:regeneration infinite 0 true
schedule function escort:internal/mob/despawn_dramatic 5s

function escort:reset
