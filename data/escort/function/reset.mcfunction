execute unless function escort:internal/installed run return 1
execute unless score $ready escort.data matches 1 run return 1

execute if score $enabled escort.data matches 1 run function escort:internal/stop

function escort:internal/mob/despawn

execute as @a run attribute @s generic.max_health base set 20
execute store result score $playerHealth.current escort.data run data get entity @a[limit=1] Health
execute store result score $playerHealth.max escort.data run attribute @a[limit=1] minecraft:generic.max_health base get
execute if score $playerHealth.current escort.data > $playerHealth.max escort.data run function escort:internal/update_player_health
execute if score $playerHealth.current escort.data < $playerHealth.max escort.data run effect give @a minecraft:regeneration 10 255 true

execute as @a run function escort:internal/reset_gamemode

scoreboard players reset $mobHealth escort.data
scoreboard players reset $playerHealth.current escort.data
scoreboard players reset $playerHealth.max escort.data
scoreboard players reset $damageTimer escort.data
scoreboard players reset $outOfRangeTimer escort.data
scoreboard players reset $previousOutOfRange escort.data
scoreboard players reset @a escort.dragonsKilled

scoreboard players set $ready escort.data 0
scoreboard players set $enabled escort.data 0
