execute unless function escort:internal/installed run return 1
execute if score $ready escort.data matches 1 run return 1
execute if score $enabled escort.data matches 1 run return 1

function escort:internal/mob/spawn

execute store result storage escort:set_max_health_args maxHealth int 1.0 run scoreboard players get $mobMaxHealth escort.settings
execute as @e[tag=escort.mob] run function escort:internal/set_max_health with storage escort:set_max_health_args
execute as @a run function escort:internal/set_max_health with storage escort:set_max_health_args

execute store result score $playerHealth.current escort.data run data get entity @a[limit=1] Health
scoreboard players operation $playerHealth.previous escort.data = $playerHealth.current escort.data
execute store result score $playerHealth.max escort.data run attribute @a[limit=1] minecraft:generic.max_health base get

execute if score $playerHealth.current escort.data > $playerHealth.max escort.data run function escort:internal/update_player_health
execute if score $playerHealth.current escort.data < $playerHealth.max escort.data run effect give @a minecraft:regeneration 10 255 true

scoreboard players set $inPortal.previous escort.data 0
scoreboard players set $inPortal.current escort.data 0

scoreboard players reset @a escort.dragonsKilled

scoreboard players set $ready escort.data 1
