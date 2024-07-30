execute unless function escort:internal/installed run return 1
execute unless score $ready escort.data matches 1 run return 1

execute if score $enabled escort.data matches 1 run function escort:internal/stop

function escort:internal/mob/despawn

execute as @a run function escort:internal/reset_gamemode

scoreboard players reset $mobHealth escort.data
scoreboard players reset $damageTimer escort.data
scoreboard players reset $outOfRangeTimer escort.data
scoreboard players reset $previousOutOfRange escort.data
scoreboard players reset @a escort.dragonsKilled

scoreboard players set $ready escort.data 0
scoreboard players set $enabled escort.data 0
