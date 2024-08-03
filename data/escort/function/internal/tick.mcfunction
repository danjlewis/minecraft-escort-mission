execute unless function escort:internal/installed run return 1

execute if score $enabled escort.data matches 0 at @e[tag=escort.mob, predicate=escort:levitating] run particle minecraft:effect ~ ~ ~ 0.5 0.5 0.5 0.5 20

execute unless score $enabled escort.data matches 1 run return 1

execute store result storage escort:settings escortRange int 1.0 run scoreboard players get $escortRange escort.settings
execute if entity @e[tag=escort.mob] run function escort:internal/mob/tick with storage escort:settings

execute if score $inPortal.previous escort.data matches 0 unless score $inPortal.current escort.data matches 1 as @a[tag=!escort.portalController, predicate=escort:in_portal, limit=1] at @s run function escort:internal/enter_portal
execute if score $inPortal.previous escort.data matches 1 unless score $inPortal.current escort.data matches 0 as @a[tag=escort.portalController, predicate=!escort:in_portal, limit=1] at @s run function escort:internal/exit_portal
scoreboard players operation $inPortal.previous escort.data = $inPortal.current escort.data

execute if score $enabled escort.data matches 1 as @a if score @s escort.dragonsKilled matches 1.. run function escort:internal/win
execute as @a if score $enabled escort.data matches 1 unless entity @e[tag=escort.mob] if entity @e[tag=escort.ghost] unless score $inPortal.current escort.data matches 1 if function escort:internal/mob/in_same_dimension run function escort:internal/lose
