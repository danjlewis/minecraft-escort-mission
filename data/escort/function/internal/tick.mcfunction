execute unless function escort:internal/installed run return 1

execute if score $enabled escort.data matches 0 at @e[tag=escort.mob, predicate=escort:levitating] run particle minecraft:effect ~ ~ ~ 0.5 0.5 0.5 0.5 20

execute unless score $enabled escort.data matches 1 run return 1

execute store result storage escort:settings escortRange int 1.0 run scoreboard players get $escortRange escort.settings
execute if entity @e[tag=escort.mob] run function escort:internal/mob/tick with storage escort:settings

# TODO: portal logic

execute if score $enabled escort.data matches 1 as @a if score @s escort.dragonsKilled matches 1.. run function escort:internal/win
execute if score $enabled escort.data matches 1 unless entity @e[tag=escort.mob] run function escort:internal/lose
